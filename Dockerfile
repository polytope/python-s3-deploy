FROM python:3.5.1

# required to install zip
RUN apt-get update
# required for packaging up the application
RUN apt-get install -y zip
# install boto
RUN pip install boto3==1.3.0

COPY ./s3_deploy.py /scripts/s3_deploy.py
COPY ./beanstalk_deploy.py /scripts/beanstalk_deploy.py

ENTRYPOINT python /scripts/s3_deploy.py