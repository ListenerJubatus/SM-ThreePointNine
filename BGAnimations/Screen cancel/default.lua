return Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT;draworder,4444;);
		OnCommand=cmd(diffuse,color("0,0,0,1");cropleft,1;fadeleft,0.5;linear,0.5;cropleft,-0.5);
	};
	LoadActor(THEME:GetPathS("Common","back")) .. {
		StartTransitioningCommand=cmd(play);
	};
};