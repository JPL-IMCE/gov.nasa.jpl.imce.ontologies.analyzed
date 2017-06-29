pipeline {
	agent any
	stages {

	stage('Build Analyzed Image') {
		steps {
			script {
		    	docker.build("jplimce/gov.nasa.jpl.imce.ontologies.analyzed");
			}
		}
	}

	stage('Copy target from container') {
		steps {
			timeout(time: 30, unit: 'MINUTES') {
				sh returnStdout: true, script: 'sudo docker run -v ./target:/imce/output -i jplimce/gov.nasa.jpl.imce.ontologies.analyzed /bin/bash -c "cp -Rf /imce/analysis/target /imce/output"'
            }
		}
	}

	stage('Push Image') {
		steps {
			echo 'Pushing!'
		}
	}
	}
}