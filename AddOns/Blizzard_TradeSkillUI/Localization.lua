-- This file is executed at the end of addon load

-- Define missing global strings for older clients (e.g., 1.12 vanilla)
HAVE_MATERIALS = HAVE_MATERIALS or "Have materials"
IMPROVES_SKILL = IMPROVES_SKILL or "Improves skill"
NO_RESULTS = NO_RESULTS or "No results"

-- Update UI elements if they already exist
local function UpdateTradeSkillStrings()
	if ( TradeSkillMatsCheckButton ) then
		local txt = getglobal(TradeSkillMatsCheckButton:GetName() .. "Text");
		if ( txt ) then txt:SetText(HAVE_MATERIALS); end
	end
	if ( TradeSkillSkillCheckButton ) then
		local txt2 = getglobal(TradeSkillSkillCheckButton:GetName() .. "Text");
		if ( txt2 ) then txt2:SetText(IMPROVES_SKILL); end
	end
	-- XML uses a FontString named TradeSkillFrameNoResultsText for the NO_RESULTS key
	if ( TradeSkillFrameNoResultsText ) then
		TradeSkillFrameNoResultsText:SetText(NO_RESULTS);
	end
end

-- Run immediately and also on show to be safe
UpdateTradeSkillStrings()

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, name)
	if ( name == "Blizzard_TradeSkillUI" ) then
		UpdateTradeSkillStrings()
	end
end)
