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
					alphabetizeScripts()
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
		{
			find = [[if not success then
		return false, contents
	end]],
			replace = [[if not success then
		return false, contents
	end
				if string.find(path, ".gggggg") then
					gitload = true
					tileLoadDelimiter = "\n"
					scriptLoadDelimiter = "\n"
				else
					gitload = false
					tileLoadDelimiter = ","
					scriptLoadDelimiter = "|"
				end]],
		},
		{
			find = [[,") do]],
			replace = [[" .. tileLoadDelimiter) do]], --Just wanted to mention that figuring out this one line was a nightmare
		},
		{
			find = [[x.allscripts = explode("|"]],
			replace = [[x.allscripts = explode(scriptLoadDelimiter]],
		},
		-- Flagnames set
		{
			find = [[mdedata = mdedata .. "$" .. despecialchars(vedmetadata.flaglabel[k])]],
			replace = [[mdedata = mdedata .. "$\n" .. despecialchars(vedmetadata.flaglabel[k])]],
		},
		-- Flagnames get
		{
			find = [[local explodedflags = explode("%$", explodedmetadata[2])]],
			replace = [[local explodedflags = explode("%$\n", explodedmetadata[2])]],
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
		{
			find = [[dialog.new(L.ENTERNAMESAVE .. "\n\n\n" .. L.ENTERLONGOPTNAME, "", 1, 4, 10)]],
			replace = [[
				if isgit == true then
					temporaryroomname = "Git saving!"
					temporaryroomnametimer = 999999
				end
				dialog.new(L.ENTERNAMESAVE .. "\n\n\n" .. L.ENTERLONGOPTNAME, "", 1, 4, 10)]],
		},
		{
			find = [[state6load(v:sub(1, -8))]],
			replace = [[state6load(v:sub(1, -1))]], --Extension is no longer removed
		},
	},
	["func"] =
	{
		{
			find = [[success, metadata, roomdata, entitydata, levelmetadata, scripts, count, scriptnames, vedmetadata = loadlevel(editingmap .. ".vvvvvv")]],
			replace = [[success, metadata, roomdata, entitydata, levelmetadata, scripts, count, scriptnames, vedmetadata = loadlevel(editingmap)
			editingmap = levelname:sub(1,-8)]],
		},
	},
	["dialog"] =
	{
		{
			find = [[savedsuccess, savederror = savelevel(multiinput[1] .. ".vvvvvv", metadata, roomdata, entitydata, levelmetadata, scripts, vedmetadata)]],
			replace = [[savedsuccess, savederror = savelevel(multiinput[1] .. levelExtension, metadata, roomdata, entitydata, levelmetadata, scripts, vedmetadata, isgit)]],
		},
		{
			find = [[elseif (DIAquestionid == 10) then]],
			replace = [[elseif (DIAquestionid == 10) then
			temporaryroomnametimer = 0]],
		},
	},
}
