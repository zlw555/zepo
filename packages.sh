#!/bin/bash
echo "搜索.DS_Store文件并刪除它們"
find ./ -iname ".DS_Store" -exec rm {}  \;
echo ".DS_Store 文件已刪除"
echo "开始重新压缩deb"
rm -rf Packages Packages.xz Packages.gz Packages.bz2 Packages.lzma Packages.zst
dpkg-scanpackages -m ./debs /dev/null >Packages
xz -c9 Packages > Packages.xz
gzip -c9 Packages > Packages.gz
bzip2 -c9 Packages > Packages.bz2
lzma -c9 Packages > Packages.lzma
