-------------------------------------------------------------------------------------------------------
-- xml映射表生成小工具
-- @author 苏铃峰
-- @copyright ONEKES
-- @release common.lua, v5.3.1 2015/08/05
-------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------
-- 按格式写XML文件

local fileName 		--新建xml文件名
local myTable = {} 	--新建读内容的表
local file 		--读表时，需要打开的文件

local function writeXML(  )
	local function writeTitle(  )	--写文件头部
		file:write("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>")
		file:write("\n")
		file:write("<root xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">")
		file:write("\n")
	end

	local function writeText(  )	--写文件内容
		file:write("\t")
		file:write("<row>")
		file:write("\n")
		for k, v in next, myTable do
			file:write("\t")
			file:write("\t")
			file:write("<"..v..">".."</"..v..">")
			file:write("\n")
		end
		file:write("\t")
		file:write("</row>")
		file:write("\n")
	end

	local function writeEnd(  )	--写文件尾部
		file:write("</root>")
		file:write("\n")
	end

	writeTitle()
	local LOOP_TEXT = 2
	for i=1, LOOP_TEXT do
		writeText()	--按格式需要调用两次
	end
	writeEnd()
end

-------------------------------------------------------------------------------------------------------
-- 读取table_define.lua中表头和表的内容，同时在新建xml文件中加入写的内容

local function getTable(  )
	local originTable = dofile("table_define.lua")
	for fileName_,myTable_ in next, originTable do
		fileName = fileName_
		for k,v in next, myTable_ do
			myTable[k] = v
		end

		file = io.open(fileName..".xml", "w")
		writeXML()
		file:close()

	end
end

-------------------------------------------------------------------------------------------------------
-- 主函数

local function main(  )
	getTable()
end

main()