// Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.smpVPC.id
  
  tags = {
    Name = "smp-IGW"
  }
}