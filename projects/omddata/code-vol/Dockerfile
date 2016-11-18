FROM omd-ubuntu1604
RUN if [ -e /volumeCode ] ;then rm -rf /volumeCode ;fi \
&& mkdir /volumeCode && cd /volumeCode && git clone --branch prd --depth 1 https://github.com/pjsong/vending.git \
&& rm -rf /var/lib/apt/lists/* /volumeCode/.git

CMD ["/bin/bash"]
#VOLUME /volumeCode