# aws lightsail get-instance-metric-data \
#     --instance-name mattgltinstance \
#     --metric-name CPUUtilization \
#     --period 7200 \
#     --start-time 1571342400 \
#     --end-time 1571428800 \
#     --unit Percent \
#     --statistics Average

sudo exec >/usr/local/logfile.txt 2>&1

aws cloudwatch get-metric-statistics \
--metric-name CPUUtilization \
--start-time 2022-06-26T23:18:00 \
--end-time  2022-06-29T23:18:00 \
--period 3600 \
--namespace AWS/EC2 \
--statistics Average \
--dimensions Name=InstanceId,Value=i-02d029cf72c33c0d1
