#!/bin/sh
# master script nice comments here
# variables
user=juliano
password=senha
# create user
echo =-=-=-=-=-=-=-=-=-=-=
echo Adding user $user
echo =-=-=-=-=-=-=-=-=-=-=
./00_add_user.sh $user $password
echo =-=-=-=-=-=-=-=-=-=-=
echo Setting up
echo =-=-=-=-=-=-=-=-=-=-=
./01_base_setup.sh $user
echo =-=-=-=-=-=-=-=-=-=-=
echo  Installing programs
echo =-=-=-=-=-=-=-=-=-=-=
./02_install_programs.sh $user
echo =-=-=-=-=-=-=-=-=-=-=
echo Finalizing
echo =-=-=-=-=-=-=-=-=-=-=
./03_finalize.sh $user
