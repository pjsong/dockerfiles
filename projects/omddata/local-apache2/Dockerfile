# digitaiocean how to serve django-application with apache and modwsgi on ubuntu 14 04
# https://www.digitalocean.com/community/tutorials/how-to-create-a-ssl-certificate-on-apache-for-ubuntu-14-04

FROM omd-apache2_python-wsgi

ENV prjPath="/volumeCode/django/localomd" prjName="localomd" \
     appName="localomddata" prjQualifiedName="/volumeCode/django/localomd/localomd"

COPY requirement.txt /
COPY ssl /ssl
RUN  pip install -r requirement.txt \
# enable when use git to clone code.
# && chown :www-data ${prjPath} \
&& useradd mod_wsgi && su mod_wsgi && rm -rf /var/lib/apt/lists/* \
&& cd /etc/apache2/sites-available \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ Alias \/static\ ${prjPath}\/static" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ <Directory\ ${prjPath}\/static>" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ \ \ \ \ Require\ all\ granted" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ <\/Directory>" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ <Directory\ ${prjQualifiedName}>" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ \ \ \ \ <Files\ wsgi.py>" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Require\ all\ granted" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ \ \ \ \ <\/Files>" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ <\/Directory>" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ WSGIDaemonProcess\ ${prjName}\ python-path=${prjPath}" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ WSGIProcessGroup\ ${prjName}" 000-default.conf \
&& sed -i "/<\/VirtualHost>/i\ \ \ \ \ \ \ \ WSGIScriptAlias\ \/\ ${prjQualifiedName}/wsgi.py" 000-default.conf \

&& sed -i 's/\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/\/ssl\/omd-dev-local.crt/1' default-ssl.conf \
&& sed -i 's/\/etc\/ssl\/private\/ssl-cert-snakeoil.key/\/ssl\/omd-dev-local.key/1' default-ssl.conf \
&& a2ensite default-ssl.conf

# && chmod 664 /opt/myproject/db.sqlite3

# && chown :www-data /opt/myproject/db.sqlite3
CMD ["apache2", "start"]


#&& pip3 install --upgrade pip && ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip \
#&& pip install mod_wsgi django mysqlclient


#ENTRYPOINT ["python", "/volumeCode/pics/proj/manage.py", "runserver", "0.0.0.0:80"]
#ENTRYPOINT ["python", "/volumeCode/localomd/manage.py", "runmodwsgi", "--reload-on-changes", "--user", "mod_wsgi", "--port", "80"]
#python /volumeCode/pics/proj/manage.py runmodwsgi --reload-on-changes --user mod_wsgi --port 80
#COPY ./static /usr/local/apache2/htdocs/
