function alphabetizeScripts()
	local sort_func = function(a,b) return a > b end
	table.sort(scriptnames, sort_func)
end
