resource "aws_key_pair" "key-1" {
   key_name = "key-1"
   public_key= "${file("key.pem.pub")}" 
  
}

resource "aws_key_pair" "key-2" {
   key_name = "key-2"
   public_key= "${file("key.pem.pub")}" 
  
}