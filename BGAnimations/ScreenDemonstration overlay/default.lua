local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH,120;diffuse,color("0,0,0,0.7"));
	};
	LoadActor("demonstration")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffuseblink;effectperiod,1);
	};
};

return t;