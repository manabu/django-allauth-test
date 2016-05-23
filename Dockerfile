FROM python:2.7.11
RUN apt-get update -qq ; apt-get install -y swig locales ; apt-get clean
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
