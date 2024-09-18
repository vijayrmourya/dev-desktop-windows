output "AMI_ID" {
  value = data.aws_ami.windows_ami.id
}

output "instance_id" {
  value = module.instane_with_key_iam.instance_id
}

output "instance_public_ip" {
  value = module.instane_with_key_iam.instance_public_ip
}

output "windows-password" {
  value = module.instane_with_key_iam.windows_password
}