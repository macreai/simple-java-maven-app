node {
    docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {
        stage('Build') {
            sh 'mvn install:install-file "-DgroupId=org.mozilla" "-DartifactId=jss" "-Dversion=4.2.5" "-Dpackaging=jar" "-Dfile=/path/to/jss-4.2.5.jar"'
        }

        stage('Test') {
            sh 'mvn test'
            junit 'target/surefire-reports/*.xml'
        }

        stage('Deliver') {
            sh './jenkins/scripts/deliver.sh'
        }
    }
}
