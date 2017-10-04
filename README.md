# media-dropbox-backup

Backup media folder to Dropbox

## Basic Usage

```
$ docker run \
  --name media_backup \
  -d \
  --restart=always \
  --log-opt max-size=1m \
  --log-opt max-file=5 \
  -e FOLDER_PATH=/any/folder \
  -e ARCHIVE_NAME=media \
  -e DROPBOX_PREFIX=PROJECT_NAME \
  -e DROPBOX_ACCESS_TOKEN=YOUR_TOKEN \
  -e SCHEDULE=@daily \
  mc388/media-dropbox-backup
```

## Environment variables

- `FOLDER_PATH` the path to folder *required*
- `ARCHIVE_NAME` the archive name *required*
- `DROPBOX_PREFIX` path prefix in your Dropbox (default: empty)
- `DROPBOX_ACCESS_TOKEN` your Dropbox API access token *required*
- `SCHEDULE` backup schedule time, see explainatons below

### Automatic Periodic Backups

You can additionally set the `SCHEDULE` environment variable like `-e SCHEDULE="@daily"` to run the backup automatically.

More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).
