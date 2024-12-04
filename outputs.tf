output "load_balancer_dns" {
  value = module.compute.lb_dns
}

output "s3_bucket_name" {
  value = module.storage.s3_bucket
}
