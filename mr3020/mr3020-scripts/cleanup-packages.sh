rm /tmp/\*.ipk
cd /overlay/usr/lib/opkg
opkg remove --force-removal-of-dependent-packages kmod-fs-ext4 
opkg remove --force-removal-of-essential-packages libpthread
rm /overlay/usr/lib/modules/*/ext*.ko /overlay/usr/sbin/e2fsck
opkg remove --force-removal-of-dependent-packages `egrep "Package:| 1315" status | cut -f2 -d" " | awk '{ if (1*$1>100000) print n; n=$1; }'`
# Clear out stray files in /overlay (deleting them from /usr to really free the space)
cd / ; rm `cd /overlay ; find . | egrep "usr/lib|usr/sbin|lib|sbin|usr/share"`
# Show what is left
df -h
find /overlay 
