pipeline{
    agent any
     tools
  
    stages{
        stage("Git Checkout"){
            steps{
              git credentialsId: 'e1e806ff-3b29-4442-8bae-90be3bc42d73', url: 'https://github.com/kolanti444/mahalogin.git'            }
        }
      }
         stage("Maven Build"){
            steps{
              sh "mvn clean package"
            }
           }
        stage("archieve the artifacts"){
            steps{
              archiveArtifacts artifacts: 'archiveArtifacts artifacts: \'target/*.war\'', followSymlinks: false
            }
           }
         }
      }
        
