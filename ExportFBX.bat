@echo off
::命令行参数会以%1，%2，%3，~%9的顺序传过来
::导出格式".fbx"
set input1=%1%

::.max 路径"C:\Users\22047629\Desktop\test.max"
set input2=%2%

::3dsmaxbatch.exe路径"D:\programFiles\AutoDesk\3ds Max 2021\"
set input3=%3%

::进入3dsmaxbatch.exe所在路径
cd  /d  %input3%

::convertMax2Fbx.ms须要和3dsmaxbatch.exe在同一目录
3dsmaxbatch.exe convertMax2Fbx.ms  -mxsString fExt:%input1% -sceneFile %input2%