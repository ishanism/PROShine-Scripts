name = "Catching: [[PokemonName]] - [[ Map Name ]] "
author = "ishanism"
description = [[This script will try to capture shinies/[PokemonName] with Sync on 1st slot,
sends 2nd Pokemon(False Swipe) and at 1hp 3rd Pokemon(Sleep Powder) or (4th Pokemon if 3rd is already faint) and then by throwing balls based on priority.

Your 1st Pokemon needs to be Sync.
Your 2nd Pokemon needs to be False Swipe.
Your 3rd Pokemon needs to be Sleep Powder / Hypnosis.

]]

function onPathAction()
	-- [[ Change the following as needed]] --

	if isPokemonUsable(1) and isPokemonUsable(2) and isPokemonUsable(3) then
		if getMapName() == "Pokecenter Viridian" then
			moveToMap("Viridian City")
		elseif getMapName() == "Viridian City" then
			moveToMap("Route 22")
		elseif getMapName() == "Route 22" then
			
			-- Arrange it as required.

			moveToGrass()

			-- moveNearExit("Pokemon League Reception Gate")
			-- moveToRectangle(7, 10, 21, 15)
		

		end
	else
		if getMapName() == "Route 22" then	
			moveToMap("Viridian City")
		elseif getMapName() == "Viridian City" then
			moveToMap("Pokecenter Viridian")
		elseif getMapName() == "Pokecenter Viridian" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and ( isOpponentShiny() or (getOpponentName() == "[[PokemonName]]" ) ) then
		if getActivePokemonNumber() == 1 then
			return sendPokemon(2) or run()
		elseif ( getActivePokemonNumber() == 2 ) and ( getOpponentHealth() > 1 ) then
			return weakAttack() or run()
		elseif ( getActivePokemonNumber() == 2 ) and ( getOpponentHealth() == 1 ) then
		
			return sendPokemon(3) or sendPokemon(4)

			-- This is done incase you get pokemon you want and your sleep pokemon is fainted, but it will still try to catch.
			-- If you want to just run then uncomment the below line and delete above line.

			-- return run()


		elseif ( getActivePokemonNumber() == 3 ) and ( getOpponentHealth() == 1 ) and ( getOpponentStatus() ~= "SLEEP" ) then
			
			-- Change the Sleep Powder to Hypnosis if your pokemon uses Hypnosis.

			return useMove("Sleep Powder") or sendPokemon(4) 


		elseif ( getOpponentStatus() == "SLEEP" ) or ( getOpponentHealth() == 1 ) then
			
			-- Uncomment the other line if you want to change the ball priority. (Use Pokeball first, then Great Ball, then Ultra Ball)

			return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball")

			--return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")			


		end
	end
	if getActivePokemonNumber() >= 1 then
		return run() or attack()
	end
end
