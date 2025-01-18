variable "public-sg-id" {
  type = string
}

variable "private-sg-id" {
  type = string
}

variable "pub-sub-id" {
  type = string  
}

variable "pri-sub-1-id" {
  type = string  
}

variable "pri-sub-2-id" {
  type = string  
}

variable "ami-id" {
  type = string
  default = "ami-00bb6a80f01f03502"
}

variable "instance-type" {
  type = string
  default = "t2.medium"
}

variable "key-name" {
  type = string
  default = "hello_tool"
}
