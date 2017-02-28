local t = Def.ActorFrame {};

	t[#t+1] = LoadActor("_headtile") .. {
		InitCommand=function(self)
			self:zoom(0.75):CenterX():zoomto(SCREEN_WIDTH,69);
			if GAMESTATE:IsAnExtraStage() then
				self:valign(0):zoomy(-1):y(SCREEN_BOTTOM);
			else
				self:valign(0):y(SCREEN_TOP);
			end;
		end;
		OnCommand=function(self)
			if GAMESTATE:IsAnExtraStage() then
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
			if GAMESTATE:IsAnExtraStage() then
				self:valign(1):y(SCREEN_BOTTOM);
			else
				self:valign(0):y(SCREEN_TOP);
			end;
		end;
		OnCommand=function(self)
			if GAMESTATE:IsAnExtraStage() then
				self:addy(230):smooth(1.5):addy(-230);
			else
				self:addy(-230):smooth(1.5):addy(230);
			end;
		end;
	};
	
return t