GameColor = {
	PlayerColors = {
		PLAYER_1	= color("0.4,1.0,0.8,1"),
		PLAYER_2	= color("1.0,0.5,0.2,1"),
	},
	PlayerDarkColors = {
		PLAYER_1	= color("0.4,1.0,0.8,1"),
		PLAYER_2	= color("1.0,0.5,0.2,1"),
	},
	Difficulty = {
		--[[ These are for 'Custom' Difficulty Ranks. It can be very  useful
		in some cases, especially to apply new colors for stuff you
		couldn't before. (huh? -aj) ]]
		Beginner	= color("#92C7D3"),			-- cyan
		Easy		= color("#F2B603"),			-- orange
		Medium		= color("#EF4ABF"),			-- magenta
		Hard		= color("#19B706"),			-- green
		Challenge	= color("#115ED8"),			-- blue
		Edit		= color("#78909C"),			-- gray
		Couple		= color("#ed0972"),			-- hot pink
		Routine		= color("#ff9a00"),			-- orange
		--[[ These are for courses, so let's slap them here in case someone
		wanted to use Difficulty in Course and Step regions. ]]
		Difficulty_Beginner	= color("#92C7D3"),		--
		Difficulty_Easy		= color("#F2B603"),		--
		Difficulty_Medium	= color("#EF4ABF"),		--
		Difficulty_Hard		= color("#19B706"),		-- 
		Difficulty_Challenge	= color("#115ED8"),	-- 
		Difficulty_Edit 	= color("#78909C"),		--
		Difficulty_Couple	= color("#ed0972"),				-- 
		Difficulty_Routine	= color("#ff9a00")				-- 
	},
	Stage = {
		Stage_1st	= color("#3EE7F7"),
		Stage_2nd	= color("#55DE23"),
		Stage_3rd	= color("#DE23A6"),
		Stage_4th	= color("#3EE7F7"),
		Stage_5th	= color("#55DE23"),
		Stage_6th	= color("#DE23A6"),
		Stage_Next	= color("#3EE7F7"),
		Stage_Final	= color("#DB0000"),
		Stage_Extra1	= color("#FFF700"),
		Stage_Extra2	= color("#FFA600"),
		Stage_Nonstop	= color("#FFFFFF"),
		Stage_Oni	= color("#FFFFFF"),
		Stage_Endless	= color("#FFFFFF"),
		Stage_Event	= color("#FFFFFF"),
		Stage_Demo	= color("#FFFFFF")
	},
	Judgment = {
		JudgmentLine_W1		= color("#6EBAE9"),
		JudgmentLine_W2		= color("#E8B900"),
		JudgmentLine_W3		= color("#98CD1B"),
		JudgmentLine_W4		= color("#60CEEE"),
		JudgmentLine_W5		= color("#8256A9"),
		JudgmentLine_Held	= color("#DFB566"),
		JudgmentLine_Miss	= color("#ff3c3c"),
		JudgmentLine_MaxCombo	= color("#212121")
	},
};

GameColor.Difficulty["Crazy"] = GameColor.Difficulty["Hard"];
GameColor.Difficulty["Freestyle"] = GameColor.Difficulty["Easy"];
GameColor.Difficulty["Nightmare"] = GameColor.Difficulty["Challenge"];
GameColor.Difficulty["HalfDouble"] = GameColor.Difficulty["Medium"];