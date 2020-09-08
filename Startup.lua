local YOQ_ADDON_NAME = 'YourOwnQuests';
local CREATE_COMMAND = 'create';
local SHOW_COMMAND = 'show';

-- This i dont rightly now yet TODO learn whatever this is for (although i imagine it mimics how an object would work)
YourOwnQuests = {};

function YourOwnQuests:CreateQuest(questName, questDescription, questRequirement)
	print('Creating quest ' .. questName .. '...');
	local nextQuestIndex = 0;
	if (YOQCharacterDatabase['QUESTCOUNT'] ~= nil and YOQCharacterDatabase['QUESTCOUNT'] > 0) then
		nextQuestIndex = YOQCharacterDatabase['QUESTCOUNT'] + 1; 
	end
	print('Saving in database');
	YOQCharacterDatabase['QUESTS'][nextQuestIndex] = { Name = questName, Description = questDescription, Requirement = questRequirement};
	print('Saved quest in position ' .. nextQuestIndex);
	YOQCharacterDatabase['QUESTCOUNT'] = YOQCharacterDatabase['QUESTCOUNT'] + 1;
end

function YourOwnQuests:ShowAllQuest()
	for i=1, YOQCharacterDatabase['QUESTCOUNT'] do
		print('Quest ' .. i .. ' - ' .. YOQCharacterDatabase['QUESTS'][i].Name);
		print(YOQCharacterDatabase['QUESTS'][i].Description);
		print(YOQCharacterDatabase['QUESTS'][i].Requirement);
	end
end

function OnCall(fullCommand)
	print('Command invoked: ' .. fullCommand)
	--Whatever the fuck is %S+ TODO, i mean it should be a whitespace but smhrn
	local commandAndArgs = string.split(fullCommand, ' ');
	print(commandAndArgs[1]);
	if (commandAndArgs[1] == CREATE_COMMAND) then
		YourOwnQuests:CreateQuest(commandAndArgs[2],commandAndArgs[3],commandAndArgs[4])
	end
	if (commandAndArgs[1] == SHOW_COMMAND) then
		YourOwnQuests:ShowAllQuest()
	end
end

function LoadDatabase(self, _, addon)
	if addon == YOQ_ADDON_NAME then
	  print('Loading character database');
	  if type(YOQCharacterDatabase) ~= "table" then
	      print('Character database not found, set as table');
		  YOQCharacterDatabase = {};
		  print(YOQCharacterDatabase['HELP']);
	  end
	  self:UnregisterEvent("ADDON_LOADED");
	  print('Character databse loaded');
	end
end

function YourOwnQuests:Initialize()
	print('You logged in!')
	--Register yoq command in the cmd slash list
	SlashCmdList['YOUROWNQUESTS'] = OnCall
	_G['SLASH_YOUROWNQUESTS1'] = '/yoq'
	local databaseLoader = CreateFrame("FRAME")
	databaseLoader:RegisterEvent("ADDON_LOADED")
	databaseLoader:SetScript("OnEvent", LoadDatabase)
end



YourOwnQuests:Initialize()




