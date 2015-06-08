local t = Def.ActorFrame {};

	t[#t+1] = LoadActor("_headtile") .. {
		InitCommand=cmd(vertalign,top;x,SCREEN_CENTER_X;y,SCREEN_TOP;);
		OnCommand=cmd(zoom,0.75;zoomto,SCREEN_WIDTH,69);
	};
	
	t[#t+1] = Def.Quad {
		InitCommand=cmd(diffuse,color("#000000");vertalign,top;x,SCREEN_CENTER_X;y,SCREEN_TOP;);
		OnCommand=cmd(zoomto,700,45);
	};

	t[#t+1] = LoadActor("_header") .. {
		InitCommand=cmd(zoom,0.75;vertalign,top;x,SCREEN_CENTER_X;y,SCREEN_TOP;draworder,100;);
	};

	t[#t+1] = LoadActor("_tile") .. {
		InitCommand=cmd(vertalign,bottom;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;draworder,100;zoomto,SCREEN_WIDTH,66;);
	};
	
	t[#t+1] = LoadActor("frame") .. {
		InitCommand=cmd(vertalign,bottom;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;draworder,100;);
	};
	t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");

return t