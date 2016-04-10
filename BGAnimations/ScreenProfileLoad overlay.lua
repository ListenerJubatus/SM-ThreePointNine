local x = Def.ActorFrame{
	LoadActor( THEME:GetPathG("", "_moveon" ) )..{ InitCommand=cmd(Center); };
};

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToLoad() then self:sleep(0.01); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;