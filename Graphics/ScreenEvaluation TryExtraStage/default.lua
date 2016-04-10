return Def.Sprite{
	BeginCommand=function(self)
		local extraType = "extra1"
		-- relies on the fact that the next stage is set before eval is loaded
		if GAMESTATE:GetCurrentStage() == 'Stage_Extra2' then extraType = "extra2" end
		self:Load(THEME:GetPathG("ScreenEvaluation","TryExtraStage/"..extraType))
	end;
};