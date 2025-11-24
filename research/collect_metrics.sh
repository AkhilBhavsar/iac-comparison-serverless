#!/usr/bin/env bash
# Simple helper to run and time commands and append CSV rows to research/results.csv
set -e
OUTFILE="research/results.csv"
mkdir -p research
if [ ! -f "$OUTFILE" ]; then
  echo "tool,run_type,env,action,start_ts,end_ts,duration_seconds,resources_created,errors,notes" > $OUTFILE
fi

start_ts=$(date +%s)
# Example: run terraform apply (the caller should run this wrapper with appropriate working dir)
# This script just demonstrates format; replace with actual commands.
echo "Running sample sleep to simulate deployment..."
sleep 1
end_ts=$(date +%s)
duration=$((end_ts-start_ts))
echo "terraform,initial,dev,apply,$start_ts,$end_ts,$duration,10,0,simulated" >> $OUTFILE
echo "Wrote metrics to $OUTFILE"
