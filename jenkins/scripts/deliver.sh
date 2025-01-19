#!/usr/bin/env bash

# Build the JAR file using Maven
echo 'The following Maven command installs your Maven-built Java application'
echo 'into the local Maven repository, which will ultimately be stored in'
echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data volume).'
set -x
mvn jar:jar install:install help:evaluate -Dexpression=project.name
set +x

# Extract project name and version from Maven POM file
echo 'The following command extracts the value of the <name/> element'
echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
NAME=`mvn -q -DforceStdout help:evaluate -Dexpression=project.name`
set +x

echo 'The following command extracts the value of the <version/> element'
echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
VERSION=`mvn -q -DforceStdout help:evaluate -Dexpression=project.version`
set +x

echo 'Running the built JAR file for testing...'
set -x
java -jar target/${NAME}-${VERSION}.jar

# --- Docker build and deployment section ---

#echo 'Building Docker image...'
#docker build -t java-app .

echo 'Checking if Railway CLI is installed...'
if ! [ -x "$(command -v railway)" ]; then
  echo 'Railway CLI not found. Installing Railway CLI...'
  curl -fsSL https://railway.app/install.sh | sh
else
  echo 'Railway CLI is already installed.'
fi

## Login to Railway using the token (assuming RAILWAY_TOKEN is set in Jenkins environment)
#echo 'Logging in to Railway...'
#railway login --token $RAILWAY_TOKEN

#echo 'Linking to Railway project...'
#railway link -p $RAILWAY_PROJECT

#echo 'Pushing Docker image to Railway...'
#railway container push java-app

echo 'Deploying application to Railway...'
RAILWAY_TOKEN=${env.PROJECT_TOKEN} railway up

echo 'Deployment to Railway completed successfully.'
