#!/bin/bash

tar -cf beam_job_utils.tar \
  beam_job_utils.py \
  pdhd_base_meta.json \
  pdhd_bsmtrigger_data.yaml \
  spillrun029424.csv \
  spillrun029425.csv \
  spillrun029917.csv \
  spillrun029918.csv \
  spillrun031036.csv \
  spillrun031107.csv \
  spillrun032176.csv \
  spillrun032177.csv \
  run_np04data_processor_run29424.fcl \
  run_np04data_processor_run29425.fcl \
  run_np04data_processor_run29917.fcl \
  run_np04data_processor_run29918.fcl \
  run_np04data_processor_run31036.fcl \
  run_np04data_processor_run31107.fcl \
  run_np04data_processor_run32176.fcl \
  run_np04data_processor_run32177.fcl

util_tar=`justin-cvmfs-upload beam_job_utils.tar`
