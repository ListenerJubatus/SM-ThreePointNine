local t = Def.ActorFrame {
	LoadActor(THEME:GetPathS("ScreenInit","music")) .. {
		OnCommand=cmd(play);
	};
};

t[#t+1] = Def.ActorFrame {
	Def.Quad{
			OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;Center;diffuse,color("1,1,1,1"));
	};
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+60);
	Def.ActorFrame {
	  OnCommand=cmd(playcommandonchildren,"ChildrenOn");
		LoadFont("Common Normal") .. {
			Text=ProductID();
			InitCommand=cmd(y,-20;zoom,0.75);
			OnCommand=cmd(diffuse,color("0,0,0,1"));
		};
		LoadFont("Common Normal") .. {
			Text=THEME:GetThemeDisplayName();
			OnCommand=cmd(diffuse,color("0,0,0,1"));
		};
		LoadFont("Common Normal") .. {
			Text="Created by " .. THEME:GetThemeAuthor();
			InitCommand=cmd(y,24;zoom,0.75);
			OnCommand=cmd(diffuse,color("0,0,0,1"));
		};
	};
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-20;y,SCREEN_CENTER_Y-40;fov,70);
	LoadActor("_textshadow")..{
		InitCommand=cmd(x,20;y,6);
		OnCommand=cmd(linear,8;addx,-40);
	};
	LoadActor("_arrowshadow")..{
		InitCommand=cmd(x,20+225;y,6);
		OnCommand=cmd(linear,8;addx,-40);
	};
	LoadActor("_arrow (dither)")..{
		InitCommand=cmd(x,225);
	};
	LoadActor("_text (dither)");
};

return t


	



