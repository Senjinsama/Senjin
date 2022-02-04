require('image')
require('parameters')

player_1 = {}
player_1.name = nil
player_1.state = "idle"
player_1.x = 50
player_1.y = 300
--player_1.y = 300 - param[player_1.name][player_1.state].h
player_1.speed = 0
player_1.flip = 0.8
player_1.img = {}

player_2 = {}
player_2.name = nil
player_2.state = "idle"
player_2.x = 750
player_2.y = 300
--player_2.y = 300 - param[player_1.name][player_1.state].h
player_2.speed = 0
player_2.flip = -0.8
player_2.img = {}



function player_1.load(pName)
  player_1.name = pName
  player_1.img["idle"] = image.tileSheet[player_1.name].loadImg["idle"]
  player_1.img["walk"] = image.tileSheet[player_1.name].loadImg["walk"]
  player_1.img["punch"] = image.tileSheet[player_1.name].loadImg["punch"]
  player_1.img["kick"] = image.tileSheet[player_1.name].loadImg["kick"]
  --player_1.x = 50
  --player_1.y = 300
  player_1.speed = 300
end

function player_2.load(pName)
  player_2.name = pName
  player_2.img["idle"] = image.tileSheet[player_2.name].loadImg["idle"]
  player_2.img["walk"] = image.tileSheet[player_2.name].loadImg["walk"]
  player_2.img["punch"] = image.tileSheet[player_2.name].loadImg["punch"]
  player_2.img["kick"] = image.tileSheet[player_2.name].loadImg["kick"]
  --player_2.x = 50
  --player_2.y = 300
  player_2.speed = 300
end

function player_1.update(dt)
  player_1.state = "idle"
  
  if love.keyboard.isDown("q") then
    player_1.x = player_1.x - player_1.speed * dt
    player_1.state = "walk"
  elseif love.keyboard.isDown("d") then
    player_1.x = player_1.x + player_1.speed * dt
    player_1.state = "walk"
  end
  
  if love.keyboard.isDown("e") then
    player_1.state = "punch"
  end
  if love.keyboard.isDown("r") then
    player_1.state = "kick"
  end
  
  Animation.update_player1(param[player_1.name][player_1.state].w, param[player_1.name][player_1.state].h, dt, param[player_1.name][player_1.state].nbFrames)
end

function player_2.update(dt)
  player_2.state = "idle"
  
  --[[if love.keyboard.isDown("q") then
    player_1.x = player_1.x - player_1.speed * dt
    player_1.state = "walk"
  elseif love.keyboard.isDown("d") then
    player_1.x = player_1.x + player_1.speed * dt
    player_1.state = "walk"
  end
  
  if love.keyboard.isDown("e") then
    player_1.state = "punch"
  end
  if love.keyboard.isDown("r") then
    player_1.state = "kick"
  end]]--
  
  Animation.update_player2(param[player_2.name][player_2.state].w, param[player_2.name][player_2.state].h, dt, param[player_2.name][player_2.state].nbFrames)
end

function player_1.keypressed(pKey)
  if pKey == "e" then
    player_1.state = "punch"
  elseif pKey == "r" then
    player_1.state = "kick"
  end
  print(pKey)
end