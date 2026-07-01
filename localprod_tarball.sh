#!/bin/bash

DMWORKDIR=/exp/dune/app/users/chasnip/CERN_Fellowship/protodunedm_v10_17_02d00
LOCALPRODDIR=${DMWORKDIR}/localProducts_larsoft_*

if [ -z "${LOCALPRODDIR}" ]; then
  echo "[ERROR]: not source localproducts is not set up, cannot tar up required binaries."
  exit 1
fi

mkdir tar_state; cd tar_state
cp -r ${LOCALPRODDIR} ./
mkdir ./srcs
rm -r localProducts_larsoft_v10_17_02_e26_prof/dunereco
rm -r localProducts_larsoft_v10_17_02_e26_prof/pdhdbsmsimulation
rm -r localProducts_larsoft_v10_17_02_e26_prof/pdhdbsmanalysis
tar -cf beam_job_localprod.tar ./*

localprod_tar=`justin-cvmfs-upload beam_job_localprod.tar`

cd ..
rm -rf tar_state
