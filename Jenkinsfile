node {
    checkout scm

    docker.image('maven:3.9.2').inside('-v $HOME/.m2:/root/.m2') {
        stage('Check Maven Version') {
            sh 'mvn --version'
        }

        stage('Build') {
            sh 'mkdir -p /root/.m2/repository'
            sh 'mvn -B -DskipTests clean package'
        }

        stage('Test') {
            sh 'mkdir -p /root/.m2/repository'
            sh 'mvn test'
            junit 'target/surefire-reports/*.xml'
        }

        stage('Deliver') {

            sh './jenkins/scripts/deliver.sh'
        }
    }
}
