local t = LoadFallbackB();

t[#t+1] =  Def.ActorFrame {
	--[[ LoadActor( "more" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X-320+580;y,SCREEN_CENTER_Y-240+90);
		OnCommand=cmd(addx,SCREEN_WIDTH/2;linear,0.2;addx,-SCREEN_WIDTH/2);
		OffCommand=cmd(linear,0.3;zoom,0;addx,SCREEN_WIDTH/2);
	};]]
	LoadFont("Common", "normal")..{
		Text=THEME:GetString(Var "LoadingScreen", "HelpText");
		InitCommand=cmd(draworder,101;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-24;shadowlength,0);
		OnCommand=cmd(queuecommand,"In");
		InCommand=cmd(zoom,0.5;zoomy,0;linear,0.5;zoomy,0.5;diffuseblink);
		OffCommand=cmd(linear,0.5;zoomy,0);
	};
};

return t;