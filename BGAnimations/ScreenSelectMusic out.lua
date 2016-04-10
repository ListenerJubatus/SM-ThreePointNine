return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh"))..{
		StartTransitioningCommand=cmd(play);
	};

	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0")),
		OnCommand=cmd(diffusealpha,0;sleep,1;linear,0.333;diffusealpha,1);
	};
};