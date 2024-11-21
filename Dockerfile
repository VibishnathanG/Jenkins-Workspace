# Use Red Hat Universal Base Image
FROM  registry.access.redhat.com/ubi8/ubi:8.1

# Set maintainer information (optional)
LABEL maintainer="vibish@gmail.com"

# Update system and install required packages
RUN yum update -y && \
    yum install -y iputils bind-utils procps-ng net-tools git java-17-openjdk-devel wget && \
    yum clean all

# Set environment variables for Tomcat
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV CATALINA_OPTS=""

# Download and extract Tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-11/v11.0.1/bin/apache-tomcat-11.0.1.tar.gz -O /tmp/tomcat.tar.gz && \
    mkdir -p $CATALINA_HOME && \
    tar -xzf /tmp/tomcat.tar.gz --strip-components=1 -C $CATALINA_HOME && \
    rm -f /tmp/tomcat.tar.gz

COPY *.war $CATALINA_HOME/webapps/ROOT.war

EXPOSE 8080

CMD [ "catalina.sh", "run" ]