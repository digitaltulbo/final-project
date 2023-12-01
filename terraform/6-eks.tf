resource "aws_iam_role" "smp" {
    name = "eks-cluster-smp"

    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
          "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY  
}

resource "aws_iam_role_policy_attachment" "smp-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.smp.name
}

resource "aws_eks_cluster" "smp" {
  name     = "smp"
  role_arn = aws_iam_role.smp.arn
    
  vpc_config {
    subnet_ids = [
        aws_subnet.public_subnet_a.id,
        aws_subnet.public_subnet_c.id,
        aws_subnet.private_subnet_a.id,
        aws_subnet.private_subnet_c.id,
        // aws_subnet.rds_subnet_a.id,
        // aws_subnet.rds_subnet_c.id
    ]
  }
  depends_on = [ aws_iam_role_policy_attachment.smp-AmazonEKSClusterPolicy ] 
}