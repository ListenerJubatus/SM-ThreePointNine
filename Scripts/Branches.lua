Branch.StartGame = function()
	if SONGMAN:GetNumSongs() == 0 and SONGMAN:GetNumAdditionalSongs() == 0 then
		-- xxx: use titlemenu and titlejoin as needed
		return "ScreenTitleMenu"
	end

	return PREFSMAN:GetPreference("ShowCaution") and "ScreenCaution" or "ScreenSelectStyle"
end

-- gameplay branch that takes extra stage into account
Branch.GameplayScreen = function()
	if IsRoutine() then
		return "ScreenGameplayShared"
	elseif GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
		return "ScreenGameplayExtra"
	end
	return "ScreenGameplay"
end

-- somewhat proper evaluation screen usage.
-- handles online, oni, nonstop/endless (shared), rave, normal
Branch.AfterGameplay = function()
	if IsNetSMOnline() then
		-- even though online mode isn't supported in this theme yet
		return "ScreenNetEvaluation"
	else
		if GAMESTATE:IsCourseMode() then
			if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
				return "ScreenEvaluationNonstop"
			else	-- oni and endless are shared
				return "ScreenEvaluationOni"
			end
		elseif GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			return "ScreenEvaluationRave"
		else
			return "ScreenEvaluationNormal"
		end
	end
end

-- xxx: needs to be less broken
Branch.AfterEvaluation = function()
	if GAMESTATE:IsCourseMode() then
		-- (nonstop, oni, endless eval)
		return "ScreenNameEntry"
	else
		-- (normal, rave eval)

		-- event mode is classic infinite.
		if GAMESTATE:IsEventMode() then return "ScreenProfileSave" end

		-- non-event mode
		local maxStages = PREFSMAN:GetPreference("SongsPerPlay")
		local stagesLeft = GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer()
		local allFailed = STATSMAN:GetCurStageStats():AllFailed()

		local song = GAMESTATE:GetCurrentSong()

		if stagesLeft >= 1 then
			-- enough stages left to play
			return "ScreenProfileSave"
		-- UNCHANGED CRAP
		elseif song:IsLong() and maxStages <= 2 and stagesLeft < 1 and allFailed then
			return "ScreenProfileSaveSummary"
		elseif song:IsMarathon() and maxStages <= 3 and stagesLeft < 1 and allFailed then
			return "ScreenProfileSaveSummary"
		elseif maxStages >= 2 and stagesLeft < 1 and allFailed then
			return "ScreenProfileSaveSummary"
		elseif allFailed then
			return "ScreenProfileSaveSummary"
		-- END UNCHANGED CRAP
		else
			-- unknown situation
			return "ScreenProfileSave"
		end
	end
end

-- needs to be tested
Branch.AfterProfileSave = function()
	if GAMESTATE:IsCourseMode() then
		-- course modes go to whatever, depending on ranking crap.
		-- 3.9 says it goes to ScreenNameEntry all the time.
		return "ScreenNameEntry"
	else
		if GAMESTATE:IsEventMode() then
			-- infinite play
			return SelectMusicOrCourse()
		elseif STATSMAN:GetCurStageStats():AllFailed() then
			-- if the player failed extra stage, don't game over.
			if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
				return "ScreenEvaluationSummary"
			else
				return "ScreenGameOver"
			end
		elseif GAMESTATE:GetSmallestNumStagesLeftForAnyHumanPlayer() == 0 then
			return "ScreenEvaluationSummary"
		else
			-- when do we get here??
			return SelectMusicOrCourse()
		end
	end
end

-- broken too;
Branch.AfterSaveSummary = function()
	local getRankingName = PREFSMAN:GetPreference("GetRankingName")
	if getRankingName == "RankingName_Off" then
		-- never show ranking screen
		return Branch.Ending()
	elseif getRankingName == "RankingName_List" then
		-- check if we've set the conditions (e.g. ranked course)
	elseif getRankingName == "RankingName_On" then
		-- check for ranking via GAMESTATE:AnyPlayerHasRankingFeats()
		if GAMESTATE:AnyPlayerHasRankingFeats() then return "ScreenNameEntry" end
	end

	return "ScreenGameOver"
	--[[ Enable when Finished ]]
	--return GAMESTATE:AnyPlayerHasRankingFeats() and "ScreenNameEntry" or "ScreenGameOver"
end