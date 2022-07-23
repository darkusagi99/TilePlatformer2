
-- Chargement des dépendances
--local Level = require('Level')

-- Chargement initial des paramètres
function love.load()

	-- Chargement des éléments du jeu
	samplePicture = love.graphics.newImage("resources/cat1.jpg")
	startLayout = love.graphics.newImage("resources/start.png")
	pauseLayout = love.graphics.newImage("resources/pause.png")
	GameOverLayout = love.graphics.newImage("resources/gameOver.png")
	victoryLayout = love.graphics.newImage("resources/victory.png")
	
	-- Calcul du différentiel pour l'affichage
	renderWidth = 320
	renderHeight = 240
	
	-- Calcul des ratios d'affichage
	screenWidth, screenHeight = love.graphics.getDimensions( )
	scaleX = screenWidth / renderWidth
	scaleY = screenHeight / renderHeight
	
	-- Version
	version = "0.001"
	
	-- Gamestate
	-- 1 - Ecran accueil
	-- 2 - Debut partie
	-- 3 - Pause
	-- 4 - Gameover
	-- 5 - Victoire
	gamestate = 1
	
	-- Move vars
	moveLeft = 0
	moveRight = 0
	moveJump = 0
	
	
end

-- Méthode de dessin
function love.draw()

	-- Application du ration pour avoir du plein écran
	love.graphics.scale( scaleX, scaleY )

	
	if gamestate == 1 then
		-- Ecran accueil
		love.graphics.draw(startLayout, 0, 0, 0, 1, 1, 0, 0)
	else
		if gamestate == 2 then
			-- Affichage jeu
			love.graphics.draw(samplePicture, 0, 0, 0, 1, 1, 0, 0)
		else
			if gamestate == 3 then
				-- Affichage pause
				love.graphics.draw(pauseLayout, 0, 0, 0, 1, 1, 0, 0)
			else
				if gamestate == 4 then
					-- Affichage game over
					love.graphics.draw(GameOverLayout, 0, 0, 0, 1, 1, 0, 0)
				
				else
					-- Donc ici est est à gamestate == 5
					-- Affichage victoire
					love.graphics.draw(victoryLayout, 0, 0, 0, 1, 1, 0, 0)
				
				end
			
			end
			
		end
	end
	
end

-- Fonction de détection des touches
function love.keypressed(key)

	-- ECHAP => Fermeture programme
	if key == 'escape' then
		love.event.quit()
	end
	
	-- Lecture / changement des evenements en fonction des boutons
	if gamestate == 2 then
		-- Jeu en cours : Lecture normale des boutons
		
		-- Flèche gauche -> Aller à gauche
		if key == 'left' then			
			moveLeft = 1
		end
		
		-- Flèche droite -> Aller à droite
		if key == 'right' then
			moveRight = 1
		end
		
		-- Espace -> Sauter
		if key == 'space' then
			moveJump = 1
		end
		
		-- Entrée -> Pause
		if key == 'return' then
			gamestate = 3
		end
		
	else
		-- N'importe quel autre état -> Changement de l'état
		if gamestate == 3 then
			gamestate = 2
		else
			if gamestate == 1 then
				-- Démarrage de la partie
				gamestate = 2
			else
				-- Reste ici les cas 4 et 5 -> Retour à l'accueil
				gamestate = 1
			end
		end
	end
end

-- Fonction de détection des touches - relacher
function love.keyreleased(key)

	-- Lecture / changement des evenements en fonction des boutons relachés
	-- Flèche gauche -> Aller à gauche
	if key == 'left' then
		moveLeft = 0
	end
	
	-- Flèche droite -> Aller à droite
	if key == 'right' then
		moveRight = 0
	end
	
	-- Espace -> Sauter
	if key == 'space' then
		moveJump = 0
	end
		
end