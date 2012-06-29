# EC2 server configuration information

## Tools and Apps dev server

To connect (ssh):

```
ssh -i path/to/file.pem bitnami@ec2-184-169-246-7.us-west-1.compute.amazonaws.com
```

Connect to phpMyAdmin:
```
ssh -N -L 8888:127.0.0.1:80 -i ~/desktop/timeline.pem bitnami@ec2-184-169-246-7.us-west-1.compute.amazonaws.com
```
Browse to http://127.0.0.1:8888/phpmyadmin/index.php

oops


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
- csvkit

### GEOS

- geos 3.3.5 (see instructions below)

### Other

- CodeIgniter 2.2.1
- git
- lynx

APC 3.1.10 may also be installed.


# Specific installation instructions

## GEOS
Installed from source

```
wget http://download.osgeo.org/geos/geos-3.3.5.tar.bz2
tar xjf geos-3.3.5.tar.bz2
cd geos-3.3.5
./configure
make
sudo make install
```

# Instructions we have not yet followed:
## Install dependencies

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

## Set up database templates

```
sudo su - postgres
createdb -E UTF8 template_postgis
createlang plpgsql template_postgis
psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis';"
psql -d template_postgis -f /usr/share/postgresql/8.4/contrib/postgis.sql
psql -d template_postgis -f /usr/share/postgresql/8.4/contrib/spatial_ref_sys.sql
exit
```

## To set up a database for a specific project

```
sudo su - postgres
createdb -T template_postgis wa_boundaryservice
psql
GRANT ALL PRIVILEGES ON DATABASE wa_boundaryservice TO ubuntu;
ALTER USER ubuntu WITH PASSWORD 'secret password'
\q
exit
```

