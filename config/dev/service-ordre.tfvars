tjeneste       = "ordre"
runtime        = "vm"
prefix         = "10.10.0.0/24"
ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMQ32gu8mGVI86gkUex5JsBeg7WC58bsUOVuxmeHDJW oblig2-ingen-privat-nokkel"
ekstra_regler = {
  tcp-8143 = { prioritet = 110, port = "8143", kilde = "172.16.179.0/24" }
}