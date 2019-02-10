# terraform-http-setcronjob-whitelist ![](https://img.shields.io/badge/license-MIT-blue.svg)

This module scrapes the SetCronJob IPs from their website and makes them available as a list. If you are using this module, I highly recommend subscribing to the SetCronJob Notification emails regarding changes to this list at http://eepurl.com/cxEQcL. Since this module dynamically generates the list, it won't be updated alongside updates to the SetCronJob list updates.

[The SetCronjob service documentation](https://support.setcronjob.com/hc/en-us/articles/219802207-SetCronJob-IP-addresses-list) points to the following text files for IPs that they use:

-   https://www.setcronjob.com/ip.txt
-   https://www.setcronjob.com/ipv4.txt
-   https://www.setcronjob.com/ipv6.txt

# Usage

```hcl
module "scj" {
  source = "github.com/captn3m0/terraform-http-setcronjob-whitelist"
}

resource "aws_security_group_rule" "allow_all_from_scj" {
  type            = "ingress"
  from_port       = 0
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = ["${module.scj.ipv4_cidr}"]
  security_group_id = "sg-123456"
}
```

# Outputs

| Name      | Description                                                                                            |
| --------- | ------------------------------------------------------------------------------------------------------ |
| ips       | List of all SetCronjob egress IPs, scraped from https://www.setcronjob.com/ip.txt                      |
| ipv4      | List of all SetCronjob egress IPv4 IPs, scraped from https://www.setcronjob.com/ipv4.txt               |
| ipv4_cidr | List of all SetCronjob egress IPv4 IPs as /32 CIDRs, scraped from https://www.setcronjob.com/ipv4.txt  |
| ipv6      | List of all SetCronjob egress IPv6 IPs, scraped from https://www.setcronjob.com/ipv6.txt               |
| ipv6_cidr | List of all SetCronjob egress IPv6 IPs as /128 CIDRs, scraped from https://www.setcronjob.com/ipv6.txt |

# LICENSE

Licensed under MIT. See [nemo.mit-license.org](https://nemo.mit-license.org/) for complete text.
