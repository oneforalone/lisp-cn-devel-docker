# Lisp CN Website Docker Images for Development
---
Lisp-CN: [https://www.lisp-cn.net](https://www.lisp-cn.net) for mainland access, [https://www.lisp-cn.org](https://www.lisp-cn.org) for overseas.
See also: [Chinese Translation for The Common Lisp Cookbook](https://oneforalone.github.io/cl-cookbook-cn/#/)

This docker image aims to build the environment for developing Lisp-CN Website,
using NGINX + PHP based on Debian. Here is the details:

  * OS: debian 10.4 (buster)
  * NGINX: 1.14.2
  * PHP/PHP-FPM: 7.3.19

Start the web service via:

```sh
docker run -d --name lisp-cn-dev [-v /your/web/file/path:/var/www/html] [-p 8080:80] oneforalonee/lisp-cn-devel
```
