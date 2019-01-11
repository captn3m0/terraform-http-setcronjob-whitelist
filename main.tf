data "http" "list-txt" {
  url = "https://www.setcronjob.com/ip.txt"
}

data "http" "list-ipv4" {
  url = "https://www.setcronjob.com/ipv4.txt"
}

data "http" "list-ipv6" {
  url = "https://www.setcronjob.com/ipv6.txt"
}
