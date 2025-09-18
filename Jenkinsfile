pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t spring-app:${BUILD_NUMBER} .
                """
            }
        }

        stage('Run Container') {
            steps {
                sh """
                # Stop and remove old containers if they exist
                docker rm -f spring-app-con || true
                docker rm -f postgres-container || true

                # Start PostgreSQL
                docker run -d --name postgres-container \
                  -e POSTGRES_DB=mydb \
                  -e POSTGRES_USER=myuser \
                  -e POSTGRES_PASSWORD=mypassword \
                  -p 5432:5432 \
                  postgres:15

                # Wait for Postgres to initialize
                sleep 10

                # Start Spring Boot container
                docker run -d --name spring-app-con \
                  --link postgres-container:postgres \
                  -p 9090:9090 \
                  -e SPRING_DATASOURCE_URL=jdbc:postgresql://postgres:5432/mydb \
                  -e SPRING_DATASOURCE_USERNAME=myuser \
                  -e SPRING_DATASOURCE_PASSWORD=mypassword \
                  spring-app:${BUILD_NUMBER}
                """
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
