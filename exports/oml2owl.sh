#!/bin/bash

OMLC=/imce/tools/omlConverter/bin/omlConverter

$OMLC \
-cat \
oml.catalog.xml \
./discipline/mass-management.oml \
./foundation/oml/provenance/MagicDraw.oml \
./foundation/base/base.oml \
./foundation/mission/mission.oml \
./foundation/project/project-bundle.oml \
./foundation/project/project.oml \
./projects/MassManagementDemonstration/Packages/Formulation.oml \
./projects/MassManagementDemonstration/Packages/NXCAD.oml \
./projects/MassManagementDemonstration/Packages/WorkBreakdownStructure.oml \
./purl.org/dc.oml \
./www.w3.org/v2001/xsd.oml