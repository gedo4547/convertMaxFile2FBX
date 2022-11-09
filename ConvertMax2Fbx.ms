-- 获取命令行参数
opts = maxOps.mxsCmdLineArgs
-- 获取maxFileName，maxFileName为全局变量
fName = getFilenameFile maxFileName 
-- 组装输出路径，maxFilePath为全局变量
fOut = maxFilePath+ fName + opts[#fExt]
-- 相当于勾选导出选项embed media
FbxExporterSetParam "EmbedTextures" True
-- 相当于导出units设置为mm
FbxExporterSetParam "ConvertUnit" "mm"

-- 组装导出fName.json路径，存入boundingbox等数据
foutJson = maxfilepath + fName + ".json" 
-- 选中所有几何体
select geometry
-- 创建json文件
out_file=createfile foutJson   
-- 写入内容到json文件中
format "{ \n" to:out_file  
-- 计算出包围盒
bb = $.max-$.min
-- 写入包围盒数据到json文件中
format "   \"boundingbox\":%\n"  bb  to:out_file  
format "}" to:out_file  
-- 关闭文件
close out_file  

-- 导出fbx文件
exportFile fOut  #noPrompt
