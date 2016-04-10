local t = Def.ActorFrame {};

-- P1 Judgement Labels
-- P1 numbers
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(addx,-60;);
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);playcommand,"Set";);
		OnCommand=cmd(addx,-SCREEN_WIDTH/2;sleep,0.1;decelerate,0.3;addx,SCREEN_WIDTH/2);
		OffCommand=cmd(sleep,0.8;accelerate,0.3;addx,-SCREEN_WIDTH/2);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W1"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30;playcommand,"Set";);
		OnCommand=cmd(addx,-SCREEN_WIDTH/2;sleep,0.2;decelerate,0.3;addx,SCREEN_WIDTH/2);
		OffCommand=cmd(sleep,0.7;accelerate,0.3;addx,-SCREEN_WIDTH/2);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W2"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*2;playcommand,"Set";);
		OnCommand=cmd(addx,-SCREEN_WIDTH/2;sleep,0.3;decelerate,0.3;addx,SCREEN_WIDTH/2);
		OffCommand=cmd(sleep,0.6;accelerate,0.3;addx,-SCREEN_WIDTH/2);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W3"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*3;playcommand,"Set";);
		OnCommand=cmd(addx,-SCREEN_WIDTH/2;sleep,0.4;decelerate,0.3;addx,SCREEN_WIDTH/2);
		OffCommand=cmd(sleep,0.5;accelerate,0.3;addx,-SCREEN_WIDTH/2);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W4"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*4;playcommand,"Set";);
		OnCommand=cmd(addx,-SCREEN_WIDTH/2;sleep,0.5;decelerate,0.3;addx,SCREEN_WIDTH/2);
		OffCommand=cmd(sleep,0.4;accelerate,0.3;addx,-SCREEN_WIDTH/2);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W5"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*5;playcommand,"Set";);
		OnCommand=cmd(addx,-SCREEN_WIDTH/2;sleep,0.6;decelerate,0.3;addx,SCREEN_WIDTH/2);
		OffCommand=cmd(sleep,0.3;accelerate,0.3;addx,-SCREEN_WIDTH/2);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_Miss"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*6;playcommand,"Set";);
		OnCommand=cmd(addx,-SCREEN_WIDTH/2;sleep,0.7;decelerate,0.3;addx,SCREEN_WIDTH/2);
		OffCommand=cmd(sleep,0.2;accelerate,0.3;addx,-SCREEN_WIDTH/2);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetHoldNoteScores("HoldNoteScore_Held"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,color("#FFFF00");addy,27*6+6;addx,-80;playcommand,"Set";);
		OnCommand=cmd(zoomy,0;decelerate,0.3;zoomy,1);
		OffCommand=cmd(zoomy,1;accelerate,0.3;zoomy,0);
		SetCommand=function(self)
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo())
        end;
	};	
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*7+3;addx,-10;playcommand,"Set";);
		OnCommand=cmd(addx,-SCREEN_WIDTH/2;sleep,0.9;decelerate,0.3;addx,SCREEN_WIDTH/2);
		OffCommand=cmd(sleep,0.1;accelerate,0.3;addx,-SCREEN_WIDTH/2);
		SetCommand=function(self)
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore())
        end;
	};
};

	
return t