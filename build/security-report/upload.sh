ks_version=$1
aws_bucket_name=$2
aws_access_key=$3
aws_access_secret=$4

# Install required dependencies for Python script.
# pip3 install boto3

# # Run upload script
# echo "Uploading Trivy report..."
# python3 build/security-report/upload_file_to_s3.py $aws_bucket_name "${ks_version}/security_report_trivy.html" $aws_access_key $aws_access_secret "security_report_trivy.html"

# echo "Uploading Snyk report..."
# python3 build/security-report/upload_file_to_s3.py $aws_bucket_name "${ks_version}/security_report_snyk.html" $aws_access_key $aws_access_secret "security_report_snyk.html"

pip install mediafire

from mediafire import MediaFireApi
from mediafire import MediaFireUploader
api = MediaFireApi()
uploader = MediaFireUploader(api)
session = api.user_get_session_token(
    email='hieubui9981@gmail.com',
    password='Zxcv@1234',
    app_id='42511')

api.session = session
response = api.user_get_info()
fd = "${ks_version}/security_report_trivy.html"
fd2 = "${ks_version}/security_report_snyk.html"
result = uploader.upload(fd, 'security_report_trivy.html',
                         folder_key='mchfgf0q7jrir')
result = uploader.upload(fd2, 'security_report_snyk.html',
                         folder_key='mchfgf0q7jrir')                         