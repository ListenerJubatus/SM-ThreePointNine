local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("_right") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+30;);
	};
};

return t