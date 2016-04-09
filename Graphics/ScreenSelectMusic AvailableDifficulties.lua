local t = Def.ActorFrame { };
for idx, diff in pairs(Difficulty) do -- 0, Difficulty_Beginner
	if idx < 6 then
		t[#t+1] = LoadActor( "DifficultyDisplay bar" ) .. {
			InitCommand=cmd(SetTextureFiltering,false;pause;setstate,Difficulty:Reverse()[diff]);
			ShowCommand=cmd(stoptweening;linear,0.18;diffuse,color("1,1,1,1"););
			HideCommand=cmd(stoptweening;linear,0.18;diffusealpha,0;);
			BeginCommand=cmd(y,35*idx);

			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local st = GAMESTATE:GetCurrentStyle():GetStepsType()
				local bHasStepsTypeAndDifficulty =
					song and song:HasStepsTypeAndDifficulty( st, diff );

				self:playcommand( bHasStepsTypeAndDifficulty and "Show" or "Hide" );
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
	end;
end

return t;
