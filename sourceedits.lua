sourceedits =
{
	["vvvvvvxml"] =
	{
		{
			find = [[function savelevel(path, thismetadata, theserooms, allentities, theselevelmetadata, allscripts, vedmetadata)]],
			replace = [[function savelevel(path, thismetadata, theserooms, allentities, theselevelmetadata, allscripts, vedmetadata, isgit)
				if isgit == true then
					tileDelimiter = "\n"
				else
					tileDelimiter = ","
				end]],
		},
		{
			find = [[table.insert(thenewcontents, table.concat({unpack(theserooms[lroomy][lroomx], (line*40)+1, (line*40)+40)}, ","))]],
			replace = [[table.insert(thenewcontents, table.concat({unpack(theserooms[lroomy][lroomx], (line*40)+1, (line*40)+40)}, tileDelimiter))]],
		},
		
		{
			find = [[table.concat(thenewcontents, ",") .. ",")]],
			replace = [[table.concat(thenewcontents, tileDelimiter) .. tileDelimiter)]],
		},
	},
	
	["main2"] =
	{
		{
			find = [[elseif nodialog and editingroomtext == 0 and editingroomname == false and (state == 1) and (key == "s") then]],
			replace = [[elseif nodialog and editingroomtext == 0 and editingroomname == false and (state == 1) and ((key == "s") or (key == "g")) then
				if key == "s" then
					isgit = false
				else
					isgit = true
				end]],
		},
		{
			find = [[savedsuccess, savederror = savelevel(editingmap .. ".vvvvvv", metadata, roomdata, entitydata, levelmetadata, scripts, vedmetadata)]],
			replace = [[
			savedsuccess, savederror = savelevel(editingmap .. ".vvvvvv", metadata, roomdata, entitydata, levelmetadata, scripts, vedmetadata, isgit)]],
		},
		{
			find = [[temporaryroomname = "Saved level as " .. editingmap .. ".vvvvvv"]],
			replace = [[
			if isgit == false then
				temporaryroomname = "Saved level as " .. editingmap .. ".vvvvvv"
			else
				temporaryroomname = "Git save as " .. editingmap .. ".vvvvvv"
			end]]
		},
	},
}
