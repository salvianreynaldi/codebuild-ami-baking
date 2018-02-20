FROM williamyeh/ansible:ubuntu16.04-onbuild
RUN apt-get update && apt-get install -y --no-install-recommends python-pip git unzip
RUN pip install awscli==1.14.39

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/local/bin/jq
ADD https://releases.hashicorp.com/packer/1.1.2/packer_1.1.2_linux_amd64.zip /root/packer.zip
ADD https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip /root/terraform.zip
ADD aws-ebs-traveloka-ansible.json /root/

RUN unzip /root/packer.zip -d /usr/local/bin
RUN unzip /root/terraform.zip -d /usr/local/bin
RUN chmod +x /usr/local/bin/jq
