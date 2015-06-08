local gc = Var("GameCommand");
local ind = gc:GetIndex();
local delay = ind / 10;

local path = "_screenselectdifficulty icons/";
return Def.ActorFrame {
	InitCommand=cmd(zoom,0);
	OnCommand=cmd(queuecommand,"In");
	InCommand=cmd(runcommandsonleaves,cmd(diffusealpha,0;sleep,delay;linear,0.3;diffusealpha,1);sleep,delay;zoom,1;addx,-SCREEN_CENTER_X;bounceend,0.35;addx,SCREEN_CENTER_X);
	OffCommand=cmd(stoptweening;sleep,delay;bouncebegin,0.25;addx,-SCREEN_CENTER_X;runcommandsonleaves,cmd(stoptweening;linear,0.25;diffusealpha,0));
	LoadActor( path .. "info oni" )..{
		InitCommand=cmd(y,-108;vertalign,bottom);
	};
	LoadActor( path .. "picture oni" );
}