local t = Def.ActorFrame {};

t[#t+1] = LoadActor("bg") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
};

return t;
