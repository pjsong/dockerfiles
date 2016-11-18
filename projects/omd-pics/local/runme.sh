#!/usr/bin/env bash
#sudo docker build -t local-pics-dev .

#prod run
#sudo docker run -d --volumes-from code --name django django

#dev run
sudo docker stop omd-pics_local
sudo docker rm -v omd-pics_local
sudo docker run -itd -v ~/Documents/git/oschina/pics:/volumeCode/pics \
--network omd-dev-local --ip 172.18.0.3 --network-alias local-pics-dev --name omd-pics_local \
--restart=unless-stopped omd-pics_local


#python ../../../../proj/manage.py runserver 0.0.0.0:80 > /dev/null 2>&1 &
#python manage.py runmodwsgi --reload-on-changes --user mod_wsgi --host 0.0.0.0 --port 80  > /dev/null 2>&1 &;