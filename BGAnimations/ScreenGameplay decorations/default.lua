local lifeFrame = "_header"

if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then lifeFrame = "_eheader" end

local t = Def.ActorFrame {};

	t[#t+1] = LoadActor("_headtile") .. {
		InitCommand=function(self)
			self:zoom(0.75):CenterX():zoomto(SCREEN_WIDTH,69);
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:valign(0):zoomy(-1):y(SCREEN_BOTTOM);
			else
				self:valign(0):y(SCREEN_TOP);
			end;
		end;
		OnCommand=function(self)
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:addy(230):smooth(1.5):addy(-230);
			else
				self:addy(-230):smooth(1.5):addy(230);
			end;
		end;
	};
	
	t[#t+1] = Def.Quad {
		-- Lifebar underlay
		InitCommand=function(self)
			self:diffuse(color("#000000")):CenterX():zoomto(700,45);
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:valign(1):y(SCREEN_BOTTOM);
			else
				self:valign(0):y(SCREEN_TOP);
			end;
		end;
		OnCommand=function(self)
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:addy(230):smooth(1.5):addy(-230);
			else
				self:addy(-230):smooth(1.5):addy(230);
			end;
		end;
	};

	t[#t+1] = LoadActor(lifeFrame) .. {
		InitCommand=function(self)
			self:zoom(0.75):CenterX():draworder(100);
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:valign(1):y(SCREEN_BOTTOM);
			else
				self:valign(0):y(SCREEN_TOP);
			end;
		end;
		OnCommand=function(self)
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:addy(230):smooth(1.5):addy(-230);
			else
				self:addy(-230):smooth(1.5):addy(230);
			end;
		end;
	};

	t[#t+1] = LoadActor("_tile") .. {
		InitCommand=function(self)
			self:CenterX():draworder(100):zoomto(SCREEN_WIDTH,66);
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:valign(1):zoomy(-1):y(SCREEN_TOP);
			else
				self:valign(1):y(SCREEN_BOTTOM);
			end;
		end;
		OnCommand=function(self)
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:addy(-230):smooth(1.5):addy(230);
			else
				self:addy(230):smooth(1.5):addy(-230);
			end;
		end;
	};

	t[#t+1] = Def.ActorFrame {
	-- P1 StageDisplay
	InitCommand=function(self)
		self:visible(GAMESTATE:IsHumanPlayer(PLAYER_1)):x(SCREEN_CENTER_X-310):draworder(100);
		if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
			self:y(SCREEN_CENTER_Y-163);
		else
			self:y(SCREEN_CENTER_Y+163);
		end;
	end;
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
		InitCommand=function(self)
			self:CenterX():draworder(100);
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:valign(1):zoomy(-1):y(SCREEN_TOP);
			else
				self:valign(1):y(SCREEN_BOTTOM);
			end;
		end;
		OnCommand=function(self)
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				self:addy(-230):smooth(1.5):addy(230);
			else
				self:addy(230):smooth(1.5):addy(-230);
			end;
		end;
	};
	t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");

return t