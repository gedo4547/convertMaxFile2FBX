@echo off
::����.maxģ���ļ�
set maxModelPath=D:\model\ģ���ļ�

::���õ�����ʽ
set exportExt=".fbx"

::����3dsmaxbatch.exe�ļ�·��������ConvertMax2Fbx.ms���������ļ�����
set maxbatchExePath="D:\ProgramFiles\3Dsmax\3ds Max 2020"

::����exportFbx.bat�ļ�·��
set exportFbxBatPath=C:\Users\22047629\Desktop\scripts\ExportFbx.bat

::����ģ���ļ�
cd /d %maxModelPath%

::�ݹ鵱ǰ�ļ����������ļ����ҵ�����.max�ļ�
for /r %%i in (*.max) do (
    echo "%%i"
    ::��ÿ��.maxִ��ת���ű���ϵͳĬ��ִ���굱ǰ�ű�����ִ���¸��ű�����
    %exportFbxBatPath%  %exportExt%  "%%i"  %maxbatchExePath%
)
