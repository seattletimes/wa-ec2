		      BitNami LAMP Stack 5.3.8-0
		    ===========================

1. OVERVIEW

The BitNami Project was created to help spread the adoption of freely
available, high quality, open source web applications. BitNami aims to make
it easier than ever to discover, download and install Open Source software 
such as document and content management systems, wikis and blogging 
software.

You can learn more about BitNami at http://bitnami.org

BitName LAMP Stack is an easy to install and easy to use open source Web 
Platform. It combines leading open source projects, such as Apache, MySQL 
and PHP with BitRock's extensive open source expertise to provide a consistent, 
painless way to deploy LAMP in any Linux environment.

You can learn more about BitNami Stacks at http://bitnami.org/stacks/

2. FEATURES

- Easy to Install

BitNami Stacks are built with one goal in mind: to make it as easy as
possible to install open source software. Our installers completely automate
the process of installing and configuring all of the software included in
each Stack, so you can have everything up and running in just a few clicks.

- Independent

BitNami Stacks are completely self-contained, and therefore do not interfere
with any software already installed on your system. For example, you can
upgrade your system's MySQL or Apache Tomcat without fear of 'breaking' your
BitNami Stack.

- Integrated

By the time you click the 'finish' button on the installer, the whole stack
will be integrated, configured and ready to go. 

- Relocatable

BitNami Stacks can be installed in any directory. This allows you to have
multiple instances.

3. COMPONENTS

BitNami LAMP Stack ships with the following software versions:
 
   - Apache 2.2.19
   - MySQL 5.1.56
   - PHP 5.3.8
   - PHPMyAdmin 3.4.4


4. REQUIREMENTS

To install BitNami LAMP Stack you will need:

    - Intel x86 or compatible processor
    - Minimum of 256 MB RAM
    - Minimum of 150 MB hard drive space
    - An x86 Linux operating system
    - TCP/IP protocol support


5. INSTALLATION

The BitNami LAMP Stack is distributed as a binary executable installer.
It can be downloaded from:

http://www.bitnami.org/stacks/

The downloaded file will be named something similar to:

bitnami-lampstack-5.3.8-0-linux-installer.bin on Linux

You can install BitNami LAMP Stack in graphical, text and unattended modes. 
By default the graphical mode will be used.

On Linux, you will need to give it executable permissions:

chmod 755 bitnami-lampstack-5.3.8-0-linux.bin

You will be greeted by the 'Welcome' screen. Pressing 'Next' will take you 
to the 'License Agreement' page.

You must accept the agreement to continue the installation. The next step is 
to select the installation directory. The default installation path will be a 
folder on your home directory if you are running the installer as a regular
user, or /opt/lampstack-5.3.8-0, if you are running the installation as root. If 
the destination directory does not exist, it will be created as part of the
installation.

After selecting the installation directory you will be asked for the password 
to the initial MySQL root and anonymous accounts. This password cannot be empty.

The default listening port for Apache is 8080 and for MySQL is 3006. If those 
ports are already in use by other applications, you will be prompted for 
alternate ports to use. Remember that if you plan to run both applications as a 
regular user you should select port numbers above 1024.

Finally, the installer will ask you for the initial password to access the your 
phpMyAdmin installation through the web. This password cannot be empty.

You are now ready to begin the installation, which will start when you press 
'Next'. 

Once the installation process has been completed, you will see the 'Installation 
Finished' page.

If you receive an error message during installation, please refer to the 
Troubleshooting section.

The rest of this guide assumes that you installed BitRock LAMP Stack in 
/home/user/lampstack-5.3.8-0 and that you use port 8080 for Apache and 3306 for MySQL.

6. STARTING AND STOPPING BITNAMI LAMP STACK

To enter to your application you can point your browser to
http://127.0.0.1:8080/

To start/stop/restart application on Linux or OS X you can use the lampctl.sh 
utility:

       ./ctlscript.sh (start|stop|restart)
       ./ctlscript.sh (start|stop|restart) mysql
       ./ctlscript.sh (start|stop|restart) apache

  start      - start the service(s)
  stop       - stop  the service(s)
  restart    - restart or start the service(s)

If you selected an alternate port during installation, for example 18080, the
URL will look like:

http://127.0.0.1:18080/


7. DIRECTORY STRUCTURE

The installation process will create several subfolders under the main 
installation directory:

   apache2/: Apache Web server.
   php/: PHP Scripting Language.
   mysql/: MySQL Database.
   common/: common libraries and the lampctl.sh utility.
   licenses/: Licenses of the components included in LAMP Stack.
   apps/
	phpMyAdmin/: Management tool for MySQL


