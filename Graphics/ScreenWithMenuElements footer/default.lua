local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("_footer tile") .. {
		InitCommand=cmd(zoomto,SCREEN_WIDTH,32;);
	};
	LoadActor("_shared footer") .. {
	};
};

return t