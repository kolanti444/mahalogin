pipeline {
  
  agent any
 
  stages {
    
    stage('installdependencies') {
     steps {
       sh 'npn install'
     }
  }
    stage('test') {
      steps {
        sh 'echo testing application....'
      }
    }
    
    stage("deploy nodejs applicatin") {
      steps {
        sh 'echo deploying the application....'
      }
    }
    
  }
  
}








}