8. TROUBLESHOOTING

This version of the BitNami LAMP Stack is a preview version, and as
such, may contain a number of bugs and be a little bit rough around the
edges. We are working on the next release, which will contain several
improvements along with expanded documentation. In addition to the resources
provided below, we encourage you to post your questions and suggestions at:

http://bitnami.org/forums/

We also encourage you to sign up for our newsletter, which we'll use to
announce new releases and new stacks. To do so, just register at:
http://www.bitnami.org/catalog/newsletter. 

8.1 Installer

# Installer Payload Error

If you get the following error while trying to run the installer from the
command line:

"Installer payload initialization failed. This is likely due to an
incomplete or corrupt downloaded file" 

The installer binary is not complete, likely because the file was
not downloaded correctly. You will need to download the file and
repeat the installation process.

# Installer execution error on Linux

If you get the following error while trying to run the installer:

"Cannot open bitnami-lampstack-5.3.8-0-linux.bin: No application suitable for 
automatic installation is available for handling this kind of file."

In some operatings systems you can change permissions with right click 
properties -> permissions -> execution enable.

Or from the command line:

$ chmod 755 bitnami-lampstack-5.3.8-0-linux.bin 

8.2 Apache 

If you find any problem starting Apache, the first place you should check is
the Apache error log file:

/home/user/lampstack-5.3.8-0/apache2/logs/error.log

Most errors are related to not being able to listen to the default port.
Make sure there are no other server programs listening at the same port
before trying to start Apache. Some programs, such as Skype, may also use
port 80. For issues not covered in this Quick Start guide, please refer to
the Apache documentation, which is located at http://httpd.apache.org/docs/


8.3 MySQL

If you encounter any problems starting MySQL, the first place to
look in is the "Problems and Common Errors" section of the MySQL
manual, which you will find at http://dev.mysql.com/doc/ The
following are some common problems: 

# Access denied when trying to connect to MySQL. 

If you get an Access Denied message while trying to connect to
MySQL, make sure you are using the correct username and password. 

# "Can't connect to server" message. 

Make sure that the MySQL daemon is up and running. Remember also that if
during installation you selected a different listening port for MySQL, you
may need to pass that as an extra command line option.

8.4 phpMyAdmin

To test your phpMyAdmin installation first make sure that your Apache and 
MySQL servers are up and running. You can access your phpMyAdmin installation 
by opening a browser and typing http://127.0.0.1:8080/phpmyadmin. You will 
then asked for a username and password. As user name, use "root" and 
as password use the value specified during installation.


9. LICENSES

Apache Web Server is distributed under the Apache License v2.0, which
is located at http://www.apache.org/licenses/LICENSE-2.0

MySQL is distributed under the GNU General Public License v2, which is
located at http://www.gnu.org/licenses/old-licenses/gpl-2.0.html

phpMyAdmin is distributed under the GNU General Public License v2, which is
located at http://www.gnu.org/licenses/old-licenses/gpl-2.0.html

PHP and related libraries are distributed under the PHP License v3.01,
which is located at http://www.php.net/license/3_01.txt

curl is distributed under the Curl License, which is located at
http://curl.haxx.se/docs/copyright.html

expat is distributed under the MIT License, which is located at
http://www.jclark.com/xml/copying.txt

gd is distributed under the gd License, which is located at
http://www.boutell.com/gd/manual2.0.33.html

IMAP is distributed under the University of Washington Free-Fork
License, located at http://www.washington.edu/imap/legal.html

jpegsrc is distributed under The Independent JPEG Group's JPEG
software license, which is located at
http://dev.w3.org/cvsweb/Amaya/libjpeg/README?rev=1.2

libiconv is distributed under the Lesser General Public License
(LGPL), located at http://www.gnu.org/copyleft/lesser.html

ImageMagick has its own license, which is located at
https://www.imagemagick.org/subversion/ImageMagick/trunk/LICENSE

OpenSSL is released under the terms of the Apache License, which is
located at http://www.openssl.org/source/license.html

Zlib is released under the zlib License (a free software license/compatible 
with GPL), which is located at http://www.gzip.org/zlib/zlib_license.html

OpenLDAP is released under OpenLDAP Public License, which is located at
http://www.openldap.org/devel/cvsweb.cgi/~checkout~//LICENSE?rev=1.24

Freetype is released under The Freetype Project License, that is located at
http://freetype.sourceforge.net/FTL.TXT


 
