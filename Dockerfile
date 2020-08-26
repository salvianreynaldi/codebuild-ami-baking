FROM debian:buster-slim
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y --no-install-recommends software-properties-common git python-pip unzip && apt-add-repository ppa:ansible/ansible && \
    apt install -y ansible
RUN pip install --upgrade pip boto3 botocore awscli

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/local/bin/jq
ADD https://releases.hashicorp.com/packer/1.3.1/packer_1.3.1_linux_amd64.zip aws-ebs-traveloka-ansible.json /root/

RUN unzip /root/packer_1.3.1_linux_amd64.zip -d /usr/local/bin && chmod +x /usr/local/bin/jq
