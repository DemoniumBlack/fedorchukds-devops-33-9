# Автор: Федорчук Дмитрий Сергеевич DEVOPS-33

# Домашнее задание к занятию 4. «Оркестрация группой Docker-контейнеров на примере Docker Compose»

## Задача 1

Создайте собственный образ любой операционной системы (например, debian-11) с помощью Packer версии 1.5.0 ([инструкция](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/packer-quickstart)).

Чтобы получить зачёт, вам нужно предоставить скриншот страницы с созданным образом из личного кабинета YandexCloud.

## Решение 1

Поскольку, в соответствии с инструкцией, образ будем создавать в Yandex Cloud, устанавливаю необходимое приложение ```yc``` командой ```curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash``` и устанавливаю плагин для ```packer``` командой ```packer init config.pkr.hcl```. Листинг файла ```config.pkr.hcl``` взят из инструкции на сервисе Yandex Cloud.

Провожу инициализацию приложения ```yc``` командой ```yc init```, ввожу полученный в Yandex Cloud OAuth-токен, тем самым подключаю рабочую машину к Yandex Cloud:

![img_0.png](IMG/img_0.png)

Проверяю доступные образы командой ```yc compute image list```, чтобы убедиться, что вход в Yandex Cloud выполнен успешно:

![img_1.png](IMG/img_1.png)

Образов нет, также как и в самом Yandex Cloud.

Создаю облачную сеть в рабочем каталоге своего профиля Yandex Cloud:

![img_2.png](IMG/img_2.png)

Создаю подсеть в созданной выше облачной сети:

![img_3.png](IMG/img_3.png)

Проверяю созданные сеть и подсеть:

![img_4.png](IMG/img_4.png)

Вижу, что в Yandex Cloud появились созданная мной сеть ```cloud-network``` и подсеть ```netology-subnet-a```.

Для создания образа операционной системы выбрал Alma Linux 9. Пишу файл в формате JSON, будет выполнено образа установка в него файлового менеджера Midnight Commander:

![img_5.png](IMG/img_5.png)

Проверяю файл на наличие ошибок:

![img_6.png](IMG/img_6.png)

Запускаю сборку образа:

![img_7.png](IMG/img_7.png)

Видно, что кроме сборки образа обновляется кэш пакетов и устанавливается ```mc```.

После завершения сборки выводится информация о том, что сборка прошла успешно, выводится время выполнения сборки и идентификатор образа:

![img_8.png](IMG/img_8.png)

Проверю наличие образа в Yandex Cloud используя команду ```yc compute image list```:

![img_9.png](IMG/img_9.png)

Видно, что появился собранный образ и он находится в статусе "Готов".

Также можно посмотреть на созданный образ в Web-интерфейсе Yandex Cloud:

![img_10.png](IMG/img_10.png)

Для экономии ресурсов Yandex Cloud удалю созданный образ:

![img_11.png](IMG/img_11.png)

Благодаря принципу идемпотентности повторное выполнение команды для сборки образа даст же результат, что и предыдущий раз или все последующие. То есть при необходимости образ можно будет создать заново.

## Задача 2

**2.1.** Создайте вашу первую виртуальную машину в YandexCloud с помощью web-интерфейса YandexCloud.        

**2.2.*** **(Необязательное задание)**      
Создайте вашу первую виртуальную машину в YandexCloud с помощью Terraform (вместо использования веб-интерфейса YandexCloud).
Используйте Terraform-код в директории ([src/terraform](https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/terraform)).

Чтобы получить зачёт, вам нужно предоставить вывод команды terraform apply и страницы свойств, созданной ВМ из личного кабинета YandexCloud.

## Задача 3

С помощью Ansible и Docker Compose разверните на виртуальной машине из предыдущего задания систему мониторинга на основе Prometheus/Grafana.
Используйте Ansible-код в директории ([src/ansible](https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/ansible)).

Чтобы получить зачёт, вам нужно предоставить вывод команды "docker ps" , все контейнеры, описанные в [docker-compose](https://github.com/netology-group/virt-homeworks/blob/virt-11/05-virt-04-docker-compose/src/ansible/stack/docker-compose.yaml),  должны быть в статусе "Up".

## Задача 4

1. Откройте веб-браузер, зайдите на страницу http://<внешний_ip_адрес_вашей_ВМ>:3000.
2. Используйте для авторизации логин и пароль из [.env-file](https://github.com/netology-group/virt-homeworks/blob/virt-11/05-virt-04-docker-compose/src/ansible/stack/.env).
3. Изучите доступный интерфейс, найдите в интерфейсе автоматически созданные docker-compose-панели с графиками([dashboards](https://grafana.com/docs/grafana/latest/dashboards/use-dashboards/)).
4. Подождите 5-10 минут, чтобы система мониторинга успела накопить данные.

Чтобы получить зачёт, предоставьте: 

- скриншот работающего веб-интерфейса Grafana с текущими метриками, как на примере ниже.
<p align="center">
  <img width="1200" height="600" src="./assets/yc_02.png">
</p>

## Задача 5 (*)

Создайте вторую ВМ и подключите её к мониторингу, развёрнутому на первом сервере.

Чтобы получить зачёт, предоставьте:

- скриншот из Grafana, на котором будут отображаться метрики добавленного вами сервера.


