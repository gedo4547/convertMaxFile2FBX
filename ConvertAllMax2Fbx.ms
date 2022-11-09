-- 获取命令行参数
opts = maxOps.mxsCmdLineArgs

-- test var(s)
-- opts[#fRoot]="C:\Users\Christopher Towner\Desktop\Models"
-- opts[#fPattern]="*.max"
-- opts[#fExt]=".fbx"
fPattern = "*.max"

-- 递归获取文件路径
fn getFilesRecursive root pattern =
(
	dir_array = GetDirectories (root+"\*")
	for d in dir_array do
		join dir_array (GetDirectories (d+"\*"))
	my_files = #()
	for f in dir_array do
		join my_files (getFiles (f + pattern))
	my_files
)

-- 传入根目录和筛选类型
files = getFilesRecursive opts[#fRoot] fPattern

-- 对每个.max文件执行操作
for f in files do (
    -- 重置场景 #noPrompt不弹提示
    resetMaxFile #noPrompt
    -- 加载.max文件
    loadmaxfile f
    -- 提取.max文件名
    fName = getFilenameFile maxFileName
    -- 组装导出文件路径
    fout = maxfilepath + fName + opts[#fExt]
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
    exportFile fout  #noPrompt
)
