node {
    docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {
        stage('Build') {
            sh 'mvn install:install-file "-DgroupId=org.mozilla" "-DartifactId=jss" "-Dversion=4.2.5" "-Dpackaging=jar" "-Dfile=/path/to/jss-4.2.5.jar"'
            sh 'mvn -B -DskipTests clean package'
        }

        stage('Test') {
            sh 'mvn install:install-file "-DgroupId=org.mozilla" "-DartifactId=jss" "-Dversion=4.2.5" "-Dpackaging=jar" "-Dfile=/path/to/jss-4.2.5.jar"'
            sh 'mvn test'
            junit 'target/surefire-reports/*.xml'
        }

        stage('Deliver') {
            sh 'mvn install:install-file "-DgroupId=org.mozilla" "-DartifactId=jss" "-Dversion=4.2.5" "-Dpackaging=jar" "-Dfile=/path/to/jss-4.2.5.jar"'
            sh './jenkins/scripts/deliver.sh'
        }
    }
}
