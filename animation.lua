-- Pour l'animation : quad pour les états
Animation = {}
Animation[1] = {}
Animation[1].img = {}
Animation[1].img["idle"] = nil
Animation[1].img["walk"] = nil
Animation[1].img["punch"] = nil
Animation[1].img["kick"] = nil

Animation[2] = {}
Animation[2].img = {}
Animation[2].img["idle"] = nil
Animation[2].img["walk"] = nil
Animation[2].img["punch"] = nil
Animation[2].img["kick"] = nil



-- Variables pour l'animation et les frames : frame courante, nb max de frames, vitesse animation, position du quad en x, position du quad en y
currentFrameTimer = 1
--numberOfFrames = 10
animationSpeed = 8
quadPosX = 0
quadPosY = 0


function Animation.loadPlayer_1(pName)
  
  Animation[1].img["idle"] = love.graphics.newQuad(0,0,param[pName]["idle"].w,param[pName]["idle"].h, player_1.img["idle"]:getDimensions())
  Animation[1].img["walk"] = love.graphics.newQuad(0,0,param[pName]["walk"].w,param[pName]["walk"].h, player_1.img["walk"]:getDimensions())
  Animation[1].img["punch"] = love.graphics.newQuad(0,0,param[pName]["punch"].w,param[pName]["punch"].h, player_1.img["punch"]:getDimensions())
  Animation[1].img["kick"] = love.graphics.newQuad(0,0,param[pName]["kick"].w,param[pName]["kick"].h, player_1.img["kick"]:getDimensions())
end

function Animation.loadPlayer_2(pName)
  
  Animation[2].img["idle"] = love.graphics.newQuad(0,0,param[pName]["idle"].w,param[pName]["idle"].h, player_2.img["idle"]:getDimensions())
  Animation[2].img["walk"] = love.graphics.newQuad(0,0,param[pName]["walk"].w,param[pName]["walk"].h, player_2.img["walk"]:getDimensions())
  Animation[2].img["punch"] = love.graphics.newQuad(0,0,param[pName]["punch"].w,param[pName]["punch"].h, player_2.img["punch"]:getDimensions())
  Animation[2].img["kick"] = love.graphics.newQuad(0,0,param[pName]["kick"].w,param[pName]["kick"].h, player_2.img["kick"]:getDimensions())
end


function Animation.update_player1(pWidth, pHeight, pDt, pNbFrames)
  currentFrameTimer = currentFrameTimer + (pDt * animationSpeed)
  if currentFrameTimer>pNbFrames + 1 then
    currentFrameTimer = 1
  end
  
  quadPosX = math.floor(currentFrameTimer) * pWidth - pWidth
  Animation[1].img[player_1.state]:setViewport(quadPosX,quadPosY,pWidth,pHeight)
end

function Animation.update_player2(pWidth, pHeight, pDt, pNbFrames)
  currentFrameTimer = currentFrameTimer + (pDt * animationSpeed)
  if currentFrameTimer>pNbFrames + 1 then
    currentFrameTimer = 1
  end
  
  quadPosX = math.floor(currentFrameTimer) * pWidth - pWidth
  Animation[2].img[player_2.state]:setViewport(quadPosX,quadPosY,pWidth,pHeight)
end


