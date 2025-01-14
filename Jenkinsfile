node {

    docker.image('maven:3.9.2').inside("-v $WORKSPACE/.m2:/root/.m2") {
        stage('Check Maven Version') {
            sh 'mvn --version'
        }

        stage('Build') {
            checkout scm
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
