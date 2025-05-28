#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M)
BACKUP_DIR="/var/lib/jenkins"
S3_BUCKET="s3://cloudaseem-jenkins-backup-bucket"
tar -czf /tmp/jenkins-backup-$TIMESTAMP.tar.gz $BACKUP_DIR
aws s3 cp /tmp/jenkins-backup-$TIMESTAMP.tar.gz $S3_BUCKET/
rm -f /tmp/jenkins-backup-$TIMESTAMP.tar.gz
