-- ScreenHowToPlay background
local ar = GetScreenAspectRatio();

local t = Def.ActorFrame{
	-- bgtile
	LoadActor("bgtile")..{
		InitCommand=cmd(Center;zoomtowidth,SCREEN_WIDTH;zoomtoheight,SCREEN_HEIGHT);
		OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w*0.5,h*0.5);
			self:texcoordvelocity(0.6,-0.6);
		end;
	};
}
return t;