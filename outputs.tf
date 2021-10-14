# Outputs file
output "website-url" {
  value = module.s3-bucket.s3_bucket_website_endpoint
}
output "catapp_url" {
  value = "http://${aws_eip.hashicat.public_dns}"
}

output "catapp_ip" {
  value = "http://${aws_eip.hashicat.public_ip}"
}
