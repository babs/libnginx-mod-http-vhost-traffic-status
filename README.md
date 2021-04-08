Docker based system to build and package libnginx-mod-http-vhost-traffic-status (https://github.com/vozlt/nginx-module-vts.git)

Not the prettiest but it gets the job done.

Build image
-----------

```docker build -t localhost/libnginx-mod-http-vhost-traffic-status:dev .```

Run the image
-------------

```docker run --rm -v $PWD/dist/:/dist/ localhost/libnginx-mod-http-vhost-traffic-status:dev```

Enjoy :)
--------

```
$ ls -l dist/
total 540
-rw-r--r-- 1 root root 341328 Apr  8 03:47 libnginx-mod-http-vhost-traffic-status-dbgsym_1.14.2-2+deb10u3_amd64.deb
-rw-r--r-- 1 root root 207392 Apr  8 03:47 libnginx-mod-http-vhost-traffic-status_1.14.2-2+deb10u3_amd64.deb
```