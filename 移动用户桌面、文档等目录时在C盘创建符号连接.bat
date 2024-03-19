@echo off
:: 14561为用户名
cd C:\Users\14561
:: 左侧为要创建的连接文件名，右侧为目标路径
mklink /d Music "E:\Music"
mklink /d Videos "E:\Videos"
mklink /d Desktop "E:\Desktop"
mklink /d Pictures "E:\Pictures"
mklink /d Documents "E:\Documents"
mklink /d Documents "E:\Documents"
mklink /d Downloads "E:\Downloads"
cmd /k