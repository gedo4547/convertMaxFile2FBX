@echo off
::����.maxģ���ļ�
set maxModelPath="D:\model\ģ���ļ�"

::���õ�����ʽ
set exportExt=".fbx"

::����3dsmaxbatch.exe�ļ�·��������ConvertAllMax2Fbx.ms���������ļ�����
set maxbatchExePath="D:\ProgramFiles\3Dsmax\3ds Max 2020"

::����3dsmaxbatch.exe�����ļ���
cd  /d  %maxbatchExePath%

::ִ��Maxscript�ű�
3dsmaxbatch.exe  ConvertAllMax2Fbx.ms -mxsString fRoot:%maxModelPath%  -mxsString fExt:%exportExt%  
