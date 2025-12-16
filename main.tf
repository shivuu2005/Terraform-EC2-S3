module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0cfde0ea8edd312d4"

  instance_type = "t2.micro"
  name          = "EC2Instance"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-unique-bucket-name-12345"
}
