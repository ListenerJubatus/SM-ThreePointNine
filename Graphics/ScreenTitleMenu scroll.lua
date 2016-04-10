local s = THEME:GetString( 'ScreenTitleMenu', Var("GameCommand"):GetText() );
local t = Def.ActorFrame {
	LoadFont("_spaceport 2006 Bold 36px") ..{
		InitCommand=cmd(uppercase,true;settext,s;halign,0.5;strokecolor,Color("Black");shadowlength,6);
		GainFocusCommand=cmd(stoptweening;linear,0.25;zoom,1.0;diffuseshift;effectperiod,0.5;effectcolor1,0.5,1,0.5,1;effectcolor2,0.25,0.5,0.25,1;);
		LoseFocusCommand=cmd(stoptweening;linear,0.25;zoom,0.7;stopeffect);
		DisabledCommand=cmd(diffuse,0.5,0.5,0.5,1);
	};
};

return t;
