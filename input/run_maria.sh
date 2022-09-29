#!/bin/bash

# this script is a bit of a hack to run the power/storms pipeline for a single historic storm

# expect historic storm data to be in:
#   results/input/stormtracks/events/constant/NA/STORM_DATA_IBTRACS_NA_1000_YEARS_99.txt
# in the appropriate format, see:
#   results/input/stormtracks/events/constant/README.txt

set -e

SAMPLE=99
YEAR=2017
STORM_IN_YEAR=0
BASIN="NA"
TRACK_OUTPUT="results/power_intersection/storm_data/all_winds"
INTERSECTION_OUTPUT="results/power_intersection/storm_data/individual_storms"
STORM_ID=${SAMPLE}_${YEAR}_${STORM_IN_YEAR}
THRESHOLD_SPEED=35
CORES=all

# download input data
snakemake --cores ${CORES} download_all

# create grid and target files for the region and boxes in the config file
snakemake --cores ${CORES} process_gridfinder
snakemake --cores ${CORES} process_targets
snakemake --cores ${CORES} process_connector

# extract wind speeds for sample (should generate a TC_... file with storm location and intensity timeseries)
snakemake --cores ${CORES} ${TRACK_OUTPUT}/${BASIN}/${SAMPLE}/completed.txt

# perform intersection with grid infrastructure
snakemake --cores ${CORES} ${INTERSECTION_OUTPUT}/${BASIN}/${SAMPLE}/storm_${STORM_ID}/${THRESHOLD_SPEED}/storm_r${BASIN}_s${SAMPLE}_n${STORM_ID}.txt
