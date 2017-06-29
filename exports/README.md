# OML ontologies for IMCE CAESAR Demonstration

## Compatible with OML WB 0.7.1.0

See: https://cae-artifactory.jpl.nasa.gov/artifactory/webapp/#/artifacts/browse/tree/General/maven-libs-release-local/gov/nasa/jpl/imce/oml/gov.nasa.jpl.imce.oml.product/0.7.1.0


See [Writing OML Specifications](http://github.com/jpl-imce/gov.nasa.jpl.imce.oml.core/gov.nasa.jpl.imce.oml.dsl/doc/WritingOMLSpecifications.md)

## Running OML Conversions

- Get the [imce.ontologies.processor](https://github.com/JPL-IMCE/gov.nasa.jpl.imce.ontologies.processor)

	```
	docker pull jplimce/gov.nasa.jpl.imce.ontologies.processor:<version>
	```
	
- Run the OML converter from the image with a file mapping for the location of this project

	```
	docker run -t -v `pwd`:/imce/ontologies -i jplimce/gov.nasa.jpl.imce.ontologies.processor:<version> /bin/bash
	cd /imce/ontologies
	./oml2owl.sh
	```
	
## Comparing changes in OML files (any format)

See [.gitattributes](.gitattributes) for enabling comparison of `*.oml.json.zip` files.

The user's `~/.gitconfig` needs to include the following:

For MacOSX and Linux:

```
[diff "zip"]
      textconv = unzip -c -a
```

For Windows: (TODO: what's the equivalent of the above?)

```
[diff "zip"]
      textconv = unzip -c -a
```

### TWC

Server: https://cae-twc-uat1.jpl.nasa.gov:8111/osmc

| ID | Description |
|----|-------------|
| ade49b6e-28ac-4d8f-8f3e-64c6d5351cd2 | JPL Institutional Libraries |
| 770f3cd7-5d98-4db6-a2e0-98fa4095b69f | IMCE |

