#bash
echo install requirements
sudo yum install perl-DateTime perl-CPAN perl-Net-SSLeay perl-IO-Socket-SSL perl-Digest-SHA gcc -y
sudo yum install zip unzip

echo download aws monitor tool
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O

echo unzip monitor tool to ~/aws-scripts-mon
unzip CloudWatchMonitoringScripts-1.2.2.zip -d ~/ && \
rm CloudWatchMonitoringScripts-1.2.2.zip

echo set it to the crontab
crontab -l > crontab.txt
echo "*/5 * * * * ~/aws-scripts-mon/mon-put-instance-data.pl --mem-util --disk-space-util --disk-path=/ --from-cron" >> crontab.txt
crontab crontab.txt

echo done.
