resource "aws_route53_zone" "primary" {
  name = var.aws_route53_zone
}
resource "aws_route53_record" "write1" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "write1.${var.aws_route53_zone}"
  type    = "CNAME"
  ttl     = "300"
  records = [
      aws_rds_cluster.default.endpoint
  ]
}
resource "aws_route53_record" "read1" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "read1.${var.aws_route53_zone}"
  type    = "CNAME"
  ttl     = "300"
  records = [
    aws_rds_cluster_instance.cluster_instances.endpoint
  ]
}
resource "aws_route53_record" "read_instance1" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "read_instance1.${var.aws_route53_zone}"
  type    = "CNAME"
  ttl     = "300"
  records = [
    aws_rds_cluster_instance.cluster_instances-writer.endpoint
    ]
}
resource "aws_route53_record" "read_instance2" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "read_instance2.${var.aws_route53_zone}"
  type    = "CNAME"
  ttl     = "300"
  records = [
    aws_rds_cluster_instance.cluster_instances-reader1.endpoint
  ]
}
resource "aws_route53_record" "read_instance3" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "read_instance3.${var.aws_route53_zone}"
  type    = "CNAME"
  ttl     = "300"
  records = [
   aws_rds_cluster_instance.cluster_instances-reader2.endpoint
  ]
}