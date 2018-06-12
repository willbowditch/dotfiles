#! bash

# sync projects folder data to gcp backup
# uses multi threading for speed (-m)
# delete files in gcp that are no longer on local (-d)
# compress files before sending them with gzip (-J)
# -> note that compression is likely to slow binary files, but is good for text
#    as projects will contain mostly text files this is probably sensible
function backup_gcp() {

  echo 'Starting backup: ' `date`

  /usr/local/bin/gsutil -o "GSUtil:parallel_process_count=8" \
  -o "GSUtil:parallel_thread_count=1" -m  \
  rsync -r -d -J \
  /Users/willbowditch/projects gs://wb_backup/

  echo 'Backup complete: ' `date`

}

# run with logging: backup_gcp > /Users/willbowditch/backup.log 2>&1
