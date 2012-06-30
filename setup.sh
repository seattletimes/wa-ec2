sudo apt-get update
sudo apt-get install git-core

sudo apt-get install binutils
sudo apt-get install gdal-bin
sudo apt-get install libproj-dev
sudo apt-get install postgresql-8.4-postgis
sudo apt-get install postgresql-server-dev-8.4
sudo apt-get install python-psycopg2

sudo apt-get install python-setuptools
sudo apt-get install python-dev
sudo apt-get install build-essential
sudo easy_install pip
sudo pip install virtualenv

sudo su - postgres
createdb -E UTF8 template_postgis
createlang plpgsql template_postgis
psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis';"
psql -d template_postgis -f /usr/share/postgresql/8.4/contrib/postgis.sql
psql -d template_postgis -f /usr/share/postgresql/8.4/contrib/spatial_ref_sys.sql
exit

