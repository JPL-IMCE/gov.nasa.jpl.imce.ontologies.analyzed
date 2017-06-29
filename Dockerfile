FROM jplimce/gov.nasa.jpl.imce.ontologies.validated:0.1.1-caesar_demo

# Environment Variables
ENV IMCE=/imce \
    WORKFLOW=$IMCE/analysis/workflow \
    METADATA=/imce/analysis/target/workflow/artifacts/oml.metadata.json

RUN gem install rubyzip

# Pull latest
RUN cd $WORKFLOW; git pull

# Add target
RUN cp -R /imce/target /imce/analysis/target


# Make clean
RUN /bin/bash -c "cd $WORKFLOW/; source ./env.sh; make clean"

# Add ontologies
ADD ./exports /imce/analysis/target/workflow/artifacts

# Run workflow
RUN /bin/bash -c "cd $WORKFLOW/; source ./env.sh; make bootstrap"
RUN /bin/bash -c "cd $WORKFLOW/; source ./env.sh; make location-mapping" 
RUN /bin/bash -c "cd $WORKFLOW/; source ./env.sh; make validate-roots"
RUN /bin/bash -c "cd /imce/fuseki/workflow/;source ./env.sh; make start-fuseki; cd /imce/analysis/workflow/; source ./env.sh; make run-audits"