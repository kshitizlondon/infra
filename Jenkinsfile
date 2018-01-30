/**
 * This pipeline will run a Infra images build
 */

podTemplate(label: 'jenkins-slave',
  containers: [containerTemplate(name: 'docker', image: 'docker:1.12', ttyEnabled: true, command: 'cat')],
  volumes: [hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock'),
            hostPathVolume(hostPath: '/etc/docker', mountPath: '/etc/docker')]
  ) {

  def image = "jenkins/jnlp-slave"
  node('jenkins-slave') {
    stage('checkout') {
      checkout scm
      sh 'ls -al'
    }

    stage('ubuntu-base-16.04') {
      container('docker') {
        dir('./docker-images/ubuntu-base-16.04/') {
          sh 'ls -al'
          sh 'chmod +x docker-build.sh'
          sh 'docker login https://db.ddn.nttdata-emea.com:5443 -u kubernetes-user-for-docker-registry -pbOvSvpJagEEsGGGqsUMH'
          sh './docker-build.sh'
          sh 'docker logout https://db.ddn.nttdata-emea.com:5443'
	    }
      }
    }
    
  /*  
    stage('ibm-jdk-1.6.sr16-32-maven-3.2.5') {
      container('docker') {
        dir('./docker-images/ibm-jdk-1.6.sr16-32-maven-3.2.5/') {
          sh 'ls -al'
          sh 'chmod +x docker-build.sh'
          sh 'docker login https://db.ddn.nttdata-emea.com:5443 -u kubernetes-user-for-docker-registry -pbOvSvpJagEEsGGGqsUMH'
          sh './docker-build.sh'
          sh 'docker logout https://db.ddn.nttdata-emea.com:5443'
        }
      }
    }
  */
    stage('ibm-jdk-1.6.sr8-maven-3.2.5') {
      container('docker') {
        dir('./docker-images/ibm-jdk-1.6.sr8-maven-3.2.5/') {
          sh 'ls -al'
          sh 'chmod +x docker-build.sh'
          sh 'docker login https://db.ddn.nttdata-emea.com:5443 -u kubernetes-user-for-docker-registry -pbOvSvpJagEEsGGGqsUMH'
          sh './docker-build.sh'
          sh 'docker logout https://db.ddn.nttdata-emea.com:5443'
        }
      }
    }
    
    stage('ibm-jdk-1.6.sr8-maven-3.2.5-nodejs6') {
      container('docker') {
        dir('./docker-images/ibm-jdk-1.6.sr8-maven-3.2.5-nodejs6/') {
          sh 'ls -al'
          sh 'chmod +x docker-build.sh'
          sh 'docker login https://db.ddn.nttdata-emea.com:5443 -u kubernetes-user-for-docker-registry -pbOvSvpJagEEsGGGqsUMH'
          sh './docker-build.sh'
          sh 'docker logout https://db.ddn.nttdata-emea.com:5443'
        }
      }
    }
/*
    stage('ibm-jdk-1.7.sr9-maven-3.3.9') {
      container('docker') {
        dir('./docker-images/ibm-jdk-1.7.sr9-maven-3.3.9/') {
          sh 'ls -al'
          sh 'chmod +x docker-build.sh'
          sh 'docker login https://db.ddn.nttdata-emea.com:5443 -u kubernetes-user-for-docker-registry -pbOvSvpJagEEsGGGqsUMH'
          sh './docker-build.sh'
          sh 'docker logout https://db.ddn.nttdata-emea.com:5443'
        }
      }
    }
*/
/*
    stage('ibm-jdk-1.8.sr4-maven-3.3.9') {
      container('docker') {
        dir('./docker-images/ibm-jdk-1.8.sr4-maven-3.3.9/') {
          sh 'ls -al'
          sh 'chmod +x docker-build.sh'
          sh 'docker login https://db.ddn.nttdata-emea.com:5443 -u kubernetes-user-for-docker-registry -pbOvSvpJagEEsGGGqsUMH'
          sh './docker-build.sh'
          sh 'docker logout https://db.ddn.nttdata-emea.com:5443'
        }
      }
    }
*/
    stage('ibm-was-PAI5.0.6') {
      container('docker') {
        dir('./docker-images/ibm-was-PAI5.0.6/') {
          sh 'ls -al'
          sh 'chmod +x docker-build.sh'
          sh 'docker login https://db.ddn.nttdata-emea.com:5443 -u kubernetes-user-for-docker-registry -pbOvSvpJagEEsGGGqsUMH'
          sh './docker-build.sh'
          sh 'docker logout https://db.ddn.nttdata-emea.com:5443'
        }
      }
    }

    stage('jenkins-base') {
      container('docker') {
        dir('./docker-container/base-jenkins/') {
          sh 'ls -al'
          sh 'chmod +x buildContainer.sh'
          sh 'docker login https://db.ddn.nttdata-emea.com:5443 -u kubernetes-user-for-docker-registry -pbOvSvpJagEEsGGGqsUMH'
          sh './buildContainer.sh'
          sh 'docker logout https://db.ddn.nttdata-emea.com:5443'
        }
      }
    }
  }
}