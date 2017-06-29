FROM jplimce/gov.nasa.jpl.imce.ontologies.validated:0.1.1-caesar_demo

# Environment Variables
ENV IMCE=/imce \
    WORKFLOW=$IMCE/analysis/workflow \
    METADATA=$IMCE/target/workflow/artifacts/oml.metadata.json

# Pull latest
RUN cd $WORKFLOW; git pull

# Add target
RUN ln -s /imce/target /imce/analysis/target


# Make clean
RUN /bin/bash -c "cd $WORKFLOW/; source ./env.sh; make clean"

# Add ontologies
ADD ./exports $IMCE/target/workflow/artifacts

# Run workflow
#RUN /bin/bash -c "cd $WORKFLOW/; source ./env.sh; make bootstrap"
#RUN /bin/bash -c "cd $WORKFLOW/; source ./env.sh; make location-mapping" 
#RUN /bin/bash -c "cd $WORKFLOW/; source ./env.sh; make validate-roots"
#RUN /bin/bash -c "cd $WORKFLOW/; source ./env.sh; cd /imce/workflow/target/run; nohup /imce/workflow/target/fuseki/fuseki-server --port=8898 > /imce/workflow/target/workflow/log/fuseki.log 2>&1 & echo $! > /imce/workflow/target/workflow/log/fuseki.pid; cd /imce/workflow/target/workflow; make run-audits"