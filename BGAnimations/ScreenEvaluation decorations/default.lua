local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay");

t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2();
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra1" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		OnCommand=cmd(play);
	};
	-- LoadActor( THEME:GetPathG("ScreenStageInformation","Stage extra1" ) ) .. {
		-- Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		-- InitCommand=cmd(Center);
		-- OnCommand=cmd(diffusealpha,0;zoom,0.85;bounceend,1;zoom,1;diffusealpha,1;sleep,0;glow,Color("White");decelerate,1;glow,Color("Invisible");smooth,0.35;zoom,0.25;y,SCREEN_BOTTOM-72);
	-- };
};
t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and not GAMESTATE:IsExtraStage() and GAMESTATE:IsExtraStage2();
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra2" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		OnCommand=cmd(play);
	};
	-- LoadActor( THEME:GetPathG("ScreenStageInformation","Stage extra2" ) ) .. {
		-- Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		-- InitCommand=cmd(Center);
		-- OnCommand=cmd(diffusealpha,0;zoom,0.85;bounceend,1;zoom,1;diffusealpha,1;sleep,0;glow,Color("White");decelerate,1;glow,Color("Invisible");smooth,0.35;zoom,0.25;y,SCREEN_BOTTOM-72);
	-- };
};

if ShowStandardDecoration("TryExtraStage") then
	if GAMESTATE:HasEarnedExtraStage() then
		t[#t+1] = StandardDecorationFromFile("TryExtraStage","TryExtraStage")
	end
end

--Let's try this again. - Inorizushi

t[#t+1] = LoadActor("_p1labels") .. {
        InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-60;);
};
t[#t+1] = LoadActor("_p2labels") .. {
        InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-60;);
};
		
t[#t+1] = LoadActor("_p1grade") .. {
        InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y-120;); 
		OnCommand=cmd(addx,-SCREEN_WIDTH;sleep,0.0;decelerate,0.3;addx,SCREEN_WIDTH);
		OffCommand=cmd(sleep,0.8;accelerate,0.3;addx,-SCREEN_WIDTH);
		}; 
		
t[#t+1] = LoadActor("_p2grade") .. {
        InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y-120;); 
		OnCommand=cmd(addx,SCREEN_WIDTH;sleep,0.0;decelerate,0.3;addx,-SCREEN_WIDTH);
		OffCommand=cmd(sleep,0.8;accelerate,0.3;addx,SCREEN_WIDTH);
		};
		
t[#t+1] = LoadActor("_judgements") .. {
        InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-60;);
		OffCommand=cmd(sleep,0.8;bounceend,0.3;zoomx,0);
		}; 
		
t[#t+1] = Def.ActorFrame {
		LoadActor("_p1bonus") .. {
			InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y-64;vertalign,top;);
			OffCommand=cmd(sleep,0.8;bounceend,0.3;zoomx,0);
		}; 	
		LoadActor("_p2bonus") .. {
			InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y-64;vertalign,top;);
			OffCommand=cmd(sleep,0.8;bounceend,0.3;zoomx,0);
		}; 
	};
	
return t
