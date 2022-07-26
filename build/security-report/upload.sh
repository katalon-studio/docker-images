ks_version=$1
bucket_name=$2
aws_access_key=$3
aws_access_secret=$4

# Install required dependencies for Python script.
pip3 install boto3

# Run upload script
echo "Uploading Trivy report..."
python3 build/security-report/upload_file_to_s3.py $bucket_name "${ks_version}/security_report_trivy.html" $aws_access_key $aws_access_secret "security_report_trivy.html"

echo "Uploading Snyk report..."
python3 build/security-report/upload_file_to_s3.py $bucket_name "${ks_version}/security_report_snyk.html" $aws_access_key $aws_access_secret "security_report_snyk.html"
