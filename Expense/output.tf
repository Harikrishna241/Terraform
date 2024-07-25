output "aws_image" {
    value = aws_instance.Prod[*].ami_id
}
  
# output "aws_state" {
#     value = aws_instance.Prod.instance_state[count.value]
# }

# output "public_net" {
#     value = aws_instance.Prod.associate_public_ip_address[count.value]
# }
  