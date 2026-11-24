## Лабораторная работа: готовый образ Nginx в Docker

## 1. Проверка Docker

Проверил, что Docker установлен, и посмотрел его версию:

```shell
docker version
```
![Версия Docker](/Dockertask/nginx/Screenshot_1.png)
## 2. Подготовка (чистый лист)

Посмотрел, какие контейнеры уже есть, остановил их и удалил остановленные:

```shell
docker ps -a
docker stop $(docker ps -q)
docker container prune -f
docker ps -a
docker images
```
После очистки контейнеров не осталось.

![Очистка контейнеров](/Dockertask/nginx/img1.png)

## 3. Получение образа Nginx и запуск контейнера

Нашёл образ на Docker Hub:

```shell
docker search nginx
```


Запустил контейнер. `docker run` сам скачал образ, создал и запустил контейнер:

```shell
docker run -d --name my-nginx -p 80:80 nginx
docker ps -a
```

Запуск контейнера
![Запуск](image.png)


## 4 Управление контейнером
Лог контейнера (видны запуск воркеров и мои запросы к серверу):

```shell
docker logs my-nginx
```

![docker logs](Screenshot_2.png)


### Работа внутри контейнера

Зашёл в контейнер:

```shell
docker exec -it my-nginx bash
```

Информация об ОС:

```shell
uname -a
cat /etc/os-release
```

![uname](/Dockertask/nginx/Screenshot_3.png)

![os-release](/Dockertask/nginx/Screenshot_4.png)

Установил несколько программ:

```shell
apt update && apt install -y fastfetch htop inxi cmatrix hollywood caca-utils mc micro
```

Во время установки одна из программ спросила выбор, я выбрал английскую (`1`):



`fastfetch` показывает сводку о системе:

```shell
fastfetch
```

![fastfetch](/Dockertask/nginx/img2.png)

`htop` показывает процессы (видно мастер-процесс nginx и его воркеры):

```shell
htop
```

![htop](/Dockertask/nginx/Screenshot_5.png)

`cmatrix`:

```shell
cmatrix
```

![cmatrix](/Dockertask/nginx/Screenshot_6.png)

`cacafire`:

```shell
cacafire
```

![cacafire](/Dockertask/nginx/Screenshot_7.png)

`hollywood` запускает сразу несколько окон в tmux (atop, bmon, логи и другое):

```shell
hollywood
```

![hollywood](/Dockertask/nginx/Screenshot_8.png)

## 5. Редактирование страницы Nginx

![nginx](/Dockertask/img/image.png)