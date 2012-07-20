# EC2 server configuration information

## Tools and Apps dev server

### To connect (ssh):
```
ssh -i path/to/file.pem bitnami@ec2-184-169-246-7.us-west-1.compute.amazonaws.com
```

### To start/stop/status apache2/mysql:
```
sudo /opt/bitnami/ctlscript.sh [start|stop|status] [apache|mysql]
```

Apache conf file located at `opt/bitnami/apache2/conf/httpd.conf`

### To connect to phpMyAdmin:
```
ssh -N -L 8888:127.0.0.1:80 -i ~/desktop/timeline.pem bitnami@ec2-184-169-246-7.us-west-1.compute.amazonaws.com
```
Browse to http://127.0.0.1:8888/phpmyadmin/index.php

### To set up a database for a specific project:
```
sudo su - postgres
createdb -T template_postgis wa_boundaryservice
psql
GRANT ALL PRIVILEGES ON DATABASE wa_boundaryservice TO django;
GRANT ALL PRIVILEGES ON TABLE spatial_ref_sys TO django;
GRANT ALL PRIVILEGES ON TABLE geometry_columns TO django;
ALTER USER django WITH PASSWORD 'secret password'
\q
exit
```

### Locations of files:
httpd.conf: `/opt/bitnami/apache2/conf/httpd.conf`
cltscript.sh: `/opt/bitnami/ctlscript.sh`

## Software that comes with the image

### BitNami LAMP stack

- Apache 2.2.19
- MySQL 5.1.56
- PHP 5.3.8
- PHPMyAdmin 3.4.4

### Python

- pip
- python-dev
- virtualenv
- mysql-python
- csvkit
- gunicorn

### GEOS

- geos 3.3.5 (see instructions below)

### Other

- CodeIgniter 2.2.1
- git
- lynx
- gdal
- apache2-dev

APC 3.1.10 may also be installed.


## Specific installation instructions

### GEOS
Installed from source

```
wget http://download.osgeo.org/geos/geos-3.3.5.tar.bz2
tar xjf geos-3.3.5.tar.bz2
cd geos-3.3.5
./configure
make
sudo make install
```

### Install dependencies

```
sudo apt-get update
sudo apt-get install git-core
```

Following [this documentation](https://docs.djangoproject.com/en/dev/ref/contrib/gis/install/#ubuntudebian) from the Django website:

```
sudo apt-get install binutils
sudo apt-get install gdal-bin
sudo apt-get install libproj-dev
sudo apt-get install postgresql-8.4-postgis
sudo apt-get install postgresql-server-dev-8.4
sudo apt-get install python-psycopg2
```

Following [this documentation](http://www.saltycrane.com/blog/2010/02/how-install-pip-ubuntu/):

```
sudo apt-get install python-setuptools
sudo apt-get install python-dev
sudo apt-get install build-essential
sudo easy_install pip
sudo pip install virtualenv
```


## Conf settings changes
Postgres conf file - local authentication via password

Apache conf file:
```
<VirtualHost *:80>
    WSGIDaemonProcess appjungle.seattletimes.com processes=2 threads=15 display-name=%{GROUP} python-path=/opt/django/wa-boundaryservice:/opt/django/wa-boundaryservice/venv/lib/python2.6/site-packages user=bitnami
    WSGIProcessGroup appjungle.seattletimes.com

    WSGIScriptAlias /django/boundaries /opt/django/wa-boundaryservice/waboundaries/wsgi.py

    <Directory /opt/django/wa-boundaryservice/waboundaries>
        <Files wsgi.py>
        Order allow,deny
        Allow from all
        </Files>
    </Directory>

    Alias /static/ /opt/django/static/

    <Directory /opt/django/static>
        Order allow,deny
        Allow from all
    </Directory>

</VirtualHost>
```

