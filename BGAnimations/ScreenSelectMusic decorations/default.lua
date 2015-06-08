local t = LoadFallbackB();

local difficulty_icon_map= {
	Difficulty_Beginner= "_diconbeginner.png",
	Difficulty_Easy= "_diconlight.png",
	Difficulty_Medium= "_diconstandard.png",
	Difficulty_Hard= "_diconheavy.png",
	Difficulty_Challenge= "_dicononi.png",
	Difficulty_Edit= "_diconedit.png",
}

local difficulty_positions= {
	[PLAYER_1]= {_screen.cx-268, _screen.cy+10},
	[PLAYER_2]= {_screen.cx-53, _screen.cy+10}
}

local function difficulty_icon(pn)
	local args= {
		InitCommand= function(self)
			self:xy(difficulty_positions[pn][1], difficulty_positions[pn][2]):visible(false)
		end,
		OnCommand=function(self)
			self:addx(-SCREEN_WIDTH*0.6):bounceend(0.5):addx(SCREEN_WIDTH*0.6)
		end,
	}
	args["CurrentSteps" .. ToEnumShortString(pn) .. "ChangedMessageCommand"]=
		function(self)
			local steps= GAMESTATE:GetCurrentSteps(pn)
			if steps then
				local path= THEME:GetPathG("", difficulty_icon_map[steps:GetDifficulty()])
				self:Load(path):visible(true)
			else
				self:visible(false)
			end
		end
	return Def.Sprite(args)
end

-- Banner Frame
		
t[#t+1] = LoadActor("_bannerframe") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y-88;draworder,140);
	OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
	OnCommand=cmd(addx,-SCREEN_WIDTH*0.6;bounceend,0.5;addx,SCREEN_WIDTH*0.6;);
	}
	
t[#t+1] = LoadActor("BPMDisplay label") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X-125+20;y,SCREEN_CENTER_Y-130;draworder,140);
	OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
	OnCommand=cmd(zoom,1.2;draworder,1000;horizalign,left;addx,-SCREEN_WIDTH*0.6;bounceend,0.5;addx,SCREEN_WIDTH*0.6;);
	}	
	
-- Difficulty frames

t[#t+1] = LoadActor("_dfp1") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X-250;y,SCREEN_CENTER_Y+11);
	OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
	OnCommand=cmd(addx,-SCREEN_WIDTH*0.6;bounceend,0.5;addx,SCREEN_WIDTH*0.6;);
	}
	
t[#t+1] = LoadActor("_dfp2") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X-250+180;y,SCREEN_CENTER_Y+11);
	OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
	OnCommand=cmd(addx,-SCREEN_WIDTH*0.6;bounceend,0.5;addx,SCREEN_WIDTH*0.6;);
	}	

t[#t+1] = Def.ActorFrame{ 
	difficulty_icon(PLAYER_1), difficulty_icon(PLAYER_2),
	OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
	OnCommand=cmd(addx,-SCREEN_WIDTH*0.6;bounceend,0.5;addx,SCREEN_WIDTH*0.6;);
	}
	
t[#t+1] = LoadActor("_diffframep1") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y+195);
	OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
	OnCommand=cmd(addx,-SCREEN_WIDTH*0.6;bounceend,0.5;addx,SCREEN_WIDTH*0.6;);
	}
	
t[#t+1] = LoadActor("_diffframep2") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X-240+160;y,SCREEN_CENTER_Y+195);
	OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
	OnCommand=cmd(addx,-SCREEN_WIDTH*0.6;bounceend,0.5;addx,SCREEN_WIDTH*0.6;);
	}		

-- Difficulty numbers
t[#t+1] = LoadFont("_neuropol 36px") .. { 
          InitCommand=cmd(x,SCREEN_CENTER_X-250+32;y,SCREEN_CENTER_Y+11-10;horizalign,right;diffuse,PlayerColor(PLAYER_1);zoom,0.6); 
		  OnCommand=cmd(diffusealpha,0;sleep,0.3;smooth,0.2;diffusealpha,1;);
		  OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
          CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";playcommand,"Transition";); 
		  TransitionCommand=cmd(finishtweening;diffusealpha,0;smooth,0.2;diffusealpha,1);
		  PlayerJoinedMessageCommand=cmd(playcommand,"Set";diffusealpha,0;smooth,0.3;diffusealpha,1;);
          ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set"); 
          SetCommand=function(self)
			stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
			local song = GAMESTATE:GetCurrentSong();
			if song then 
				if stepsP1 ~= nil then
					self:settext(stepsP1:GetMeter())
				else
					self:settext("")
				end
			else
				self:settext("")
			end
          end
};

t[#t+1] = LoadFont("_neuropol 36px") .. { 
          InitCommand=cmd(x,SCREEN_CENTER_X-250+180-32;y,SCREEN_CENTER_Y+11-10;horizalign,left;diffuse,PlayerColor(PLAYER_2);zoom,0.6);
		  OnCommand=cmd(diffusealpha,0;sleep,0.3;smooth,0.2;diffusealpha,1;);
		  OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
          CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set";playcommand,"Transition";); 
		  TransitionCommand=cmd(finishtweening;diffusealpha,0;smooth,0.2;diffusealpha,1);
		  PlayerJoinedMessageCommand=cmd(playcommand,"Set";diffusealpha,0;smooth,0.3;diffusealpha,1;);
          ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set"); 
          SetCommand=function(self)
			stepsP2 = GAMESTATE:GetCurrentSteps(PLAYER_2)
			local song = GAMESTATE:GetCurrentSong();
			if song then 
				if stepsP2 ~= nil then
					self:settext(stepsP2:GetMeter())
				else
					self:settext("")
				end
			else
				self:settext("")
			end
          end
};	
	
t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay");
t[#t+1] = StandardDecorationFromFileOptional("GrooveRadar","GrooveRadar");

	
return t;