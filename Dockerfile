FROM ubuntu:20.04
RUN apt-get update && apt-get install openjdk-8-jre unzip wget -y
RUN wget -q https://icedtea.classpath.org/download/icedtea-web-binaries/1.8/linux/icedtea-web-1.8.linux.bin.zip
RUN unzip icedtea-web-1.8.linux.bin.zip
WORKDIR /icedtea-web-image/bin
# this is the X server IP address
# if you are using WSL2, it is `<WINDOWS HOST IP>:0.0`
RUN echo "DISPLAY='10.20.83.11:0.0'" >> ./launch
RUN echo "./javaws -jnlp viewer.jnlp" >> ./launch
COPY java.security /etc/java-8-openjdk/security/java.security
COPY viewer.jnlp viewer.jnlp
RUN chmod +x ./launch
ENTRYPOINT ./launch
