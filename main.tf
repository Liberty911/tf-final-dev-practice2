terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.10.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    } 
  }
}

provider "aws" {
 region = "eu-north-1"
 
}

resource "random_id" "rand-id" {
    byte_length = 8
  
}
resource "aws_s3_bucket" "demo-buck" {
    bucket = "kola-tf-${random_id.rand-id.hex}"
  
}

resource "aws_s3_bucket_object" "bucket-data" {
    bucket = aws_s3_bucket.demo-buck.bucket
    source = "./myfile.txt"
    key = "mydata.txt"
  
}
output "name" {
  value  = random_id.rand-id.hex
}