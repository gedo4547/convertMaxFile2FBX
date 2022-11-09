@echo off
::设置.max模型文件
set maxModelPath="D:\model\模型文件"

::设置导出格式
set exportExt=".fbx"

::设置3dsmaxbatch.exe文件路径，并将ConvertAllMax2Fbx.ms拷贝到此文件夹下
set maxbatchExePath="D:\ProgramFiles\3Dsmax\3ds Max 2020"

::进入3dsmaxbatch.exe所在文件夹
cd  /d  %maxbatchExePath%

::执行Maxscript脚本
3dsmaxbatch.exe  ConvertAllMax2Fbx.ms -mxsString fRoot:%maxModelPath%  -mxsString fExt:%exportExt%  
