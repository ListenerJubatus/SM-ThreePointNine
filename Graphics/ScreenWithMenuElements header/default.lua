local t = Def.ActorFrame {};
-- Could your 3.9 do THIS?
t[#t+1] = Def.ActorFrame {
	LoadActor("_middle") .. {
		InitCommand=cmd(y,SCREEN_TOP+30;x,SCREEN_RIGHT-140;);
		OnCommand=function(self)self:horizalign(right):zoomx(0):bouncebegin(0.3):zoomx(1.02):bounceend(0.3):zoomx(1)
		end,
		OffCommand=function(self)self:horizalign(right):zoomx(1):sleep(0.2):smooth(0.5):zoomx(0)
		end,
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor("_left") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-360;y,SCREEN_TOP+30;);
		OnCommand=cmd(addx,550;smooth,0.3;addx,-550);
		OffCommand=cmd(sleep,0.3;smooth,0.3;addx,550;)
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor("_right") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+30;);
	};
};

-- Text
t[#t+1] = Def.ActorFrame {
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
};	

-- Subtitle
t[#t+1] = Def.ActorFrame {
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

return t