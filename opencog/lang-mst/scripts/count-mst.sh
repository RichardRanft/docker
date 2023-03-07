#! /bin/bash
#
# count-mst.sh
#
# Fully-automated MST counting, specialized for the current
# Docker setup.
# -----------------

# Everything we need has been copied into run-1.
# Leave it as is, for the user to experiment in.
# Do the actual work in run-3.
# Avoid confusion by removing the config for earlier and later stages.
cd ~/experiments/
cp -pr run-1 run-3
cd run-3
rm -f 2-pair-conf.sh 4-gram-conf.sh

# Use the default configuration.
source 0-pipeline.sh
source 3-mpg-conf.sh

# Remove scripts for earlier and later stages (avoid confusion)
cd run
rm -rf 2-word-pairs 4-gram-class

# Run the MST counting pipeline in byobu.
cd 3-mst-parsing
./run-all-mst.sh

echo "Done MST counting. Good bye!"
