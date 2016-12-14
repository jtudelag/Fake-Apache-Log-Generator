FROM centos:7

MAINTAINER Jorge Tudela <jorgetgr87@gmail.com>

RUN  yum install -y epel-release

RUN  yum install -y \
     python-pip \
     && pip install --upgrade pip 
     
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

COPY apache-fake-log-gen.py /opt/

ENTRYPOINT ["python","/opt/apache-fake-log-gen.py","-n","0"]
