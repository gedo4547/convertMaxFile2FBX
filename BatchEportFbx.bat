@echo off
::设置.max模型文件
set maxModelPath=D:\model\模型文件

::设置导出格式
set exportExt=".fbx"

::设置3dsmaxbatch.exe文件路径，并将ConvertMax2Fbx.ms拷贝到此文件夹下
set maxbatchExePath="D:\ProgramFiles\3Dsmax\3ds Max 2020"

::设置exportFbx.bat文件路径
set exportFbxBatPath=C:\Users\22047629\Desktop\scripts\ExportFbx.bat

::进入模型文件
cd /d %maxModelPath%

::递归当前文件夹下所有文件，找到所有.max文件
for /r %%i in (*.max) do (
    echo "%%i"
    ::对每个.max执行转换脚本，系统默认执行完当前脚本后再执行下个脚本命令
    %exportFbxBatPath%  %exportExt%  "%%i"  %maxbatchExePath%
)
