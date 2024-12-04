resource "aws_sqs_queue" "order_queue" {
  name = "order-processing"
}

resource "aws_cloudwatch_event_rule" "order_rule" {
  name        = "order-rule"
  description = "Triggered on new orders"
  event_pattern = <<EOF
{
  "source": ["order.events"]
}
EOF
}
