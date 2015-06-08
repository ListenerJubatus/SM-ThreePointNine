local gc = Var("GameCommand");
local st = gc:GetName();

local t = Def.ActorFrame {
	LoadActor( "preview " .. st ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y+40);
		OnCommand=cmd(finishtweening;diffusealpha,0;glow,color("1,1,1,0");linear,0.2;glow,color("1,1,1,1");linear,0.0;diffusealpha,1;linear,0.2;glow,color("1,1,1,0"));
		OffCommand=cmd(finishtweening;linear,0.5;diffusealpha,0;glow,1,1,1,0);
		GainFocusCommand=cmd(visible,true;queuecommand,"On");
		LoseFocusCommand=cmd(queuecommand,"Off";visible,false);
	};
	LoadActor( "card frame " .. st )..{
		InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+40);
		OnCommand=cmd(finishtweening;zoomy,0;bounceend,0.5;zoomy,1);
		OffCommand=cmd(finishtweening;bouncebegin,0.5;zoomy,0);
		GainFocusCommand=cmd(visible,true;queuecommand,"On");
		LoseFocusCommand=cmd(queuecommand,"Off";visible,false);
	};
	Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X-260+gc:GetIndex()*80;y,84);
		LoadActor( "icon " .. st ) .. {
			OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.20;decelerate,0.3;addx,SCREEN_WIDTH);
			OffCommand=cmd(bouncebegin,0.5;zoomy,0);
			EnabledCommand=cmd(diffuse,color("1,1,1,1"));
			DisabledCommand=cmd(diffuse,color(".5,.5,.5,1"));
			GainFocusCommand=cmd(glowshift;effectperiod,0.5);
			LoseFocusCommand=cmd(stopeffect);
		};
	};
};

return t;