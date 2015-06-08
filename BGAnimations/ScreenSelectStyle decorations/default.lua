local t = LoadFallbackB();

t[#t+1] = Def.ActorFrame {
	LoadActor( "explanation" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y-70);
		OnCommand=cmd(addx,400;bounceend,0.5;addx,-400);
		OffCommand=cmd(bouncebegin,0.5;addx,400);
	};
	LoadActor( "warning" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(addy,-120;zoomy,0;decelerate,0.5;zoomy,1;addy,120;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("0.4,0.4,0.4,1"));
		OffCommand=cmd(accelerate,0.3;zoomy,0;y,SCREEN_CENTER_Y+40);
	};
	LoadFont("Common", "normal")..{
		Text=THEME:GetString(Var "LoadingScreen", "HelpText");
		InitCommand=cmd(draworder,101;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-24;shadowlength,0);
		OnCommand=cmd(zoom,0.5;zoomy,0;linear,0.5;zoomy,0.5;diffuseblink);
		OffCommand=cmd(linear,0.5;zoomy,0);
	};
};

return t;