node {
    // Menggunakan Docker dengan image Maven
    docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {

        stage('Build') {
            // Tahap Build: Membersihkan dan mengemas aplikasi tanpa menjalankan tes
            sh 'mvn -B -DskipTests clean package'
        }

        stage('Test') {
            // Tahap Test: Menjalankan pengujian unit
            sh 'mvn test'

            // Selalu melakukan upload hasil pengujian setelah tahap Test selesai
            junit 'target/surefire-reports/*.xml'
        }

        stage('Deliver') {
            // Tahap Deliver: Menjalankan script untuk delivery aplikasi
            sh './jenkins/scripts/deliver.sh'
        }
    }
}
