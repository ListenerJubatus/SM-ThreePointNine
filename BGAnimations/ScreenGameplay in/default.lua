local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffuse,color("#000000");zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;);
		OnCommand=cmd(diffusealpha,1;smooth,0.7;diffusealpha,0);
	};
};

t[#t+1] = LoadActor( THEME:GetPathB("","_Stars in") )..{
};

return t