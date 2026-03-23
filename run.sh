#!/bin/bash

BEFORE=$(git rev-parse @)
git pull --ff-only origin
AFTER=$(git rev-parse @)

if [ "$BEFORE" != "$AFTER" ]; then
    echo "⚠️  Updated from remote — restarting..." >&2
    exec "/home/training/course_dir/data_dir/MarkFiers/run.sh" "$@"
fi

# Safe to continue — already was up to date

echo "Start conda environment"
source /home/training/miniforge3/etc/profile.d/conda.sh
conda activate mark
jupyter lab
