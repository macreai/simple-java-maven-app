node {
    docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {
        stage('Build') {
            dir('simple-java-maven-app') {
                sh 'mvn -B -DskipTests clean package'
            }
        }

        stage('Test') {
            dir('simple-java-maven-app') {
                sh 'mvn test'
                junit 'target/surefire-reports/*.xml'
            }
        }

        stage('Deliver') {
            dir('simple-java-maven-app') {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
