#!/bin/bash

:<<'EOF'

Submit jobs with justin using metacat query to find np04 BSM trigger files

setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune

Use tarball.sh to upload tarball of scripts to cvmfs.

### Only useful if outputing to scratch
USERF=${USER}/ProtoDUNEBSM/PDHDBSMData/run029425
FNALURL='https://fndcadoor.fnal.gov:2880/dune/scratch/users'
In command-line of simple-workflow:
  --output-pattern "*_pdhdreco2_*.root:${FNALURL}/${USERF}"

Valid runs for pd-hd bsm:
29424, 29425, 29917, 29918, 31036, 31107, 32176, 32177

Wobbling Configuration to Run Number Map:
wnp04: 29424 + 29425
w133: 29917 + 29918 + 31036 + 31107 + 32176 + 32177

EOF

# Define run you want to process
RUN=29424
LIMIT="limit 10"
#LIMIT=""

# Map wobbling configuration to run number
case "$RUN" in
  29424|29425)
    WOB="np04"
    ;;
  29917|29918|31036|31107|32176|32177)
    WOB="133"
    ;;
  *)
    echo "Unknown RUN number: $RUN"
    exit 1
    ;;
esac

echo "Submit job for run $RUN, which was taken with T2 magnet wobbling configuration $WOB"
echo "yaml file: pdhd_bsmtrigger_run${RUN}_data.yaml"
echo "json file: pdhd_w${WOB}_base_meta.json"

MQL_QUERY="files from dune:all where core.runs in (${RUN}) and core.run_type=hd-protodune and core.data_tier=raw and core.file_type=detector ${LIMIT}"

justin simple-workflow --mql "${MQL_QUERY}" \
  --jobscript apr2025_generic_dataproc.jobscript \
  --rss-mb 4000 --env DUNESW_VERSION=v10_05_00d00 --env UTIL_TAR=$util_tar \
  --env YAMLFILE=pdhd_bsmtrigger_run${RUN}_data.yaml --env pipyaml=1 \
  --env JSONFILE=pdhd_w${WOB}_base_meta.json --scope usertests --lifetime-days 2 \
  --output-pattern "*_protodunehd_*.root:output-test"
