bucket_name=$1
aws_key=$2
aws_access_key=$3
aws_access_secret=$4
local_path=$5

# Install required dependencies for Python script.
pip3 install boto3

# Run upload script
python3 build/upload_file_to_s3.py $bucket_name $aws_key $aws_access_key $aws_access_secret $local_path