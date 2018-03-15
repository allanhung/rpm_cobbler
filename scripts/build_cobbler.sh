export RPMBUILDROOT=/root/rpmbuild
export COBBLERVER=2.8.2

yum -y install rpm-build rpmdevtools make patch
mkdir -p $RPMBUILDROOT/SOURCES && mkdir -p $RPMBUILDROOT/SPECS && mkdir -p $RPMBUILDROOT/SRPMS
# fix rpm marcos
sed -i -e "s#.centos##g" /etc/rpm/macros.dist

curl -s -o /tmp/cobbler.rpm http://rpmfind.net/linux/epel/7/SRPMS/Packages/c/cobbler--${COBBLERVER}-1.el7.src.rpm
rpm -i /tmp/cobbler.rpm
yum-builddep -y $RPMBUILDROOT/SPECS/cobbler.spec
/bin/cp -f /usr/local/src/sources/* $RPMBUILDROOT/SOURCES/
cd $RPMBUILDROOT/SPECS && patch -p1 < $RPMBUILDROOT/SOURCES/cobbler-${COBBLERVER}.patch
rpmbuild -bb $RPMBUILDROOT/SOURCES/cobbler.spec
