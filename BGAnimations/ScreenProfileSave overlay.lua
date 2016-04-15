local x = Def.ActorFrame{
	LoadActor( THEME:GetPathG("", "_moveon" ) )..{
		InitCommand=cmd(Center);
		OnCommand=cmd(zoomy,0;linear,0.3;zoomy,1.0;sleep,0.5;);
	};
};

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(0.01); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;
