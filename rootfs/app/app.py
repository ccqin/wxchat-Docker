from flask import Flask, request
import logging
import os
import xml.etree.cElementTree as ET
from WXBizMsgCrypt import WXBizMsgCrypt

app = Flask(__name__)

# 配置日志
logging.basicConfig(level=logging.INFO)

# 从环境变量获取凭证
sToken = os.environ.get("WECOM_TOKEN")
sEncodingAESKey = os.environ.get("WECOM_ENCODING_AES_KEY")
sCorpID = os.environ.get("WECOM_CORP_ID")

# 检查环境变量是否设置
if not all([sToken, sEncodingAESKey, sCorpID]):
    logging.error("Missing required environment variables: WECOM_TOKEN, WECOM_ENCODING_AES_KEY, WECOM_CORP_ID")
    # 在实际部署中，这里可能需要更优雅地退出或处理
    exit(1)

@app.route('/', methods=['GET', 'POST'])
def wechat_message():
    wxcpt = WXBizMsgCrypt(sToken, sEncodingAESKey, sCorpID)
    sReqMsgSig = request.args.get('msg_signature')
    sReqTimeStamp = request.args.get('timestamp')
    sReqNonce = request.args.get('nonce')

    if request.method == 'GET':
        sReqEchoStr = request.args.get('echostr')
        try:
            sEchoStr = wxcpt.VerifyURL(sReqMsgSig, sReqTimeStamp, sReqNonce, sReqEchoStr)
            logging.info("VerifyURL success, echo str: " + sEchoStr)
            return sEchoStr
        except Exception as e:
            logging.error("VerifyURL failed: " + str(e))
            return "VerifyURL failed", 401
    
    if request.method == 'POST':
        sReqData = request.data
        try:
            sMsg = wxcpt.DecryptMsg(sReqData, sReqMsgSig, sReqTimeStamp, sReqNonce)
            logging.info("DecryptMsg success, msg: " + sMsg)
            
            # 解析 XML
            xml_tree = ET.fromstring(sMsg)
            content = xml_tree.find("Content").text
            
            # 在这里处理消息内容...
            # 例如，可以回复一条消息
            sRespData = f"""
            <xml>
               <ToUserName>{xml_tree.find("FromUserName").text}</ToUserName>
               <FromUserName>{sCorpID}</FromUserName> 
               <CreateTime>{sReqTimeStamp}</CreateTime>
               <MsgType>text</MsgType>
               <Content>You said: {content}</Content>
            </xml>
            """
            sEncryptMsg = wxcpt.EncryptMsg(sRespData, sReqNonce, sReqTimeStamp)
            return sEncryptMsg
            
        except Exception as e:
            logging.error("DecryptMsg failed: " + str(e))
            return "DecryptMsg failed", 401

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)