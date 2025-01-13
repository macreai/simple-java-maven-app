node {
    docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {
        stage('Build') {
            dir('.') {
                sh 'mvn -B -DskipTests clean package'
            }
        }

        stage('Test') {
            dir('.') {
                sh 'mvn test'
                junit 'target/surefire-reports/*.xml'
            }
        }

        stage('Deliver') {
            dir('.') {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
