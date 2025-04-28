#!/bin/bash

:<<'EOF'

Submit jobs with justin using metacat query to find np04 BSM trigger files

make the tarball and upload it to cvmfs by running:
setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune

EOF

# Define run you want to process
RUN=29425

USERF=${USER}/ProtoDUNEBSM/PDHDBSMData/run029425
FNALURL='https://fndcadoor.fnal.gov:2880/dune/scratch/users'

MQL_QUERY="files from dune:all where core.runs in (${RUN}) and core.run_type=hd-protodune and core.data_tier=raw and core.file_type=detector limit 10"

justin simple-workflow --mql "${MQL_QUERY}" \
  --jobscript apr2025_generic_dataproc.jobscript \
  --rss-mb 4000 --env DUNESW_VERSION=v10_05_00d00 --env UTIL_TAR=$util_tar \
  --env YAMLFILE=pdhd_bsmtrigger_run${RUN}_data.yaml --env pipyaml=1 --scope usertests --lifetime-days 2 \
  --output-pattern "*_protodunehd_*.root:output-test"
  #--output-pattern "*_pdhdreco2_*.root:${FNALURL}/${USERF}"
