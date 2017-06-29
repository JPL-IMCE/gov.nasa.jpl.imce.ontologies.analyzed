pipeline {
	agent {
		label 'IMCE'
	}
	stages {

	stage('Get Exported Data') {
		steps {
			checkout([$class: 'GitSCM', branches: [[name: 'omlwb/0.7.1.x']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'analysis']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github-fn.jpl.nasa.gov/IMCE/gov.nasa.jpl.imce.caesar.demo.ontologies']]])
	 	}
	}

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
				sh returnStdout: true, script: 'sudo docker run -v ./target:/imce/output -i jplimce/gov.nasa.jpl.imce.ontologies.analyzed /bin/bash -c "cp -Rf /imce/target /imce/output"'
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