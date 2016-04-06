local t = Def.ActorFrame {};

	t[#t+1] = LoadActor("_headtile") .. {
		InitCommand=cmd(vertalign,top;x,SCREEN_CENTER_X;y,SCREEN_TOP;zoom,0.75;zoomto,SCREEN_WIDTH,69);
		OnCommand=cmd(addy,-230;smooth,1.5;addy,230);
	};
	
	t[#t+1] = Def.Quad {
		InitCommand=cmd(diffuse,color("#000000");vertalign,top;x,SCREEN_CENTER_X;y,SCREEN_TOP;);
		OnCommand=cmd(zoomto,700,45);
	};

	t[#t+1] = LoadActor("_header") .. {
		InitCommand=cmd(zoom,0.75;vertalign,top;x,SCREEN_CENTER_X;y,SCREEN_TOP;draworder,100;);
		OnCommand=cmd(addy,-230;smooth,1.5;addy,230);
	};

	t[#t+1] = LoadActor("_tile") .. {
		InitCommand=cmd(vertalign,bottom;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;draworder,100;zoomto,SCREEN_WIDTH,66;);
		OnCommand=cmd(addy,230;smooth,1.5;addy,-230);
	};

	t[#t+1] = Def.ActorFrame {
	-- P1 StageDisplay
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-310;y,SCREEN_CENTER_Y+163;draworder,100;);
	OnCommand=cmd(addx,-SCREEN_WIDTH*0.6;smooth,1.5;addx,SCREEN_WIDTH*0.6;);
	LoadActor("_diffpoda") .. { 
			  OnCommand=cmd(playcommand,"Set";);
			  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";); 
			  PlayerJoinedMessageCommand=cmd(playcommand,"Set";diffusealpha,0;smooth,0.3;diffusealpha,1;);
			  SetCommand=function(self)
				stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
				local song = GAMESTATE:GetCurrentSong();
				if song then 
					if stepsP1 ~= nil then
					local st = stepsP1:GetStepsType();
					local diff = stepsP1:GetDifficulty();
					local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
					local cd = GetCustomDifficulty(st, diff, courseType);
					self:diffuse(CustomDifficultyToColor(cd));
					else
						self:settext("")
					end
				else
					self:settext("")
				end
			  end	
		};
	LoadFont("_impact 24px") .. { 
			  OnCommand=cmd(uppercase,true;skewx,-0.1;zoom,0.7;playcommand,"Set";);
			  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";); 
			  PlayerJoinedMessageCommand=cmd(playcommand,"Set";diffusealpha,0;smooth,0.3;diffusealpha,1;);
			  ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set"); 
			  SetCommand=function(self)
				stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
				local song = GAMESTATE:GetCurrentSong();
				if song then 
					if stepsP1 ~= nil then
					local st = stepsP1:GetStepsType();
					local diff = stepsP1:GetDifficulty();
					local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
					local cd = GetCustomDifficulty(st, diff, courseType);
					self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
					self:diffuse(ColorLightTone(CustomDifficultyToColor(cd)));
					else
						self:settext("")
					end
				else
					self:settext("")
				end
			  end	
		};
	};
	
	t[#t+1] = Def.ActorFrame {
	-- P2 StageDisplay
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);x,SCREEN_CENTER_X+310;y,SCREEN_CENTER_Y+163;draworder,100;);
	OnCommand=cmd(addx,SCREEN_WIDTH*0.6;smooth,1.5;addx,-SCREEN_WIDTH*0.6;);
	LoadActor("_diffpoda") .. { 
			  OnCommand=cmd(playcommand,"Set";);
			  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";); 
			  PlayerJoinedMessageCommand=cmd(playcommand,"Set";diffusealpha,0;smooth,0.3;diffusealpha,1;);
			  SetCommand=function(self)
				stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_2)
				local song = GAMESTATE:GetCurrentSong();
				if song then 
					if stepsP1 ~= nil then
					local st = stepsP1:GetStepsType();
					local diff = stepsP1:GetDifficulty();
					local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
					local cd = GetCustomDifficulty(st, diff, courseType);
					self:diffuse(CustomDifficultyToColor(cd));
					else
						self:settext("")
					end
				else
					self:settext("")
				end
			  end	
		};
	LoadFont("_impact 24px") .. { 
			  OnCommand=cmd(uppercase,true;skewx,-0.1;zoom,0.7;playcommand,"Set";);
			  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";); 
			  PlayerJoinedMessageCommand=cmd(playcommand,"Set";diffusealpha,0;smooth,0.3;diffusealpha,1;);
			  ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set"); 
			  SetCommand=function(self)
				stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_2)
				local song = GAMESTATE:GetCurrentSong();
				if song then 
					if stepsP1 ~= nil then
					local st = stepsP1:GetStepsType();
					local diff = stepsP1:GetDifficulty();
					local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
					local cd = GetCustomDifficulty(st, diff, courseType);
					self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
					self:diffuse(ColorLightTone(CustomDifficultyToColor(cd)));
					else
						self:settext("")
					end
				else
					self:settext("")
				end
			  end	
		};
	};
	
	t[#t+1] = LoadActor("frame") .. {
		InitCommand=cmd(vertalign,bottom;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM;draworder,100;);
		OnCommand=cmd(addy,230;smooth,1.5;addy,-230);
	};
	t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");

return t