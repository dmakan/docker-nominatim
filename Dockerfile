FROM ubuntu:14.04
RUN apt-get -y update

# Install git
RUN sudo apt-get -y install git

# Tell git who you are
RUN git config --global user.name "docker nominatim"
RUN git config --global user.email "docker@nominatim.com"

# Clone the installer
RUN git clone https://github.com/cyclestreets/nominatim-install.git

# Move to the right place
RUN sudo mv nominatim-install /opt
WORKDIR /opt/nominatim-install/
RUN pwd
RUN ls -l
RUN git config core.sharedRepository group

COPY run.sh /opt/nominatim-install/
COPY .config.sh /opt/nominatim-install/

# Run the installation
RUN chmod 777 run.sh
RUN chmod 777 .config.sh
RUN ./run.sh

RUN mv /var/www/nominatim/ /var/www/html/

ENTRYPOINT service postgresql restart && service apache2 start && bash
