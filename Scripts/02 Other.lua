function TextBannerAfterSet(self,param) 
	local Title=self:GetChild("Title") 
	local Subtitle=self:GetChild("Subtitle") 

	if Subtitle:GetText() == "" then 
		Title:maxwidth(300)
		Title:y(-1)
		Title:zoom(1)

		Subtitle:visible(false)
	else
		Title:y(-6)
		Title:zoom(0.8)

		-- subtitle below title
		Subtitle:visible(true)
		Subtitle:zoom(0.6)
		Subtitle:y(12)
	end
end