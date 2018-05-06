# Use an official ubuntu:16.04  runtime as a parent image
FROM ubuntu:16.04


# Define environment variable 
ENV REFRESHED_AT 2018-05-05

#Update system and install some dependent packages
RUN apt-get update && apt-get install  -y  wget  bzip2 make 


# Set the working directory to /home/work
WORKDIR /home/work

#get cross toolchain from internet

RUN wget https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 -P /home/work

# Copy the current directory contents into the container at /home/work
COPY  /home/work/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2  /home/work/

# Set the working directory to /home/work
WORKDIR /home/work

#Install cross toolchain for cortex-M3 processors
RUN  tar xf gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2  -C /opt \
     && rm -rf gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 \
     && rm -rf /opt/gcc-arm-none-eabi-7-2017-q4-major/share/doc

#invoke the PATH for cross toolchain
ENV PATH="/opt/gcc-arm-none-eabi-7-2017-q4-major/bin:${PATH}"

# Make port 1234 available to the world outside this container
#EXPOSE 1234


# Run  command when the container launches
#CMD ["arm-none-eabi-gcc", "-v"]
