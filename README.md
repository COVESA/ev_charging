# COVESA EV Charging Signal Catalog

[![License](https://img.shields.io/badge/License-MPL%202.0-blue.svg)](https://opensource.org/licenses/MPL-2.0)
[![Build Status](https://github.com/COVESA/ev_charging/actions/workflows/buildcheck.yml/badge.svg)](https://github.com/COVESA/ev_charging/actions/workflows/buildcheck.yml?query=branch%3Amaster)

This is the official repository of the COVESA EV Charging Event Data Aggregation Project.
For more information on the project, see the [wiki](https://wiki.covesa.global/display/WIK4/EV+Charging+Event+Data+Aggregation+Project)

*Note - The signal catalog in this repository is work in progress!*

## Background

COVESA has defined a signal catalog for vehicles, the
[COVESA Vehicle Signal Specification (VSS)](https://github.com/COVESA/vehicle_signal_specification).
This repository contains a similar tree but representing a charging station.
The syntax of the charging station tree in this repository is the same as in VSS,
and the tree can be transformed by [VSS-tools](https://github.com/COVESA/vss-tools) in the same way as the standard
VSS catalog.

The tree as of today intend to present data as seen from the perspective of a specific vehicle.
Some signals are static and does not depend on which vehicle that requests the information while other data is
vehicle specific, like expected arrival time at the charging station.

## Governance

This repository is managed by the COVESA EV Charging Event Data Aggregation Project.
Contributions are welcome but must adhere to [COVESA contribution guidelines](https://www.covesa.global/contribute).

## Getting started

As of today no official releases of this catalog exists.
Instead users must start from the `*.vspec` files included in this repository.
Most tools in [VSS-tools](https://github.com/COVESA/vss-tools) can be used for transforming the signals
in this repository, but current focus is on `vspec2csv` and `vspec2json`. They can be run directly or with help
of the `Makefile`

Below is an example workflow for transforming the specification on a Linux platform.
For more information on tool setup and available arguments see [VSS-tools](https://github.com/COVESA/vss-tools)

### Get the source

```
git clone https://github.com/COVESA/vehicle_signal_specification
cd vehicle_signal_specification
git submodule update --init
```

### Install dependencies

```
# Install Python, in this case Python 3.10 as that is a version available on the update sites of Ununtu 22.04
sudo apt install python3.10

# For convenience make Python 3.10 available as default Python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 100

# Install required dependencies, running pip without sudo means that a user installation will be performed
sudo apt install pip
pip install anytree deprecation graphql-core
```

### Generate csv

The example below shows how to generate csv. The result will be available in `road_infrastructure.csv`.

```
user@linux:~/ev_charging$ make csv
./vss-tools/vspec2csv.py -I ./spec --uuid -u ./spec/units.yaml ./spec/RoadInfrastructure.vspec road_infrastructure.csv
INFO     Output to csv format
INFO     Known extended attributes: 
INFO     Added 54 units from ./spec/units.yaml
INFO     Loading vspec from ./spec/RoadInfrastructure.vspec...
INFO     Calling exporter...
Generating CSV output...
INFO     All done.

```

### Generate JSON

The example below shows how to generate csv. The result will be available in `road_infrastructure.json`.

```
user@linux:~/ev_charging$ make make json
./vss-tools/vspec2json.py -I ./spec --uuid -u ./spec/units.yaml ./spec/RoadInfrastructure.vspec road_infrastructure.json
INFO     Output to json format
INFO     Known extended attributes: 
INFO     Added 54 units from ./spec/units.yaml
INFO     Loading vspec from ./spec/RoadInfrastructure.vspec...
INFO     Calling exporter...
INFO     Generating JSON output...
INFO     Serializing compact JSON...
INFO     All done.

```
