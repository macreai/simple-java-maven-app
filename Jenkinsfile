node {
    checkout scm
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
