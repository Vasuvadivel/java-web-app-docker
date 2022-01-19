node
{
   def buildNumber = BUILD_NUMBER
   stage("Git CheckOut"){
        git url: 'https://github.com/vasuvadivel/java-web-app-docker.git',branch: 'master'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "Maven", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
    } 
   stage("Build Dokcer Image") {
         sh "docker build -t vasuvadivel/cicd-project:1.0 ."
    }
    stage("Docker login and Push"){
        withCredentials([string(credentialsId: 'password', variable: 'Dockerpassword')]){
         sh "docker login -u vasuvadivel -p ${Dockerpassword} " 
           }
        sh "docker push vasuvadivel/cicd-project:1.0 "
    }
    stage("Deploy to dockercontinor in docker deployer"){
       sshagent(['ssh-password']) {
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.46.114 docker rm -f cloudcandy || true"
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.46.114 docker run -d -p 8090:8080 --name cloudcandy vasuvadivel/cicd-project:1.0"           
          }  
    }
}
