#!/usr/bin/env bash
#sudo docker build -t local-pics-dev .

#prod run
#sudo docker run -d --volumes-from code --name django django

#dev run
sudo docker stop omddata_local-apache2
sudo docker rm -v omddata_local-apache2
sudo docker run -itd -v ~/Documents/git/github/vending/django/localomd:/volumeCode/django/localomd \
--network omd-dev-local --ip 172.18.0.5 --network-alias localomd --name omddata_local-apache2 \
--restart=unless-stopped omddata_local-apache2


#python ../../../../proj/manage.py runserver 0.0.0.0:80 > /dev/null 2>&1 &
#python manage.py runmodwsgi --reload-on-changes --user mod_wsgi --host 0.0.0.0 --port 80  > /dev/null 2>&1 &;