@echo off
::�����в�������%1��%2��%3��~%9��˳�򴫹���
::������ʽ".fbx"
set input1=%1%

::.max ·��"C:\Users\22047629\Desktop\test.max"
set input2=%2%

::3dsmaxbatch.exe·��"D:\programFiles\AutoDesk\3ds Max 2021\"
set input3=%3%

::����3dsmaxbatch.exe����·��
cd  /d  %input3%

::convertMax2Fbx.ms��Ҫ��3dsmaxbatch.exe��ͬһĿ¼
3dsmaxbatch.exe convertMax2Fbx.ms  -mxsString fExt:%input1% -sceneFile %input2%