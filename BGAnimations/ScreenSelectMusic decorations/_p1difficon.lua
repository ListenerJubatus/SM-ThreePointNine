local t = Def.ActorFrame {};


t[#t+1] = Def.Sprite {
		name="p1difficultyicon";
		InitCommand=cmd(playcommand,"Set"); 
        CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set"); 
        CurrentCourseChangedMessageCommand=cmd(playcommand,"Set"); 
        SetCommand=function(self) 
            local stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1);
			if stepsp1 then
					if stepsP1:GetDifficulty() == 'Difficulty_Beginner' then
						self:Load(THEME:GetPathG("","_diconheavy.png"))
					elseif stepsP1:GetDifficulty() == 'Difficulty_Easy' then
						self:Load(THEME:GetPathG("","_diconlight.png"))
					elseif stepsP1:GetDifficulty() == 'Difficulty_Medium' then
						self:Load(THEME:GetPathG("","_diconstandard.png"))
					elseif stepsP1:GetDifficulty() == 'Difficulty_Hard' then
						self:Load(THEME:GetPathG("","_diconheavy.png"))
					elseif stepsP1:GetDifficulty() == 'Difficulty_Challenge' then
						self:Load(THEME:GetPathG("","_dicononi.png"))
					else
						self:Load(THEME:GetPathG("","_diconedit.png"))
					end
				end
			end
		};

return t
