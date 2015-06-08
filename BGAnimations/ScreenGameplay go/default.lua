local t = Def.ActorFrame {};
-- Layer1
t[#t+1] = LoadActor("_go") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;);
	OnCommand=cmd(linear,0.5;diffusealpha,.5;sleep,0.5;linear,0.5;diffusealpha,0);
	}
-- Layer 2
t[#t+1] = LoadActor("_go") .. {
	InitCommand=cmd(x,220;y,140;diffusealpha,0;);
	OnCommand=cmd(linear,0.5;diffusealpha,.5;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0.5;linear,0.5;diffusealpha,0;x,220;y,140);
	}
	
-- Layer 3
t[#t+1] = LoadActor("_go") .. {
	InitCommand=cmd(x,620;y,340;diffusealpha,0;);
	OnCommand=cmd(linear,0.5;diffusealpha,.5;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0.5;linear,0.5;diffusealpha,0;x,620;y,340);
	}	

return t;