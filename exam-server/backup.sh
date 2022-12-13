#!/usr/bin/env bash

BACKUP_DIR="BACHKUP_DIR"

# exam
echo "Backing up exam.."
echo "Copying.."
cp -r home backup_exam_`date +%d-%m-%Y"_"%H_%M_%S`
echo "Moving.."
mv backup_exam_* BACHKUP_DIR