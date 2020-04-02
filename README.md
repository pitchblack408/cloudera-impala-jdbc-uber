# Cloudera Impala JDBC Uber Jar

The Cloudera 14 Impala JDBC driver doesn't come with all the jars neccesary to run with in a client application.  The objective of this project is to use maven to build an uber jar with all the dependencies.

Luckily, Tim Veil started a project for creating a hive uber jar, so this project implemets two of his java classes and parts of his pom file.

https://github.com/timveil/hive-jdbc-uber-jar

## 1. Setup
The first step is download the jdbc zip package from cloudera.
     
* ClouderaImpala_JDBC-2.6.15.1017.zip

Second step install jar to local repo using cmd line

    mvn install:install-file  -Dfile=~/Downloads/ClouderaImpalaJDBC-2.6.15.1017/ImpalaJDBC42.jar \
                              -DgroupId=com.cloudera.impala.jdbc \
                              -DartifactId=ImpalaJDBC42 \
                              -Dversion=2.6.15.1017 \
                              -Dpackaging=jar \
                              -DlocalRepositoryPath=~/.m2/repository

### 1.1 The JDBC42 impala driver

* ImpalaJDBC42.jar

### 1.2 Required dependencies by the driver

* commons-logging-X.X.X.jar
* hadoop-common.jar
* hive-common-X.XX.X-cdhX.X.X.jar
* hive-jdbc-X.XX.X-cdhX.X.X.jar
* hive-metastore-X.XX.X-cdhX.X.X.jar
* hive-service-X.XX.X-cdhX.X.X.jar
* httpclient-X.X.X.jar
* httpcore-X.X.X.jar
* libfb303-X.X.X.jar
* libthrift-X.X.X.jar
* log4j-X.X.XX.jar
* slf4j-api-X.X.X.jar
* slf4j-logXjXX-X.X.X.jar

**Please look at the pom.xml for more details**

### 1.3 Creating an uber jar

    mvn clean install package

## 2. Testing Locally 

### 2.1 Docker Cloudera Image

Cloudera Docker image for debugging/testing use the cloudera quick start image.
 
    https://hub.docker.com/r/cloudera/quickstart/
    https://docs.cloudera.com/documentation/enterprise/5-4-x/topics/quickstart_vm_administrative_information.html

**Process for setup**

1. Install Docker
1. **Change docker preferences to allow 10GB Ram**
1. Pull docker cloudera image
1. Create and run container with docker run 
1. Inside the container start cloudera enterprise manager
1. Inside the container start hue


**Docker commands**

Pull the image

    docker pull cloudera/quickstart:latest

Create and run the container

    docker run --hostname=quickstart.cloudera --privileged=true -t -i -p 8888:8888 -p 80:80 -p 7180:7180 -p 21050:21050 cloudera/quickstart /usr/bin/docker-quickstart

Explanation for required flags and other options are in the following table:

    --hostname=quickstart.cloudera    Required: pseudo-distributed configuration assumes this hostname
    --privileged=true                 Required: for HBase, MySQL-backed Hive metastore, Hue, Oozie, Sentry, and Cloudera Manager, and possibly others
    -t                                Required: once services are started, a Bash shell takes over and will die without this
    -i                                Required: if you want to use the terminal, either immediately or attach later
    -p 8888                           Recommended: maps the Hue port in the guest to another port on the host
    -p [PORT]                         Optional: map any other ports (e.g. 7180 for Cloudera Manager, 80 for a guided tutorial)
    -d                                Optional: runs the container in the background


**Start Cloudera Enterprise Manager**  

    sudo /home/cloudera/cloudera-manager --enterprise --force

**Use cloudera Enterprise Manager**
1. Start HDFS
1. Start Hive
1. Start Impala
1. Start Hue

**URLS**

* http://localhost:7180
* http://localhost:8888

**Passwords**

  * username: cloudera
  * password: cloudera
  
### 2.2 DbVisualizer

* https://www.dbvis.com

Below is an example configuration using DbVisualizer:

Open the Diver Manager dialog ("Tools" > "Driver Manager...") and hit the "Create a new driver" icon.

Fill in the information as seen below. For the "Driver File Paths" you are pointing to cloudera-impala-jdbc-uber-1.0.jar.

* jdbc:impala://localhost:21050/default
