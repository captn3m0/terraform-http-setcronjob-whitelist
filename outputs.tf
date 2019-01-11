locals {
  ips  = ["${split("\n", chomp(data.http.list-txt.body))}"]
  ipv4 = ["${split("\n", chomp(data.http.list-ipv4.body))}"]
  ipv6 = ["${split("\n", chomp(data.http.list-ipv6.body))}"]
}

output "ips" {
  description = "List of all SetCronjob egress IPs."
  value       = "${local.ips}"
}

output "ipv4" {
  description = "List of all SetCronjob egress IPv4 IPs."
  value       = "${local.ipv4}"
}

output "ipv6" {
  description = "List of all SetCronjob egress IPv6 IPs."
  value       = "${local.ipv6}"
}

output "ipv4_cidr" {
  description = "List of all SetCronjob egress IPv4 IPs, formatted as /32 CIDRs"
  value       = ["${formatlist("%s/32", local.ipv4)}"]
}

output "ipv6_cidr" {
  description = "List of all SetCronjob egress IPv6 IPs, formatted as /128 CIDRs"
  value       = ["${formatlist("%s/128", local.ipv6)}"]
}
