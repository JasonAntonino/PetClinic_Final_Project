output "instance_public_IP" {
  value = aws_instance.foo.public_ip
}
output "jenk_ip" {
  value = aws_instance.jenkins.public_ip
}
output "worker_ip" {
value = aws_instance.worker.public_ip
}