resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
    alarm_name = "High-CPU-Alarm-EC2"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1                  
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = 300               
    statistic           = "Average"          
    threshold           = 80

    dimensions = {
        InstanceId = aws_instance.web_server.id
    }

    alarm_description = "Cảnh báo khi CPU trung bình vượt quá 80% liên tục trong 5 phút."
    alarm_actions = [ aws_sns_topic.cpu_alert_topic.arn ]
}