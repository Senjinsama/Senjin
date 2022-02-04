io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")

require('player')
require('animation')
require('menu_selection')



function love.load()
  screen = "menu"
end


function love.update(dt)
  if screen == "menu" then
    
  elseif screen == "game" then
    player_1.name = menu_selection.persoChosen
    player_1.load(player_1.name)
    Animation.loadPlayer_1(player_1.name)
    player_1.update(dt)
    
    player_2.load("Wonder LadyBug")
    Animation.loadPlayer_2("Wonder LadyBug")
    player_2.update(dt)
  end
  
end


function love.draw()
  local img = player_1.img[player_1.state]
  local quad = Animation[1].img[player_1.state]
  
  local img_2 = player_2.img[player_2.state]
  local quad_2 = Animation[2].img[player_2.state]
  if screen == "menu" then
    --menu_selection.draw()
    menu_selection.DrawUI()
  elseif screen == "game" then
    love.graphics.draw(img, quad, player_1.x, player_1.y,0,player_1.flip,0.8)
    love.graphics.draw(img_2, quad_2, player_2.x, player_2.y,0,player_2.flip,0.8)
  end
end


function love.keypressed(key)
  if screen == "menu" then
    menu_selection.keypressed(key)
  end
  if screen == "game" then
    player_1.keypressed(key)
  end
  if screen == "game" then
    if key == "escape" then
      screen = "menu"
    end
  end
end