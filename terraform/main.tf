# Usage
#
# $ terraform init
# $ terraform apply -replace="random_shuffle.shuffled_names"rm

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}

locals {
  names   = ["zipper", "takutaka", "drumato", "ressy", "shibatch", "masaki", "chiroru", "ryu-ch", "kmsn"]
  numbers = range(1, 10)
}

resource "random_shuffle" "shuffled_names" {
  input        = local.names
  result_count = length(local.names)
}

locals {
  zipped_map = zipmap(local.numbers, random_shuffle.shuffled_names.result)
}

output "shuffled_and_zipped_map" {
  value = local.zipped_map
}
