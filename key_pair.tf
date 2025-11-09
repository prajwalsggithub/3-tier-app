# # Generate SSH key pair locally
# resource "tls_private_key" "prajwal_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# # Create AWS Key Pair using the generated public key
# resource "aws_key_pair" "prajwal_key" {
#   key_name   = "prajwal-key"
#   public_key = tls_private_key.prajwal_key.public_key_openssh
# }

# # Save the private key to a local file (for SSH use)
# resource "local_file" "private_key_pem" {
#   content  = tls_private_key.prajwal_key.private_key_pem
#   filename = "${path.module}/prajwal-key.pem"
# }
