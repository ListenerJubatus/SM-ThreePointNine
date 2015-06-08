local t = Def.ActorFrame {};

-- P1 Judgement Labels
-- P1 numbers
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(addx,-60;);
	OnCommand=cmd(zoomx,0;bounceend,0.2;zoomx,1);
	OffCommand=cmd(bounceend,0.2;zoomx,0);
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);playcommand,"Set";);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W1"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30;playcommand,"Set";);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W2"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*2;playcommand,"Set";);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W3"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*3;playcommand,"Set";);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W4"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*4;playcommand,"Set";);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W5"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*5;playcommand,"Set";);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_Miss"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*6;playcommand,"Set";);
		SetCommand=function(self) 
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetHoldNoteScores("HoldNoteScore_Held"))
        end;
	};
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,color("#FFFF00");addy,27*6+6;addx,-80;playcommand,"Set";);
		SetCommand=function(self)
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo())
        end;
	};	
	LoadFont("_numbers2") .. {
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);horizalign,right;diffuse,PlayerColor(PLAYER_1);addy,30*7+3;addx,-10;playcommand,"Set";);
		SetCommand=function(self)
            self:settext(STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore())
        end;
	};
};

	
return t