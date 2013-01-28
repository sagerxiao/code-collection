#!/usr/bin/python
#Author: Sager Xiao <sagerxiao@gmail.com>
#file_read_write.py
#Use bash only on command, see ../bash-scirpts/file_read_write.sh
import os

def walkDir(rootdir=None, tofile=None):
    print rootdir
    count = 0
    lines = 0
    codefile = open(tofile, 'w+')
    for parent, dirnames, filenames in os.walk(rootdir):
        #for dirname in dirnames:
        #    print "parent is:" + parent
        #    print "dirname is:" + dirname
        for filename in filenames:
            if filename[-3:] == ".js":
                filename = os.path.join(parent, filename)
                print filename
                srcfile = open(filename, 'r')
                
                line = srcfile.readline()
                while line:
                    if len(line.strip()) > 0:
                        codefile.write(line)
                    line = srcfile.readline()
                    lines += 1
                srcfile.close()
                count += 1
    print 'read file completed,', count, 'source file readed.'
    print 'Total %s lines readed.' % lines

    codefile.close()

def main():
    walkDir(rootdir="/home/sager/project/web/static/js", tofile='js_list.txt')
    
if __name__ == "__main__":
    main()
