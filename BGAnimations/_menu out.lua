return Def.ActorFrame {
	LoadActor( THEME:GetPathS("", "_swoosh") ) .. {
		StartTransitioningCommand=cmd(play);
	};
	LoadActor( THEME:GetPathG("", "_moveon" ) )..{
		OnCommand=cmd(Center;zoomy,0;diffuse,0,0,0,0;linear,0.5;diffuse,1,1,1,1;zoomy,1);
	};
};