#!/bin/bash

set -xe

cd /usr/local/src
apt-get build-dep -y nginx
apt-get source nginx
cd nginx-1.*
SRCDIR=$PWD
cp $SRCDIR/debian/libnginx-mod-http-echo.nginx $SRCDIR/debian/libnginx-mod-http-vhost-traffic-status.nginx
echo "load_module modules/ngx_http_vhost_traffic_status_module.so;" > $SRCDIR/debian/libnginx-mod.conf/mod-http-vhost-traffic-status.conf
cat <<EOF >> $SRCDIR/debian/control

Package: libnginx-mod-http-vhost-traffic-status
Architecture: any
Depends: ${misc:Depends}, ${shlibs:Depends}
Description: vhost-traffic-status
 VTS truc la
 https://github.com/vozlt/nginx-module-vts
EOF
(cd $SRCDIR/debian/modules; git clone https://github.com/vozlt/nginx-module-vts.git http-vhost-traffic-status)
sed -i \
    -e '/--add-dynamic-module=$(MODULESDIR)\/nchan/a --add-dynamic-module=$(MODULESDIR)\/http-vhost-traffic-status \\' \
    -e '/^	nchan \\$/a http-vhost-traffic-status \\' \
    $SRCDIR/debian/rules

dpkg-buildpackage
cp -prv ../libnginx-mod-http-vhost-traffic-status* /dist/
ls -alh /dist/
