require('image')

menu_selection = {}
menu_selection.screen_title = love.graphics.newImage("res/logo/selection_screen.png")

menu_selection.cadreUI = {}
menu_selection.cadreUI.x = 50
menu_selection.cadreUI.y = 200
menu_selection.cadreUI.w = 160
menu_selection.cadreUI.h = 190

menu_selection.listePerso = {}
menu_selection.listePerso[1] = {}
menu_selection.listePerso[1].name = "Senjinsama"
menu_selection.listePerso[1].portrait = love.graphics.newImage("res/Senjinsama/portrait.png")

menu_selection.listePerso[2] = {}
menu_selection.listePerso[2].name = "Wonder LadyBug"
menu_selection.listePerso[2].portrait = love.graphics.newImage("res/Wonder_LadyBug/portrait.png")

--menu_selection.listePerso[3] = "Magic Ganou"
--menu_selection.listePerso[4] = "Aaron Firewalker"
--menu_selection.listePerso[5] = "Dark Ninja"

menu_selection.persoSelected = 1

menu_selection.persoChosen = nil

function menu_selection.update(dt)
  
  
end


function menu_selection.draw()
  local y = 50
  for i=1, #menu_selection.listePerso do
    if i == menu_selection.persoSelected then
      love.graphics.setColor(1,0,0)
    else
      love.graphics.setColor(1,1,1)
    end
    love.graphics.print(menu_selection.listePerso[i],50,y)
    y = y + 15
  end
end

function menu_selection.DrawUI()
  love.graphics.draw(menu_selection.screen_title,60,50,0,1,1)
  menu_selection.cadreUI.x = 100
  for i=1, #menu_selection.listePerso do
    if i == menu_selection.persoSelected then
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line",menu_selection.cadreUI.x, menu_selection.cadreUI.y,menu_selection.cadreUI.w, menu_selection.cadreUI.h)
      love.graphics.setColor(1,1,1)
    else
      love.graphics.setColor(1,1,1)
    end
    love.graphics.draw(menu_selection.listePerso[i].portrait,menu_selection.cadreUI.x,menu_selection.cadreUI.y,0,1,1)
    --love.graphics.print(menu_selection.listePerso[i],menu_selection.cadreUI.x + 5,menu_selection.cadreUI.y + 10)
    menu_selection.cadreUI.x = menu_selection.cadreUI.x + menu_selection.cadreUI.w + 10
    
  end
end


function menu_selection.keypressed(pKey)
  if pKey == "right" then
    menu_selection.persoSelected = menu_selection.persoSelected + 1
  elseif pKey == "left" then
    menu_selection.persoSelected = menu_selection.persoSelected - 1
  end
  if menu_selection.persoSelected > #menu_selection.listePerso then
    menu_selection.persoSelected = 1
  elseif menu_selection.persoSelected < 1 then
    menu_selection.persoSelected = #menu_selection.listePerso
  end
  
  if pKey == "return" then
    menu_selection.persoChosen = menu_selection.listePerso[menu_selection.persoSelected].name
    screen = "game"
  end
end