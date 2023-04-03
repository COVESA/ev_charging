#
# Makefile to generate specifications
# Inherited from vss, but just using two output formats
#

.PHONY: clean all json csv 

all: clean json csv

TOOLSDIR?=./vss-tools

json:
	${TOOLSDIR}/vspec2json.py -I ./spec --uuid -u ./spec/units.yaml ./spec/RoadInfrastructure.vspec road_infrastructure.json

csv:
	${TOOLSDIR}/vspec2csv.py -I ./spec --uuid -u ./spec/units.yaml ./spec/RoadInfrastructure.vspec road_infrastructure.csv

clean:
	rm -f road_infrastructure.*

