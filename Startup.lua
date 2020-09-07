function SayHello(...)
	local arg1 = ...
	print('Hahahahahahaah i knew it!')
	print('You said ' .. arg1 .. 'and also')
end

function YOQ_OnLogin()
	print('You logged in!')
	SlashCmdList['YOUROWNQUESTS'] = SayHello
	_G['SLASH_YOUROWNQUESTS1'] = '/yoq'
end

print('something something framse something something events')
local loginFrame = CreateFrame("FRAME")
loginFrame:RegisterEvent("PLAYER_LOGIN")
loginFrame:SetScript("OnEvent",	YOQ_OnLogin)


