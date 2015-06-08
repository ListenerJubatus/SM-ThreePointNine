local c;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local ShowMissesAt = THEME:GetMetric("Combo", "ShowMissesAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

local t = Def.ActorFrame {
	LoadFont( "", "Combo" ) .. {
		Name="ComboNumber";
		OnCommand = THEME:GetMetric("Combo", "ComboNumberOnCommand");
	};
	LoadActor("Combo label") .. {
		Name="ComboLabel";
		OnCommand = THEME:GetMetric("Combo", "ComboLabelOnCommand");
	};

	InitCommand = function(self)
		c = self:GetChildren();
		c.ComboNumber:visible(false);
		c.ComboLabel:visible(false);
	end;

	ComboCommand=function(self, param)
		local iNum = param.Combo;

		c.ComboNumber:visible(false);
		c.ComboLabel:visible(false);

		local ShowAt;
		if param.Combo then
			ShowAt = ShowComboAt;
		end
		
		if not iNum  or  ShowAt == 0  or  iNum < ShowAt then
			return;
		end

		local Number;
		if param.Combo then
			Number = c.ComboNumber;
		end
		local Label;
		if param.Combo then
			Label = c.ComboLabel;
		end
		
		param.Zoom = scale( iNum, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom );
		param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );

		Number:visible(true);
		Label:visible(true);

		Number:settext( string.format("%i", iNum) );

		Pulse( Number, param );
		Pulse( Label, param );
	end;
};

return t;
