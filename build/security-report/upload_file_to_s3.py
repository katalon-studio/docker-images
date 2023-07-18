import boto3
import sys

def main():
    if (len(sys.argv) != 6):
        print ('Error: upload_file_to_s3.py required 5 arguments.')
        sys.exit(1)

    bucket_name=sys.argv[1]
    aws_key=sys.argv[2]
    aws_access_key=sys.argv[3]
    aws_access_secret=sys.argv[4]
    local_path=sys.argv[5]

    session = boto3.Session(
        aws_access_key_id=aws_access_key,
        aws_secret_access_key=aws_access_secret,
    )
    client = session.client('s3')

    print ('Bucketname - ' + bucket_name)

    response = client.upload_file(
        Filename=local_path,
        Bucket=bucket_name,
        Key=aws_key
    )
    print ('Done uploading file ' + local_path)


main()