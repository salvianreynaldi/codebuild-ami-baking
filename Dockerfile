FROM openjdk:8-jdk-slim
RUN apt-get update && apt-get install -y --no-install-recommends python-pip=9.0.1-2 git=1:2.11.0-3+deb9u2
RUN pip install setuptools wheel
RUN pip install ansible==2.4.3.0
RUN pip install awscli==1.14.39
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/local/bin/jq
ADD https://releases.hashicorp.com/packer/1.1.2/packer_1.1.2_linux_amd64.zip /root/packer.zip
RUN unzip /root/packer.zip -d /usr/local/bin
ADD get-random-subnet.sh /usr/local/bin/get-random-subnet
ADD aws-ebs-traveloka-ansible.json /root/
RUN chmod +x /usr/local/bin/jq
RUN chmod +x /usr/local/bin/get-random-subnet
