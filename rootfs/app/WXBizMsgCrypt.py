# -*- encoding:utf-8 -*-

import base64
import string
import random
import hashlib
import time
import struct
from Crypto.Cipher import AES
import xml.etree.cElementTree as ET
import socket

"""
关于Crypto.Cipher模块，ImportError: No module named 'Crypto'解决方案
请到官方网站 https://www.dlitz.net/software/pycrypto/ 下载pycrypto。
下载后，按照README中的“Installation”小节的提示进行安装。
或者在pip环境下，pip install pycryptodome
"""
class FormatException(Exception):
    pass

def throw_exception(message, exception_class=FormatException):
    """my define raise exception"""
    raise exception_class(message)

class SHA1:
    """计算企业微信API签名"""

    def getSHA1(self, token, timestamp, nonce, encrypt):
        """用SHA1算法生成安全签名
        @param token:  票据
        @param timestamp: 时间戳
        @param nonce: 随机字符串
        @param encrypt: 密文
        @return: 安全签名
        """
        try:
            sortlist = [token, timestamp, nonce, encrypt]
            sortlist.sort()
            sha = hashlib.sha1()
            sha.update("".join(sortlist).encode())
            return  sha.hexdigest()
        except Exception as e:
            # print e
            throw_exception(e, FormatException)


class XMLParse:
    """提供提取消息格式中的密文及生成回复消息格式的接口"""

    # xml消息模板
    AES_TEXT_RESPONSE_TEMPLATE = """<xml>
<Encrypt><![CDATA[%(msg_encrypt)s]]></Encrypt>
<MsgSignature><![CDATA[%(msg_signature)s]]></MsgSignature>
<TimeStamp>%(timestamp)s</TimeStamp>
<Nonce><![CDATA[%(nonce)s]]></Nonce>
</xml>"""

    def extract(self, xmltext):
        """提取出xml数据包中的加密消息
        @param xmltext: 待提取的xml字符串
        @return: 提取出的加密消息字符串
        """
        try:
            xml_tree = ET.fromstring(xmltext)
            encrypt = xml_tree.find("Encrypt")
            return  encrypt.text
        except Exception as e:
            # print e
            throw_exception(e, FormatException)

    def generate(self, encrypt, signature, timestamp, nonce):
        """生成xml消息
        @param encrypt: 加密后的消息密文
        @param signature: 安全签名
        @param timestamp: 时间戳
        @param nonce: 随机字符串
        @return: 生成的xml字符串
        """
        resp_dict = {
                    'msg_encrypt' : encrypt,
                    'msg_signature': signature,
                    'timestamp'    : timestamp,
                    'nonce'        : nonce,
                     }
        resp_xml = self.AES_TEXT_RESPONSE_TEMPLATE % resp_dict
        return resp_xml

class PKCS7Encoder():
    """提供基于PKCS7算法的加解密接口"""

    key_size = 32
    block_size = 16
    def encode(self, text):
        """ 对需要加密的明文进行填充补位
        @param text: 需要进行填充补位操作的明文
        @return: 补齐明文字符串
        """
        text_length = len(text)
        # 计算需要填充的位数
        amount_to_pad = self.block_size - (text_length % self.block_size)
        if amount_to_pad == 0:
            amount_to_pad = self.block_size
        # 获得补位所用的字符
        pad = chr(amount_to_pad).encode()
        return text + pad * amount_to_pad

    def decode(self, decrypted):
        """删除解密后明文的补位字符
        @param decrypted: 解密后的明文
        @return: 删除补位字符后的明文
        """
        pad = ord(decrypted[-1])
        if pad<1 or pad > self.block_size:
            pad = 0
        return decrypted[:-pad]


