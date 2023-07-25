import mediafire
from mediafire import MediaFireApi
from mediafire import MediaFireUploader

def main():   
    api = MediaFireApi()
    uploader = MediaFireUploader(api)
    session = api.user_get_session_token(
        email='hieubui9981@gmail.com',
        password='Zxcv@1234',
        app_id='42511')

    api.session = session
    response = api.user_get_info()
    fd = open('security-report/security_report_trivy.html', 'rb')
    fd2 = open('security-report/security_report_snyk.html', 'rb')
    result = uploader.upload(fd, 'security_report_trivy.html',
                            folder_key='mchfgf0q7jrir')
    result = uploader.upload(fd2, 'security_report_snyk.html',
                            folder_key='mchfgf0q7jrir')     
    

main()