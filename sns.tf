resource "aws_sns_topic" "cpu_alert_topic" {
    name = "EC2-CPU-Alert"
}

resource "aws_sns_topic_subscription" "email_sub" {
    topic_arn = aws_sns_topic.cpu_alert_topic.arn
    protocol = "email"
    endpoint = var.alert_email
}