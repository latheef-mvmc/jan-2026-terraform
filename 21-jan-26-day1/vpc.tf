resource "aws_vpc" "august_batch_vpc" {
  cidr_block = "60.0.0.0/16"
    tags = {
        Name = "AugustBatchVPC"
    }
}

#aws_vpc.august_batch_vpc.id
