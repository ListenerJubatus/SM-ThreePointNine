local x = Def.ActorFrame{
	LoadActor( THEME:GetPathG("", "_moveon" ) )..{
		InitCommand=cmd(Center);
		OnCommand=cmd(zoomy,0;sleep,1;linear,0.2;zoomy,1.0;sleep,0.5;);
		OffCommand=cmd(linear,0.3;zoomy,0;);
	};
};

return x;