local s = THEME:GetString( 'ScreenTitleMenu', Var("GameCommand"):GetText() );
local t = Def.ActorFrame {
	LoadFont("_shared1") ..{
		InitCommand=cmd(uppercase,true;settext,s;horizalign,center;shadowlength,5);
		GainFocusCommand=cmd(stoptweening;linear,0.25;zoom,1.3;diffuseshift;effectperiod,0.5;effectcolor1,0.5,1,0.5,1;effectcolor2,0.25,0.5,0.25,1;);
		LoseFocusCommand=cmd(stoptweening;linear,0.25;zoom,1.0;stopeffect);
		DisabledCommand=cmd(diffuse,0.5,0.5,0.5,1);
	};
};

return t;
