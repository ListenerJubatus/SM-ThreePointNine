return Def.ActorFrame {

	LoadActor(THEME:GetPathS("", "_swoosh") )..{
		StartTransitioningCommand=cmd(play);
	};

	Def.Quad {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("0,0,0,0");diffusealpha,1;linear,0.3;diffusealpha,0);
	};
	
};