sourceedits =
{
	["vvvvvvxml"] =
	{
		{
			find = [[function savelevel(path, thismetadata, theserooms, allentities, theselevelmetadata, allscripts, vedmetadata)]],
			replace = [[function savelevel(path, thismetadata, theserooms, allentities, theselevelmetadata, allscripts, vedmetadata, isgit)]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
		},
		{
			find = [[table.insert(thenewcontents, table.concat({unpack(theserooms[lroomy][lroomx], (line*40)+1, (line*40)+40)}, ","))]],
			replace = [[
			if isgit == false then
				table.insert(thenewcontents, table.concat({unpack(theserooms[lroomy][lroomx], (line*40)+1, (line*40)+40)}, ","))
			else
				table.insert(thenewcontents, table.concat({unpack(theserooms[lroomy][lroomx], (line*40)+1, (line*40)+40)}, "\n"))
			end
			]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
		},
	},
}