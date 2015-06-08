local t = Def.ActorFrame {};

	t[#t+1] = Def.ActorFrame { 
		LoadActor("RightToLeft") .. {
			InitCommand=cmd(x,SCREEN_LEFT-64;y,64;);
			OnCommand=cmd(linear,2;x,SCREEN_WIDTH+384;);
		};
		LoadActor("RightToLeft") .. {
			InitCommand=cmd(x,-128;y,128;);
			OnCommand=cmd(linear,2;x,SCREEN_WIDTH+320;);
		};
		LoadActor("RightToLeft") .. {
			InitCommand=cmd(x,-256;y,256;);
			OnCommand=cmd(linear,2;x,SCREEN_WIDTH+256;);
		};
		LoadActor("RightToLeft") .. {
			InitCommand=cmd(x,-320;y,320;);
			OnCommand=cmd(linear,2;x,SCREEN_WIDTH+128;);
		};
		LoadActor("RightToLeft") .. {
			InitCommand=cmd(x,-384;y,384;);
			OnCommand=cmd(linear,2;x,SCREEN_WIDTH+64;);
		};
	};
	
	-- t[#t+1] = Def.ActorFrame { 
		-- LoadActor("RightToLeft") .. {
			-- InitCommand=cmd(x,-64+1088;y,64;);
			-- OnCommand=cmd(linear,2;x,-1088;);
		-- };
		-- LoadActor("RightToLeft") .. {
			-- InitCommand=cmd(x,-128+1088;y,128;);
			-- OnCommand=cmd(linear,2;x,-1088;);
		-- };
		-- LoadActor("RightToLeft") .. {
			-- InitCommand=cmd(x,-256+1088;y,256;);
			-- OnCommand=cmd(linear,2;x,-1088;);
		-- };
		-- LoadActor("RightToLeft") .. {
			-- InitCommand=cmd(x,-SCREEN_CENTER_X+1088;y,SCREEN_CENTER_X;);
			-- OnCommand=cmd(linear,2;x,-1088;);
		-- };
		-- LoadActor("RightToLeft") .. {
			-- InitCommand=cmd(x,-384+1088;y,384;);
			-- OnCommand=cmd(linear,2;x,-1088;);
		-- };
	-- };

return t