if nodialog and editingroomtext == 0 and editingroomname == false and (state == 1) and (key == "a") and (love.keyboard.isDown("l" .. ctrl) or love.keyboard.isDown("r" .. ctrl)) then
	alphabetizeScripts()
	temporaryroomname = "All scripts alphabetized!"
	temporaryroomnametimer = 90
end
