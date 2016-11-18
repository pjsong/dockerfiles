FROM omd-ubuntu1604_python-wsgi

COPY requirement.txt /
RUN  pip install -r requirement.txt \
&& useradd mod_wsgi && su mod_wsgi && rm -rf /var/lib/apt/lists/*

#ENTRYPOINT ["python", "/volumeCode/pics/proj/manage.py", "runserver", "0.0.0.0:80"]
ENTRYPOINT ["python", "/volumeCode/localomd/manage.py", "runmodwsgi", "--reload-on-changes", "--user", "mod_wsgi", "--port", "80"]
#python /volumeCode/pics/proj/manage.py runmodwsgi --reload-on-changes --user mod_wsgi --port 80
#COPY ./static /usr/local/apache2/htdocs/
