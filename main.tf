module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  name          = "MyEC2Instance"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-unique-bucket-name-12345"
}
