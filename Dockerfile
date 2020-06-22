# Using official python runtime base image
FROM registry.access.redhat.com/ubi8/ubi

# Set the application directory
WORKDIR /home

# Install Java
RUN dnf install java-11-openjdk -y

# Copy our code from the current folder to /app inside the container
ADD . /home
RUN chmod 0755 -R /home

# Make port 80 available for links and/or publish
EXPOSE 8080

# Define our command to be run when launching the container
#CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8080", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0"]
CMD ["python", "./app.py"]
