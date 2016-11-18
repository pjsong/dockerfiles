FROM omd-ubuntu1604
RUN apt-get install -y git && if [ -e /volumeCode ] ;then rm -rf /volumeCode ;fi \
&& mkdir /volumeCode && cd /volumeCode && git clone --depth 1 https://pjsong:oschinadotneT8@git.oschina.net/pjsong/pics.git \
&& rm -rf /var/lib/apt/lists/* /volumeCode/pics/.git

CMD ["/bin/bash"]