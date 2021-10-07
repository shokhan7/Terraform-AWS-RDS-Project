# AWS RDS Terraform module
## Terraform module which creates RDS resources on AWS.

### Root module calls these modules which can also be used separately to create independent resources:

main.tf - creates RDS DB instance

## Usage
```
module "db" {
  source  = "maxat2416/RDS-project/aws"
  name           = "rds_db_team3_are_the_best"
  engine         = "aurora"
  engine_version = "5.6.10a"
  instance_class  = "db.r4.large"
  vpc_id  = "vpc-12345678"
  subnet_ids = ["subnet-12345678", "subnet-87654321"]
  allowed_security_groups = ["sg-12345678"]
  allowed_cidr_blocks     = ["10.20.0.0/20"]
  aws_ssm_parameter_name = "/devops/us-east-1/passwords/team3db-cluster"
  aws_route53_zone = "guldaray.com"
  region = "us-east-1"
}
```
## Notes
Edit the lines allowed_security_groups, allowed_cidr_blocks. Use different VPC from team 2. 