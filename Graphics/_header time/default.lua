local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("_right") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+30;);
		OnCommand=cmd(addx,SCREEN_WIDTH*0.6;bounceend,0.5;addx,-SCREEN_WIDTH*0.6);
		OffCommand=cmd(bounceend,0.5;addx,SCREEN_WIDTH);
	};
};

return t
