terraform {
  backend "s3" {
    bucket         = "taru-es-hello-7"   
    key            = "terraform/terraform.tfstate"     
    region         = "ap-south-1"               
    encrypt        = true
    
  }
}
