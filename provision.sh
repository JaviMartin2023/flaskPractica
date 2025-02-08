#Instalamos el gestor de paquetes de Python pip:
sudo apt-get update && sudo apt-get install -y python3-pip

#Instalamos el paquete pipenv para gestionar los entornos virtuales:
pip3 install pipenv

#Y comprobamos que está instalado correctamente mostrando su versión:
PATH=$PATH:/home/$USER/.local/bin
pipenv --version

#Después instalaremos el paquete python-dotenv para cargar las variables de entorno.
pip3 install python-dotenv

#Creamos el directorio en el que almacenaremos nuestro proyecto:
sudo mkdir -p /var/www/app

#Damos los permisos correspondientes al directorio:
sudo chown -R $USER:www-data /var/www/app
sudo chmod -R 775 /var/www/app

cd /var/www/app

#Copiamos el env
cp /vagrant/.env /var/www/app

#Iniciamos ahora nuestro entorno virtual. Pipenv cargará las variables de entorno desde el fichero .env de forma automática:
pipenv shell

#Usamos pipenv install flask gunicorn para instalar las dependencias necesarias para nuestro proyecto:
pipenv install flask gunicorn

# Copiamos los archivos de la aplicación al directorio:
cp /vagrant/application.py /var/www/app
cp /vagrant/wsgi.py /var/www/app

#Averiguamos la ruta de la que se ejecuta gunicorn: /home/vagrant/.local/share/virtualenvs/app-1lvW3LzD/bin/gunicorn
which gunicorn

exit

#Iniciamos nginx
sudo systemctl start nginx

#Creamos y copiamos flask_app.service
sudo cp /vagrant/flask_app.service /etc/systemd/system

#Informaremos a systemd que hay un nuevo servicio:
sudo systemctl daemon-reload

#Ahora, como cada vez que se crea un servicio nuevo de systemd, se habilita y se inicia:
sudo systemctl enable flask_app
sudo systemctl start flask_app

#crearemos un archivo para que systemd corra Gunicorn como un servicio del sistema más:
sudo cp /vagrant/flask_app.service /etc/systemd/system

#Recargakmos los servicios
sudo systemctl daemon-reload
sudo systemctl enable flask_app
sudo systemctl start flask_app

#Creamos un archivo con el nombre de nuestra aplicación y dentro estableceremos la configuración para ese sitio web.
sudo cp /vagrant/app.conf /etc/nginx/sites-available/

#Hacemos el enlace simbólico a sites-enabled
sudo ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/

#Rearrancamos el servidor
sudo systemctl restart nginx
sudo systemctl status nginx


#AMPLIACIÓN

#Preparamos el entorno
cd /var/www/
sudo chown -R $USER:www-data /var/www
sudo chmod -R 775 /var/www
sudo apt-get install -y git
git clone https://github.com/Azure-Samples/msdocs-python-flask-webapp-quickstart.git

# Copiamos el archivo .env 
cp /vagrant/.env /var/www/msdocs-python-flask-webapp-quickstart

# Inicializamos el entorno virtual y cargamos las variables de entorno:
pipenv shell
pipenv install -r msdocs-python-flask-webapp-quickstart/requirements.txt 

#Copiamos nuestros archivos al igual que antes al directorio de la aplicación:
cp /vagrant/application.py /var/www/msdocs-python-flask-webapp-quickstart
cp /vagrant/wsgi.py /var/www/msdocs-python-flask-webapp-quickstart

#Ruta de gunicorn: /home/vagrant/.local/share/virtualenvs/www-elNfpBxP/bin/gunicorn
which gunicorn

exit

#Creamos y copiamos flask_app_v2.service
sudo cp /vagrant/flask_app_v2.service /etc/systemd/system

# Recargamos los servicios:
sudo systemctl daemon-reload
sudo systemctl enable flask_app_v2
sudo systemctl start flask_app_v2

# Configuramos el archivo de configuracion de nginx:
sudo cp /vagrant/ms.conf /etc/nginx/sites-available/

# Creamos el enlace simbólico:
sudo ln -s /etc/nginx/sites-available/ms.conf /etc/nginx/sites-enabled/

sudo systemctl restart nginx
sudo systemctl status nginx




