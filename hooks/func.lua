function alphabetizeScripts()
	--In which I copy code from a forum because I have hazy knowledge of Lua. (written by dmccuskey)
	local sort_func = function(a,b) return a < b end
	table.sort(scriptnames, sort_func)
end
