terraform {
  cloud {
    organization = "dokcer-final-project"

    workspaces {
      name = "final-project"
    }
  }
}