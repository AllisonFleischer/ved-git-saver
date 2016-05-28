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
				if key == "g" then
					isgit = true
				else
					isgit = false
				end]],
		},
		{
			find = [[savedsuccess, savederror = savelevel(editingmap .. ".vvvvvv", metadata, roomdata, entitydata, levelmetadata, scripts, vedmetadata)]],
			replace = [[isgit = true
			savedsuccess, savederror = savelevel(editingmap .. ".vvvvvv", metadata, roomdata, entitydata, levelmetadata, scripts, vedmetadata, isgit)]],
		},
	},
}