local t = Def.ActorFrame {};

t[#t+1] = LoadActor("bg") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
};

t[#t+1] = LoadActor("logo") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(zoomy,0;sleep,0.6;bounceend,0.5;zoomy,1;glowshift;effectperiod,2.5;effectcolor1,1,1,1,0.1;effectcolor2,1,1,1,0.3);
};

t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("0,0,0,0");linear,0.5;diffusealpha,0);
	};
};

return t;