class Prpcrypt:
    """提供接收和推送给企业微信消息的加解密接口"""

    def __init__(self, key):
        #self.key = base64.b64decode(key+"=")
        self.key = key
        # 设置加解密模式为AES的CBC模式
        self.mode = AES.MODE_CBC


    def encrypt(self, text, corpid):
        """对明文进行加密
        @param text: 需要加密的明文
        @return: 加密得到的字符串
        """
        # 16位随机字符串添加到明文开头
        text = self.get_random_str() + struct.pack("I", socket.htonl(len(text))) + text + corpid
        # 使用自定义的填充方式对明文进行补位填充
        pkcs7 = PKCS7Encoder()
        text = pkcs7.encode(text)
        # 加密
        cryptor = AES.new(self.key, self.mode, self.key[:16])
        try:
            ciphertext = cryptor.encrypt(text)
            # 使用BASE64对加密后的字符串进行编码
            return base64.b64encode(ciphertext).decode('utf-8')
        except Exception as e:
            # print e
            throw_exception(e, FormatException)

    def decrypt(self, text, corpid):
        """对解密后的明文进行补位删除
        @param text: 密文
        @return: 删除填充补位后的明文
        """
        try:
            cryptor = AES.new(self.key, self.mode, self.key[:16])
            # 使用BASE64对密文进行解码，然后AES-CBC解密
            plain_text = cryptor.decrypt(base64.b64decode(text))
        except Exception as e:
            # print e
            throw_exception(e, FormatException)
        try:
            # pkcs7 = PKCS7Encoder()
            # plain_text = pkcs7.decode(plain_text)
            # 去掉补位字符串
            # pad = plain_text[-1]
            # # 去除16位随机字符串
            # content = plain_text[16:-pad]
            pad = plain_text[-1]
            # if pad < 1 or pad > 32:
                # pad = 0
            content = plain_text[16:-pad]
            xml_len = socket.ntohl(struct.unpack("I", content[ : 4])[0])
            xml_content = content[4 : xml_len+4]
            from_corpid = content[xml_len+4:]
        except Exception as e:
            # print e
            throw_exception(e, FormatException)
        if from_corpid.decode() != corpid:
            throw_exception("corpid dismatch", FormatException)
        return xml_content

    def get_random_str(self):
        """ 随机生成16位字符串
        @return: 16位字符串
        """
        rule = string.ascii_letters + string.digits
        str = random.sample(rule, 16)
        return "".join(str).encode()

class WXBizMsgCrypt(object):
    #构造函数
    #@param sToken: 企业微信后台，开发者设置的Token
    #@param sEncodingAESKey: 企业微信后台，开发者设置的EncodingAESKey
    #@param sCorpId: 企业号的CorpId
    def __init__(self,sToken,sEncodingAESKey,sCorpId):
        try:
            self.key = base64.b64decode(sEncodingAESKey+"=")
            assert len(self.key) == 32
        except Exception as e:
            throw_exception("[error]: EncodingAESKey unvalid !", FormatException)
            # print e
        self.m_sToken = sToken
        self.m_sCorpId = sCorpId

        #验证URL
        #@param sMsgSignature: 签名串，对应URL参数的msg_signature
        #@param sTimeStamp: 时间戳，对应URL参数的timestamp
        #@param sNonce: 随机串，对应URL参数的nonce
        #@param sEchoStr: 随机串，对应URL参数的echostr
        #@return: 解密之后的echostr
    def VerifyURL(self,sMsgSignature,sTimeStamp,sNonce,sEchoStr):
        sha1 = SHA1()
        signature = sha1.getSHA1(self.m_sToken, sTimeStamp, sNonce, sEchoStr)
        if not signature == sMsgSignature:
            throw_exception("[error]: signature unvalid !", FormatException)
        pc = Prpcrypt(self.key)
        ret,sReplyEchoStr = pc.decrypt(sEchoStr,self.m_sCorpId)
        if( ret != 0 ):
            throw_exception("[error]: decrypt echostr failed!", FormatException)
        return sReplyEchoStr

    def EncryptMsg(self, sReplyMsg, sNonce, timestamp = None):
        #将回复的消息打包成xml格式
        pc = Prpcrypt(self.key)
        sEncryptMsg = pc.encrypt(sReplyMsg, self.m_sCorpId)
        if timestamp is None:
            timestamp = str(int(time.time()))
        #生成安全签名
        sha1 = SHA1()
        sSignature = sha1.getSHA1(self.m_sToken, timestamp, sNonce, sEncryptMsg)
        xmlParse = XMLParse()
        return xmlParse.generate(sEncryptMsg, sSignature, timestamp, sNonce)

    def DecryptMsg(self, sPostData, sMsgSignature, sTimeStamp, sNonce):
        #解析出xml中的密文
        xmlParse = XMLParse()
        sEncryptMsg = xmlParse.extract(sPostData)
        #验证安全签名
        sha1 = SHA1()
        sSignature = sha1.getSHA1(self.m_sToken, sTimeStamp, sNonce, sEncryptMsg)
        if not sSignature == sMsgSignature:
            throw_exception("[error]: signature unvalid !", FormatException)
        #解密
        pc = Prpcrypt(self.key)
        sMsg = pc.decrypt(sEncryptMsg,self.m_sCorpId)
        return sMsg