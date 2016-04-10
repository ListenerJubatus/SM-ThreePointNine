local t = Def.ActorFrame {};
-- Could your 3.9 do THIS?

local headercolour = {
["Select Style"] = "#d11120",
["Select Difficulty"] = "#ef5315",
["Select Music"] = "#298479",
["Select Course"] = "#298479",
["Result"] = "#1da5fb",
["Summary Result"] = "#1da5fb",
}

local subheadercolour = {
["Select Style"] = "#d11120",
["Select Difficulty"] = "#ef5315",
["Select Music"] = "#288c46",
["Select Course"] = "#288c46",
["Result"] = "#1da5fb",
["Summary Result"] = "#1da5fb",
}

local headeroffset = {
["Select Style"] = 0,
["Select Difficulty"] = -28,
["Select Music"] = -56,
["Select Course"] = -56,
["Result"] = -84,
["Summary Result"] = -84,
}


local headcolour = headercolour[Screen.String("HeaderText")]
local subheadcolour = subheadercolour[Screen.String("HeaderText")]
if headcolour == nil then headcolour = "#FFFFFF" end
if subheadcolour == nil then subheadcolour = "#FFFFFF" end

local headericon = Screen.String("HeaderText").." icon"
if FILEMAN:DoesFileExist("Themes/"..THEME:GetCurThemeName().."/Graphics/ScreenWithMenuElements header/"..headericon.." (doubleres).png") then
	headicon = headericon
	print("iconerror: file does exist: "..headericon.." (doubleres).png")
else
	headicon = "Select Style icon"
	print("iconerror: file does not exist")
end

t[#t+1] = Def.ActorFrame {

Def.ActorFrame {
	OnCommand=cmd(addx,SCREEN_WIDTH*0.6;bounceend,0.5;addx,-SCREEN_WIDTH*0.6);
	OffCommand=cmd(bounceend,0.5;addx,SCREEN_WIDTH);
	Def.Quad {
		InitCommand=cmd(horizalign,left;vertalign,top;y,0;x,0;zoomto,SCREEN_WIDTH+1,48);
		OnCommand=cmd(diffuse,color("#0073A5"););
	};
	LoadActor("_left") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-335;y,SCREEN_TOP+25;zoomy,0.8);
	};	
	LoadActor("_left") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-392.5;y,SCREEN_TOP+25;zoomy,0.8);
	};
	-- is actually right lol
	LoadActor("_left") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+280;y,SCREEN_TOP+25;zoomy,0.8);
	};
	LoadActor("_left") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+280-57.5;y,SCREEN_TOP+25;zoomy,0.8);
	};
	LoadActor("_right") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+25;y,SCREEN_TOP+25;zoomy,0.8);
	};
};
	
--main header part
Def.ActorFrame {
	InitCommand=cmd(x,headeroffset[Screen.String("HeaderText")]);
	Def.ActorFrame {
		OnCommand=cmd(addx,SCREEN_WIDTH*0.6;bounceend,0.5;addx,-SCREEN_WIDTH*0.6);
		OffCommand=cmd(bounceend,0.5;addx,SCREEN_WIDTH);
		LoadActor("_middle") .. {
			InitCommand=cmd(y,SCREEN_TOP+25;x,SCREEN_CENTER_X;zoomy,0.8);
		};
		LoadActor(headicon) .. {
			InitCommand=cmd(x,SCREEN_CENTER_X-265;y,SCREEN_TOP+25;zoomy,0.8);
		};
	};
	-- Text
	LoadFont("_open sans extrabold 48px") .. {
		Name="HeaderText";
		Text=Screen.String("HeaderText");
		InitCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_TOP+20;horizalign,left;diffuse,color(headcolour);strokecolor,color("#000000");maxwidth,900;zoomx,0.5;);
		OnCommand=cmd(zoomy,0;sleep,0.4;smooth,0.2;zoomy,0.4);
		OffCommand=cmd(decelerate,0.2;diffusealpha,0;zoomy,0;);
		UpdateScreenHeaderMessageCommand=function(self,param)
			self:settext(param.Header);
		end;
	};

	-- Subtitle
	LoadFont("_open sans extrabold 48px") .. {
		Name="HeaderSubText";
		Text=Screen.String("HeaderSubText");
		InitCommand=cmd(x,SCREEN_CENTER_X-230;y,SCREEN_TOP+36;horizalign,left;diffuse,color(subheadcolour);maxwidth,900;zoom,0.25;);
		OnCommand=cmd(zoomy,0;sleep,0.4;smooth,0.2;zoomy,0.2);
		OffCommand=cmd(decelerate,0.2;diffusealpha,0;zoomy,0;);
		UpdateScreenHeaderMessageCommand=function(self,param)
			self:settext(param.Header);
		end;
	};
};
};

return t