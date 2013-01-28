#!/bin/bash
#file_bakup.sh

BACKUPFILE=backup-$(date +%Y-%m-%d)

archive=${1:-$BACKUPFILE}

tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
gzip $archive.tar
echo "Directory $PWD backed up in archive file \"$archive.tar.gz\"."

#上面的代码对于太多文件或者如果文件名包含空格的时候，将执行失败，可以考虑下面的指令
#使用GNU版本的find
#find . -mtime -1 -type f -print0 |xargs -0 tar rvf "$archive.tar"

#对于其他风格的UNIX便于移植，但比较慢
#find . -mtime -1 -type f -exec tar rvf "$archive.tar" '{}' \;

exit 0

