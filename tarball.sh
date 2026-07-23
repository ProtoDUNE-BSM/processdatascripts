#!/bin/bash
  #PandoraSettings_Master_ProtoDUNE_HD_Neutrino.xml \
  #PandoraSettings_Cosmic_ProtoDUNE_HD_TwoView_APA1.xml \
  #PandoraSettings_Neutrino_DUNEFD.xml \
  #PandoraSettings_Slicing_ProtoDUNE_HD_TwoView_APA1.xml \

tar -cf beam_job_utils.tar \
  beam_job_utils.py \
  PandoraSettings_Master_ProtoDUNE_HD_Neutrino.xml \
  PandoraSettings_Cosmic_ProtoDUNE_HD_TwoView_APA1.xml \
  PandoraSettings_Neutrino_DUNEFD.xml \
  PandoraSettings_Slicing_ProtoDUNE_HD_TwoView_APA1.xml \
  pdhd_wnp04_base_meta.json \
  pdhd_w133_base_meta.json \
  pdhd_bsmtrigger_data.yaml \
  pdhd_bsmtrigger_run29424_data.yaml \
  pdhd_bsmtrigger_run29425_data.yaml \
  pdhd_bsmtrigger_run29917_data.yaml \
  pdhd_bsmtrigger_run29918_data.yaml \
  pdhd_bsmtrigger_run31036_data.yaml \
  pdhd_bsmtrigger_run31107_data.yaml \
  pdhd_bsmtrigger_run32176_data.yaml \
  pdhd_bsmtrigger_run32177_data.yaml \
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
