#!/bin/bash
#Author: Sager Xiao <sagerxiao@gmail.com>
#file_read_write.sh


ROOT_DIR=/home/sager/project/web/static/js

cat `find $ROOT_DIR -name *.js` > js_list.txt
