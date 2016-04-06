local t = Def.ActorFrame {};
-- Could your 3.9 do THIS?

t[#t+1] = Def.ActorFrame {

Def.ActorFrame {
	OnCommand=cmd(addx,SCREEN_WIDTH*0.6;bounceend,0.5;addx,-SCREEN_WIDTH*0.6);
	OffCommand=cmd(bounceend,0.5;addx,SCREEN_WIDTH);
	Def.Quad {
		InitCommand=cmd(horizalign,left;vertalign,top;y,0;x,0;zoomto,SCREEN_WIDTH+1,58);
		OnCommand=cmd(diffuse,color("#0073A5"););
	};

	LoadActor("_middle") .. {
		InitCommand=cmd(y,SCREEN_TOP+30;x,SCREEN_CENTER_X-20;zoomx,1);
	};

	LoadActor("_left") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-360;y,SCREEN_TOP+30;);
	};

	LoadActor("_right") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+30;);
	};

-- Text
LoadFont("Common normal") .. {
	Name="HeaderText";
	Text=Screen.String("HeaderText");
	InitCommand=cmd(x,SCREEN_CENTER_X-246;y,SCREEN_TOP+24;horizalign,left;diffuse,color("#29847D");strokecolor,color("#576829");maxwidth,300;zoomx,1.1;);
	OnCommand=cmd(zoomy,0;sleep,0.4;smooth,0.2;zoomy,0.94);
	OffCommand=cmd(decelerate,0.2;diffusealpha,0;zoomy,0;);
	UpdateScreenHeaderMessageCommand=function(self,param)
		self:settext(param.Header);
	end;
	};

-- Subtitle
LoadFont("Common normal") .. {
	Name="HeaderSubText";
	Text=Screen.String("HeaderSubText");
	InitCommand=cmd(x,SCREEN_CENTER_X-246;y,SCREEN_TOP+42;horizalign,left;diffuse,color("#025586");maxwidth,500;zoom,0.55;);
	OnCommand=cmd(zoomy,0;sleep,0.4;smooth,0.2;zoomy,0.55);
	OffCommand=cmd(decelerate,0.2;diffusealpha,0;zoomy,0;);
	UpdateScreenHeaderMessageCommand=function(self,param)
		self:settext(param.Header);
	end;
	};
};	
};

return t