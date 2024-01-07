 --自定义文本组人，牛牛
 inv_Enabled=true
 auto_inv_txt="111"
function ttt(cmd)
	local pos, cmds = 0, {}
	for st, sp in function() return string.find(cmd, " ", pos, true) end do
		table.insert(cmds, string.sub(cmd, pos, st-1))
		pos = sp + 1
	end
	table.insert(cmds, string.sub(cmd, pos))
	
	if(string.lower(cmds[1]) == "on") then
		inv_Enabled = true
		inv_showstat()			
	elseif(string.lower(cmds[1]) == "off") then
		inv_Enabled = false
		inv_showstat()
	elseif(string.lower(cmds[1]) == "txt") then
		if (cmds[2] ~= "") then
			auto_inv_txt=cmds[2]
			print("修改成功为:"..auto_inv_txt)
		end
	elseif(string.lower(cmds[1]) == "info") then
		print("\n\n")
		print("自动组人 设置命令\n/ainv on --|CFFFF0000启用|R\n/ainv off --|Cff00ff00禁用|R\n/ainv txt XXXX --|Cffffff00XXXX为自定义内容,中间有空格|R")
		print("当前自动组人文本:"..auto_inv_txt)	
	elseif(string.lower(cmds[1]) == "") then
		print("\n\n")
		print("插件使用菜单输入查询 /ainv info")
		inv_showstat()
	else
		print("\n\n")
		print("插件使用菜单输入查询 /ainv info")
		inv_showstat()
	end
end	

function inv_showstat()
	if(inv_Enabled) then
		print("已启用 ")
		print("当前组人文本:"..auto_inv_txt)
	else
		print("已禁用")
	end
end

function inv_Gruop()--arg2名字 arg1内容 InviteByName(arg2)
	 if(arg1 == auto_inv_txt)then
		if(inv_Enabled) then
				print("成功邀请"..arg2)
				InviteByName(arg2)
			--ConvertToRaid()  转团队有点问题			
		end
	 end
end
aa=CreateFrame("Frame")
aa:RegisterEvent("CHAT_MSG_WHISPER")
aa:SetScript("OnEvent",inv_Gruop)

SLASH_qq1="/ainv"
SlashCmdList["qq"] = function(cmd)
	ttt(cmd)
end

