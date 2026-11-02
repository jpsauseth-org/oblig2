output "public_ip" {
  description = "den offentlige ip addressen servicen bruker"
  value       = one(module.vm[*].public_ip)
}

output "hostname" {
  description = "Navnet på hosten, minner om DNS"
  value       = one(module.webapp[*].hostname)
}