pipeline {
    agent any

    stages {
        stage('tesing'){
            steps {
                echo """ This test is fine ."""
            }
        }
        // stage('Build Docker Image') {
        //     steps {
        //         sh """
        //         docker build -t spring-app:${BUILD_NUMBER} .
        //         """
        //     }
        // }

        // stage('Run Container') {
        //     steps {
        //         sh """
        //         # Stop and remove old containers if they exist
        //         docker rm -f spring-app-con || true
             

        //         # Start Spring Boot container
        //         docker run -d --name spring-app-con \
        //           -p 3000:3000
        //           spring-app:${BUILD_NUMBER}
        //         """
        //     }
        // }
    }
}
