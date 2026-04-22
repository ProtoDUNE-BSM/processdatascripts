# processdatascripts
Scripts to process raw PD-HD data using Justin and the DUNE grid.

We have a yaml and fcl file for each run available to process. Each yaml file calls the associated fcl file for that run, and that fcl file calls the correct .csv sps spill data file to be read by the job.

First thing is needed is to get the correct certificates and generate a tarball to be uploaded with the job.

```
setup justin
justin time
htgettoken -a htvaultprod.fnal.gov -i dune
justin get-token

source tarball.sh
```

Running `tarball.sh` loads all of the scripts and SPS spill data into a tarball with the env variable `$util_tar`. This is uploaded to the justin job.

To then process data use `standardsub_justin_pdhddata_command.sh`. Edit the `RUN` and `LIMIT` variables in this bash script to change the run number and limit the number of files to process from a run respectively. I could make these options command-line editable if it is useful.
```
source standardsub_justin_pdhddata_command.sh
```
Will submit a workflow for the `RUN` number of choice. You can leave `LIMIT` blank to process the full run.

Changing the `RUN` number changes the metacat query, the `.yaml` configuration file and `.json` file for the metadata. The `.yaml` file for a specific run calls the correct `.fcl` file, which loads the correct SPS spill data file. There is a mapping in `standardsub_justin_pdhddata_command.sh` between the run number and the correct magnet wobbling configuration.

The `--scope` command-line input of `justin simple-workflow` is currently set to usertests as this is the only scope that is available to me. This should be changed.

For online testing you can also run `testsub_justin_pdhddata_command.sh`.

The user may want to run jobs using custom C++ code. For this run the tarbal maker script
```
source localprod_tarball.sh
```
This unpacks a tarball of the local products in cvmfs at location held in env variable `$localprod_tar`. You can then add this to the justin command line: `--env DUNESW_TAR=$localprod_tar`.
