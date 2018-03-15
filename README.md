RPMBUILD for cobbler on centos
=========================

cobbler rpm for centos (replace apache to nginx)

How to Build
=========

::

    git clone https://github.com/allanhung/rpm_cobbler
    cd rpm_cobbler
    docker run --name=cobbler_build --rm -ti -v $(pwd)/rpms:/root/rpmbuild/RPMS -v $(pwd)/sources:/usr/local/src/sources -v $(pwd)/scripts:/usr/local/src/build centos /bin/bash -c "/usr/local/src/build/build_cobbler.sh"

# check
::

    docker run --name=cobbler_build --rm -ti -v $(pwd)/rpms:/root/rpmbuild/RPMS centos /bin/bash -c "yum localinstall -y /root/rpmbuild/RPMS/x86_64/cobbler-*.rpm /root/rpmbuild/RPMS/noarch/cobbler-*.rpm"
