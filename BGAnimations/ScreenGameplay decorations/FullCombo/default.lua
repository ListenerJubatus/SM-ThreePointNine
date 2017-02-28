local pn = ...;
assert(pn);
local t = Def.ActorFrame{};
local Center1Player = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

t[#t+1] = LoadActor("Combo_Splash") .. {
	OffCommand=function(self)
		if pss:FullCombo() or pss:FullComboOfScore('TapNoteScore_W3') then
			self:play();
		end;
	end;
};

return t