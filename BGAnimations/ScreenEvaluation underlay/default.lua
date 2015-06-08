local t = Def.ActorFrame {};

t[#t+1] = LoadActor("_p1labels") .. {
        InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-60;);
};
t[#t+1] = LoadActor("_p2labels") .. {
        InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-60;);
};

t[#t+1] = Def.Sprite {
		name="SongJacket";
        InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-120;visible, not GAMESTATE:IsCourseMode();playcommand,"Set";); 
		OnCommand=cmd(zoomy,0;bounceend,0.5;zoomy,1);
		OffCommand=cmd(bouncebegin,0.3;zoomy,0);
        SetCommand=function(self) 
            local song = GAMESTATE:GetCurrentSong(); 
			if song then
                if song:HasBanner() then
                    self:Load(song:GetBannerPath())
                    self:scaletoclipped(256,80)
                else
                    self:Load(THEME:GetPathG("Common fallback", "banner"))
					self:scaletoclipped(256,80)
                end
			else
				self:diffusealpha(0)
            end
        end;
		};
		
t[#t+1] = Def.Sprite {
		name="CourseBanner";
        InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-120;visible,GAMESTATE:IsCourseMode();playcommand,"Set";); 
		OnCommand=cmd(zoomy,0;bounceend,0.5;zoomy,1);
		OffCommand=cmd(bouncebegin,0.3;zoomy,0);
        SetCommand=function(self) 
            local course = GAMESTATE:GetCurrentCourse(); 
			if course then
                if course:HasBanner() then
                    self:Load(course:GetBannerPath())
                    self:scaletoclipped(256,80)
                else
                    self:Load(THEME:GetPathG("Common fallback", "banner"))
					self:scaletoclipped(256,80)
                end
			else
				self:diffusealpha(0)
            end
        end;
		};
		

t[#t+1] = LoadActor("_frame") .. {
        InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-120;); 
		OnCommand=cmd(zoomy,0;bounceend,0.3;zoomy,1);
		OffCommand=cmd(bounceend,0.3;zoomy,0);
		};
		
t[#t+1] = LoadActor("_p1grade") .. {
        InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y-120;); 
		OnCommand=cmd(zoomy,0;bounceend,0.3;zoomy,1);
		OffCommand=cmd(bounceend,0.3;zoomy,0);
		}; 
		
t[#t+1] = LoadActor("_p2grade") .. {
        InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y-120;); 
		OnCommand=cmd(zoomy,0;bounceend,0.3;zoomy,1);
		OffCommand=cmd(bounceend,0.3;zoomy,0);
		};
		
t[#t+1] = LoadActor("_judgements") .. {
        InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-60;);
		OffCommand=cmd(bounceend,0.3;zoomx,0);
		}; 
		
t[#t+1] = Def.ActorFrame {
		LoadActor("_p1bonus") .. {
			InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y-64;vertalign,top;);
			OffCommand=cmd(bounceend,0.3;zoomx,0);
		}; 	
		LoadActor("_p2bonus") .. {
			InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y-64;vertalign,top;);
			OffCommand=cmd(bounceend,0.3;zoomx,0);
		}; 
	};
	
return t