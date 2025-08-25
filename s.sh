/////Exercise 1: Create and Schedule a Recurring Task Using Crontab

Step 1
Create a shell script that writes the current date and time to a file:
vim ~/datetime.sh

#!/bin/bash
date >> ~/datetime_log.txt
Make it executable:
chmod +x ~/datetime.sh

Step 2
Schedule it using crontab to run every minute:
crontab -e
* * * * * /home/username/datetime.sh
Check the output with:
cat ~/datetime_log.txt

////Exercise 2: Schedule a One-Time Task Using `at`
Step 1

Ensure `at` is installed and enabled:
sudo apt install at
sudo systemctl enable --now atd

Step 2
Schedule a task 5 minutes from now:
at now + 5 minutes
echo "One-time task completed at $(date)" >> ~/one_time_task.txt
Ctrl+D to exit input

Verify:
cat ~/one_time_task.txt
Exercise 3: View and Remove Scheduled Jobs

A. View your scheduled cron jobs:
crontab -l
B. Remove your cron jobs:
crontab -r
C. View pending `at` jobs:
atq
D. Remove an `at` job:
atrm <job_number>

///////Exercise 4: Schedule a Backup Task Using Crontab
Step 1

Create a script to backup Documents:
vim ~/backup.sh
#!/bin/bash
mkdir -p ~/backups
tar -czf ~/backups/documents_backup_$(date +%Y%m%d_%H%M%S).tar.gz
~/Documents
chmod +x ~/backup.sh

Step 2
Schedule the backup at 11:00 PM daily:
crontab -e
0 23 * * * /home/username/backup.sh
Check: verify files in ~/backups

/////////Exercise 5: Schedule System Resource Monitoring

Step 1
Create a monitoring script:
vim ~/monitor.sh
#!/bin/bash
echo "$(date)" >> ~/system_monitor.log
top -b -n1 | head -10 >> ~/system_monitor.log
chmod +x ~/monitor.sh

Step 2
Schedule it hourly:
crontab -e
0 * * * * /home/username/monitor.sh

Check:
cat ~/system_monitor.log

sudo systemctl enable cron