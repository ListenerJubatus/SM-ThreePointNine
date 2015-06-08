local x = Def.ActorFrame{
	LoadActor( THEME:GetPathG("", "_moveon" ) )..{
		InitCommand=cmd(Center);
		OnCommand=cmd(zoomy,0;linear,0.2;zoomy,1.0;sleep,0.5;);
		OffCommand=cmd(linear,0.3;zoomy,0;);
	};
};

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToLoad() then self:sleep(1); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;