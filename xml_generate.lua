-- =================================从table_define.lua中取出需要的表和表名

local originTable = dofile("table_define.lua")

for fileName_,myTable_ in next, originTable do
	local fileName = fileName_
	local myTable ={}
	for k,v in next, myTable_ do
		myTable[k] = v
	end

	-- ================================写xml文件

	local file = io.open(fileName..".xml", "w")

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

	-- ================================主函数

	function main(  )
		writeTitle()
		local LOOP_TEXT = 2
		for i=1, LOOP_TEXT do
			writeText()	--按格式需要调用两次
		end
		writeEnd()
		file:close()
	end

	main()
end
