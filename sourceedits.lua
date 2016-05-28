sourceedits =
{
	["vvvvvvxml"] =
	{
		{
			find = [[function savelevel(path, thismetadata, theserooms, allentities, theselevelmetadata, allscripts, vedmetadata)]],
			replace = [[function savelevel(path, thismetadata, theserooms, allentities, theselevelmetadata, allscripts, vedmetadata, isgit)
				if isgit == true then
					tileDelimiter = "\n"
					scriptDelimiter = ":\n"
					lineDelimiter = "\n"
				else
					tileDelimiter = ","
					scriptDelimiter = ":|"
					lineDelimiter = "|"
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
		{
			find = [[allallscripts = allallscripts .. xmlspecialchars(k) .. ":|" .. xmlspecialchars(implode("|", v)) .. "|"]],
			replace = [[allallscripts = allallscripts .. xmlspecialchars(k) .. scriptDelimiter .. xmlspecialchars(implode(lineDelimiter, v)) .. lineDelimiter]],
		},
	},
	
	["main2"] =
	{
		{
			find = [[elseif nodialog and editingroomtext == 0 and editingroomname == false and (state == 1) and (key == "s") then]],
			replace = [[elseif nodialog and editingroomtext == 0 and editingroomname == false and (state == 1) and ((key == "s") or (key == "g")) then
				if key == "s" then
					isgit = false
					levelExtension = ".vvvvvv"
				else
					isgit = true
					levelExtension = ".gggggg"
				end]],
		},
		{
			find = [[savedsuccess, savederror = savelevel(editingmap .. ".vvvvvv", metadata, roomdata, entitydata, levelmetadata, scripts, vedmetadata)]],
			replace = [[
			savedsuccess, savederror = savelevel(editingmap .. levelExtension, metadata, roomdata, entitydata, levelmetadata, scripts, vedmetadata, isgit)]],
		},
		{
			find = [[temporaryroomname = "Saved level as " .. editingmap .. ".vvvvvv"]],
			replace = [[
			if isgit == false then
				temporaryroomname = "Saved level as " .. editingmap .. levelExtension
			else
				temporaryroomname = "Git save as " .. editingmap .. levelExtension
			end]]
		},
	},
}
