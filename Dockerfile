# Use the latest official Ubuntu image from Docker Hub
FROM ubuntu:latest

# Avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update system packages and install Apache2
RUN apt-get update && apt-get install -y apache2 && apt-get clean

# Copy your custom local webpage into the container's web root
COPY ./index.html /var/www/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Start Apache in the foreground so the container stays active
CMD ["apachectl", "-D", "FOREGROUND"]

