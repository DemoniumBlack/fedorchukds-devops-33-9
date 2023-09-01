# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1gd46779gqbk6bru6jd"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1gbcs2gb2i1shuj0hm7"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "almalinux9" {
  default = "fd8ijc3078fedtd2n5t0"
}