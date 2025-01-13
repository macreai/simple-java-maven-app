node {
    docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {

        stage('Install Dependencies') {
            sh 'mvn install:install-file "-DgroupId=org.mozilla" "-DartifactId=jss" "-Dversion=4.2.5" "-Dpackaging=jar" "-Dfile=/path/to/jss-4.2.5.jar"'
        }

        stage('Build') {
            sh 'mvn -B -DskipTests clean package'
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
