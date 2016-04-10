return Def.BPMDisplay {
	File=THEME:GetPathF("BPMDisplay", "bpm");
	Name="BPMDisplay";
	SetCommand=function(self) self:SetFromGameState() end;
	OffCommand=cmd(bouncebegin,0.5;addx,-SCREEN_WIDTH*0.6);
	OnCommand=cmd(zoom,0.8;draworder,1000;horizalign,left;addx,-SCREEN_WIDTH*0.6;bounceend,0.5;addx,SCREEN_WIDTH*0.6;);
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
};