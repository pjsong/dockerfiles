FROM omd-apache2
RUN apt-get install -y nano \
#&& python3 python3-dev
python3-pip libapache2-mod-wsgi-py3 libmysqlclient-dev \
&& ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip && pip install -U pip
CMD ["/bin/bash"]