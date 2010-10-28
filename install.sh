#!/bin/bash
for i in `ls -a | grep -v '\.$' | grep -v install.sh`; do rm -rf ~/$i; ln -s `pwd`/$i ~/$i; done
