node {
    checkout scm
    docker.image('maven:3.9.2').inside('-u root') {
        stage('Build') {
            sh 'mvn -B -DskipTests clean package'
        }

        stage('Test') {
            sh 'mvn test'
            junit 'target/surefire-reports/*.xml'
        }

        stage('Manual approval') {
            input message : 'Are you sure to Deploy? (Press "Proceed" to Deploy)'
        }

        stage('Deliver') {
            sh './jenkins/scripts/deliver.sh'
            sleep time: 1, unit: 'MINUTES'
        }
    }
}
