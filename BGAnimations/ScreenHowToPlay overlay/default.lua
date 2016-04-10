-- ScreenHowToPlay Overlay

local t = Def.ActorFrame{
	LoadActor("LifeMeterBar not over")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_TOP+40);
		OnCommand=cmd(addy,-60;sleep,2.4;linear,0.2;addy,60;draworder,99);
	};
	LoadActor("howtoplay")..{
		Name="HowToPlayBig";
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0;zoom,4;sleep,0.0;linear,0.3;diffusealpha,1;zoom,1;sleep,1.8;linear,0.3;zoom,0.5;x,170;y,60);
	};
	LoadActor("feet")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,2.4;decelerate,0.3;addx,SCREEN_WIDTH;sleep,2;linear,0.3;zoomy,0);
	};
--Pre-Step message
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=cmd(rotationy,180;rotationz,270;x,SCREEN_CENTER_X-30;y,SCREEN_CENTER_Y-130);
			OnCommand=cmd(bob;effectperiod,1;effectmagnitude,20,0,0;diffusealpha,0;sleep,6;linear,0;diffusealpha,1;sleep,2;linear,0;diffusealpha,0);
		};
		LoadActor("tapmessage")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+40);
			OnCommand=cmd(diffusealpha,0;sleep,6;linear,0;diffusealpha,1;sleep,2;linear,0;diffusealpha,0);
		};
	};
-- 1st Step -- DOWN
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+128;y,SCREEN_CENTER_Y-60);
			OnCommand=cmd(bob;effectperiod,1;effectmagnitude,0,20,0;diffusealpha,0;sleep,9.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
		LoadActor("tapmessage")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+40);
			OnCommand=cmd(diffusealpha,0;sleep,9.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
	};
--2nd Step -- UP
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+192;y,SCREEN_CENTER_Y-60);
			OnCommand=cmd(bob;effectperiod,1;effectmagnitude,0,20,0;diffusealpha,0;sleep,12.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
		LoadActor("tapmessage")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+40);
			OnCommand=cmd(diffusealpha,0;sleep,12.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
	};
--3rd Step -- LEFT
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+64;y,SCREEN_CENTER_Y-60);
			OnCommand=cmd(bob;effectperiod,1;effectmagnitude,0,20,0;diffusealpha,0;sleep,15.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
		LoadActor("tapmessage")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+40);
			OnCommand=cmd(diffusealpha,0;sleep,15.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
	};
--4th Step -- JUMP
	Def.ActorFrame {
		LoadActor("jumphands")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y-60);
			OnCommand=cmd(bob;effectperiod,1;effectmagnitude,0,20,0;diffusealpha,0;sleep,18.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
		LoadActor("jumpmessage")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+40);
			OnCommand=cmd(diffusealpha,0;sleep,18.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
	};
--Misstep
	Def.ActorFrame {
		LoadActor("taphand")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+228;y,SCREEN_CENTER_Y-130);
			OnCommand=cmd(bob;effectperiod,1;effectmagnitude,0,20,0;diffusealpha,0;sleep,22.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
		LoadActor("missmessage")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+40);
			OnCommand=cmd(diffusealpha,0;sleep,22.7;linear,0;diffusealpha,1;sleep,1.7;linear,0;diffusealpha,0);
		};
	};
};

return t;