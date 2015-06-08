local t = Def.ActorFrame {};

local playMode = GAMESTATE:GetPlayMode()

local sStage = ""
sStage = GAMESTATE:GetCurrentStage()

if playMode ~= 'PlayMode_Regular' and playMode ~= 'PlayMode_Rave' and playMode ~= 'PlayMode_Battle' then
  sStage = playMode;
end;

if not (GAMESTATE:IsCourseMode() or GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2()) then
        local tRemap = {
                Stage_Event             = 0,
                Stage_1st               = 1,
                Stage_2nd               = 2,
                Stage_3rd               = 3,
                Stage_4th               = 4,
                Stage_5th               = 5,
                Stage_6th               = 6,
        };

        local nSongCount = tRemap[sStage] + (GAMESTATE:GetCurrentSong():GetStageCost()-1);

        if nSongCount >= PREFSMAN:GetPreference("SongsPerPlay") then
        sStage = "Stage_Final";
        else
                sStage = sStage;
        end;
end;

local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffuse,color("#000000");zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;);
		OnCommand=cmd(diffusealpha,0;decelerate,0.3;diffusealpha,1);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor( THEME:GetPathG("ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+120;);
		OnCommand=cmd(diffusealpha,0;sleep,0.3;diffusealpha,1;sleep,0.2;smooth,0.6;y,SCREEN_CENTER_Y;sleep,2;smooth,0.4;diffusealpha,0;);
	};
};

t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;vertalign,bottom;diffuse,color("#000000");zoomto,SCREEN_WIDTH,SCREEN_HEIGHT/2-40;);
		OnCommand=cmd(diffusealpha,0;sleep,0.3;diffusealpha,1;);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor("_underline") ..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+40;);
		OnCommand=cmd(zoomx,0;sleep,0.5;smooth,0.1;zoomx,0.5;diffusealpha,0.5;linear,0.1;zoomx,1;diffusealpha,1;sleep,0.1;accelerate,0.2;zoomx,0;diffusealpha,0);
	};
};



return t