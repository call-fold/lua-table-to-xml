-- =================================从table_define.lua中取出需要的表和表名

local table_ = dofile("table_define.lua")

for k1,v1 in pairs(table_) do

	local fileName = k1

	local myTable ={}

	for k2,v2 in pairs(v1) do
		myTable[k2] = v2
	end

	-- ================================写xml文件

	local file = io.open(fileName..".xml", "w")

	local function write_title(  )	--写文件头部
		file:write("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>")
		file:write("\n")
		file:write("<root xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">")
		file:write("\n")
	end

	local function write_text(  )	--写文件内容
		file:write("\t")
		file:write("<row>")
		file:write("\n")
		for k, v in pairs(myTable) do
			file:write("\t")
			file:write("\t")
			file:write("<"..v..">".."</"..v..">")
			file:write("\n")
		end
		file:write("\t")
		file:write("</row>")
		file:write("\n")
	end

	local function write_end(  )	--写文件尾部
		file:write("</root>")
		file:write("\n")
	end

	-- ================================主函数

	function main(  )
		write_title()
		for i=1,2 do
			write_text()	--按格式需要调用两次
		end
		write_end()
		file:close()
	end

	main()

end
