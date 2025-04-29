#!/bin/bash

:<<'EOF'

Submit jobs with justin using metacat query to find np04 BSM trigger files

make the tarball and upload it to cvmfs by running:
setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune

EOF

# Define run you want to process
RUN=29917

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

MQL_QUERY="files from dune:all where core.runs in (${RUN}) and core.run_type=hd-protodune and core.data_tier=raw and core.file_type=detector limit 1"

justin-test-jobscript --mql "${MQL_QUERY}" \
  --jobscript apr2025_generic_dataproc.jobscript \
  --env DUNESW_VERSION=v10_05_00d00 --env UTIL_TAR=$util_tar \
  --env YAMLFILE=pdhd_bsmtrigger_run${RUN}_data.yaml --env pipyaml=1 \
  --env JSONFILE=pdhd_w${WOB}_base_meta.json --env NEVENTS=1
