resource "aws_vpc""three-tier" {
    cidr_block = "172.20.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "3-tier-app-vpc"
    }
  
}
#bastion subnets
resource "aws_subnet" "pub1" {
    vpc_id = aws_vpc.three-tier.id
    cidr_block = "172.20.1.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true
    tags = {
        Name = "bastion-subnet-1a"
    }
  
}
#bastion subnets
resource "aws_subnet" "pub2" {
    vpc_id = aws_vpc.three-tier.id
    cidr_block = "172.20.2.0/24"
    availability_zone = "us-west-2b"
    map_public_ip_on_launch = true
    tags = {
        Name = "bastion-subnet-1b"
    }
  
}
#private subnets frontend 1-a
resource "aws_subnet" "private-sub-front-3a" {
    vpc_id = aws_vpc.three-tier.id
    cidr_block = "172.20.3.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = false
    tags = {
        Name = "private-frontend-1a"
    }
  
}
# private subnets frontend 1-b
resource "aws_subnet" "private-subnet-front-4b" {
    vpc_id = aws_vpc.three-tier.id
    cidr_block = "172.20.4.0/24"
    availability_zone = "us-west-2b"
    map_public_ip_on_launch = false
    tags = {
        Name = "private-frontend-1b"
    }
  
}
#backend subnets 1-a
resource "aws_subnet" "private-subnet-back-5a" {
    vpc_id = aws_vpc.three-tier.id
    cidr_block = "172.20.5.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = false
    tags = {
        Name = "backend-subnet-1a"
    }
  
}
resource "aws_subnet" "private-subnet-back-6b" {
    vpc_id = aws_vpc.three-tier.id
    cidr_block = "172.20.6.0/24"
    availability_zone = "us-west-2b"
    map_public_ip_on_launch = false
    tags = {
        Name = "backend-subnet-1b"
    }
  
}
# rds subnet group
resource "aws_subnet" "private-subnet-rds-7a" {
    vpc_id = aws_vpc.three-tier.id
    cidr_block = "172.20.7.0/24"
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = false
    tags = {
        Name = "rds-subnet-1a"
    }
  
}
resource "aws_subnet" "private-subnet-rds-8b" {
    vpc_id = aws_vpc.three-tier.id
    cidr_block = "172.20.8.0/24"
    availability_zone = "us-west-2b"
    map_public_ip_on_launch = false
    tags = {
        Name = "rds-subnet-1b"
    }
  
}
