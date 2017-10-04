#!/bin/sh

set -eu

echo "Creating backup for $FOLDER_PATH..."
tar -czf $ARCHIVE_NAME.tgz -C $FOLDER_PATH .

echo "Upload backup to dropbox..."
curl -X POST https://content.dropboxapi.com/2/files/upload \
     --header "Authorization: Bearer $DROPBOX_ACCESS_TOKEN" \
     --header "Dropbox-API-Arg: {\"path\": \"/$DROPBOX_PREFIX$ARCHIVE_NAME.tgz\",\"mode\": \"overwrite\",\"autorename\": true,\"mute\": true}" \
     --header "Content-Type: application/octet-stream" \
     --data-binary @"$ARCHIVE_NAME.tgz"

rm $ARCHIVE_NAME.tgz
