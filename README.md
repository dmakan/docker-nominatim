# docker-nominatim
=======================

### Build docker image for Andorra region:
docker build -t dmakan/ubuntu-nominatim:v1 .

Note: If you want to change region, edit .config.sh file and "osmdatafolder" & "osmdatacountry" properties

### Run docker container:
docker run -t -i -p 80:80 dmakan/ubuntu-nominatim:v1

### Example calls (from the host):
http://localhost/nominatim/search.php?q=ordino&polygon=1
http://localhost/nominatim/search.php?q=Ordino&format=json
http://localhost/nominatim/search.php?q=Andorra%20la%20Vella&format=json