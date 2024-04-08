FROM ubuntu:latest

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    rm -rf /var/lib/apt/lists/*

# Add and extract the zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose ports
EXPOSE 80

