#!/usr/bin/env sh

set -e
set -u

KSM_DIR=/sys/kernel/mm/ksm

if [ ! -d $KSM_DIR ]; then
  printf '%s\n' "error: KSM not available." 1>&2
  exit 1
fi

printf '%s\n' "time,pages_unshared,pages_saved,pages_shared,full_scans"

while true; do
  TIME=`date +%s`
  PAGES_UNSHARED=`cat $KSM_DIR/pages_unshared`
  PAGES_SHARING=`cat $KSM_DIR/pages_sharing`
  PAGES_SHARED=`cat $KSM_DIR/pages_shared`
  FULL_SCANS=`cat $KSM_DIR/full_scans`
  printf '%s\n' "$TIME,$PAGES_UNSHARED,$PAGES_SHARING,$PAGES_SHARED,$FULL_SCANS"
  sleep 2
done



