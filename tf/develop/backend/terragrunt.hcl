include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/backend"
}

inputs = {
  region      = "ap-southeast-2"
}
