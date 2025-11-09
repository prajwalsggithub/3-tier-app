# INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.three-tier.id
    tags = {
        Name = "three-tier-igw"
    }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
    domain = "vpc"
    tags = {
        Name = "nat-eip"
    }
  
}

# NAT GATEWAY
resource "aws_nat_gateway" "natgw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.pub1.id
    tags = {
        Name = "nat-gateway"
    }
    depends_on = [aws_internet_gateway.igw ]

  
}

# ROUTE TABLE FOR PUBLIC SUBNETS
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.three-tier.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "public-rt"
    }
  
}

# PRIVATE ROUTE TABLE FOR FRONTEND SUBNETS
resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.three-tier.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgw.id
    }
    tags = {
        Name = "private-rt"

    } 
}
# ASSOCIATION OF PUBLIC ROUTE TABLE WITH PUBLIC SUBNETS
resource "aws_route_table_association" "pub_assoc" {
    subnet_id = aws_subnet.pub1.id
    route_table_id = aws_route_table.public_rt.id

  
}
resource "aws_route_table_association" "pub2" {
    subnet_id = aws_subnet.pub2.id
    route_table_id = aws_route_table.public_rt.id
  
}

# ASSOCIATION OF PRIVATE ROUTE TABLE WITH PRIVATE SUBNETS
resource "aws_route_table_association" "front-3a" {
    subnet_id = aws_subnet.private-sub-front-3a.id
    route_table_id = aws_route_table.private-rt.id
  
}
resource "aws_route_table_association" "front-4b" {
    subnet_id = aws_subnet.private-subnet-front-4b.id
    route_table_id = aws_route_table.private-rt.id

}
resource "aws_route_table_association" "back-5a" {
    subnet_id = aws_subnet.private-subnet-back-5a.id
    route_table_id = aws_route_table.private-rt.id
  
}
resource "aws_route_table_association" "back-6b" {
    subnet_id = aws_subnet.private-subnet-back-6b.id
    route_table_id = aws_route_table.private-rt.id
  
}
resource "aws_route_table_association" "rds-7a" {
    subnet_id = aws_subnet.private-subnet-rds-7a.id
    route_table_id = aws_route_table.private-rt.id
  
}
resource "aws_route_table_association" "rds-8b" {
    subnet_id = aws_subnet.private-subnet-rds-8b.id
    route_table_id = aws_route_table.private-rt.id
  
}



