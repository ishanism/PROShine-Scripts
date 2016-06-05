function onStart()

	showStatsOnPause = true -- Change this to false if you don't want to see stats when the bot is paused.
	showStatsOnStop = true -- Change this to false if you don't want to see stats when the bot is stopped.

	startingMoney = getMoney()

	teamSize = getTeamSize()

	startingATK = {}
	startingDEF = {}
	startingSPD = {}
	startingSPATK = {}
	startingSPDEF = {}
	startingHP = {}
	startingLevel = {}

	for i=1, teamSize, 1 
	do 
		startingATK[i] = getPokemonEffortValue(i, "ATK") 
		startingDEF[i] = getPokemonEffortValue(i, "DEF") 
		startingSPD[i] = getPokemonEffortValue(i, "SPD") 
		startingSPATK[i] = getPokemonEffortValue(i, "SPATK") 
		startingSPDEF[i] = getPokemonEffortValue(i, "SPDEF") 
		startingHP[i] = getPokemonEffortValue(i, "HP") 
		startingLevel[i] = getPokemonLevel(i)
	end
end


function onPause()

	if showStatsOnPause == true then

		log ("Total amount of Pokedollars Earned is "..tostring(getMoney() - startingMoney))
		log ("")

		for j=1,teamSize,1 
		do 
			log ("" .. getPokemonName(j) .. "'s ATK Gained - "..tostring(getPokemonEffortValue(j, "ATK") - startingATK[j]))
			log ("" .. getPokemonName(j) .. "'s DEF Gained - "..tostring(getPokemonEffortValue(j, "DEF") - startingDEF[j])) 
			log ("" .. getPokemonName(j) .. "'s SPD Gained - "..tostring(getPokemonEffortValue(j, "SPD") - startingSPD[j])) 
			log ("" .. getPokemonName(j) .. "'s SPATK Gained - "..tostring(getPokemonEffortValue(j, "SPATK") - startingSPATK[j]))
			log ("" .. getPokemonName(j) .. "'s SPDEF Gained - "..tostring(getPokemonEffortValue(j, "SPDEF") - startingSPDEF[j])) 
			log ("" .. getPokemonName(j) .. "'s HP Gained - "..tostring(getPokemonEffortValue(j, "HP") - startingHP[j]))

			log ("" .. getPokemonName(j) .. " Gained "..tostring(getPokemonLevel(j) - startingLevel[j]) .. " Levels during the Bot Session.")
			log ("")
		end

		log("Bot Paused........  I can't guess if you will start the bot again. I am not a mind reader.")
	end

end

function onStop()

	if showStatsOnStop == true then

		log ("Total amount of Pokedollars Earned is "..tostring(getMoney() - startingMoney))
		log ("")

		for k=1,teamSize,1 
		do 
			log ("" .. getPokemonName(k) .. "'s ATK Gained - "..tostring(getPokemonEffortValue(k, "ATK") - startingATK[k]))
			log ("" .. getPokemonName(k) .. "'s DEF Gained - "..tostring(getPokemonEffortValue(k, "DEF") - startingDEF[k])) 
			log ("" .. getPokemonName(k) .. "'s SPD Gained - "..tostring(getPokemonEffortValue(k, "SPD") - startingSPD[k])) 
			log ("" .. getPokemonName(k) .. "'s SPATK Gained - "..tostring(getPokemonEffortValue(k, "SPATK") - startingSPATK[k]))
			log ("" .. getPokemonName(k) .. "'s SPDEF Gained - "..tostring(getPokemonEffortValue(k, "SPDEF") - startingSPDEF[k])) 
			log ("" .. getPokemonName(k) .. "'s HP Gained - "..tostring(getPokemonEffortValue(k, "HP") - startingHP[k]))

			log ("" .. getPokemonName(k) .. " Gained "..tostring(getPokemonLevel(k) - startingLevel[k]) .. " Levels during the Bot Session.")
			log ("")
		end

		log ("Bot Stopped..... Go play without bot now.")
	end

end