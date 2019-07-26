--Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no');

love.graphics.setDefaultFilter( "nearest" )


debugSpr = false;

local Lander = {}
        Lander.x = 0;
        Lander.y = 0;
        Lander.angle = -90;
        Lander.vx = 0;
        Lander.vy = 0;
        Lander.spr = love.graphics.newImage("images/ship.png");
        Lander.engine = love.graphics.newImage("images/engine.png");
        
        --Lander scale
        Lander.sx = 2;
        Lander.sy = 2;

        --Origin Offset
        Lander.ox = Lander.spr:getWidth() / 2;
        Lander.oy = Lander.spr:getHeight() / 2;   

        --Engine Origin offset 
        Lander.eOx = Lander.engine:getWidth() / 2;   
        Lander.eOy = Lander.engine:getHeight() / 2;   


function love.load()
    --DIMENSIONS DE LA FENETRE
    largeur = love.graphics.getWidth();
    hauteur = love.graphics.getHeight();

    Lander.x = largeur / 2;
    Lander.y = hauteur / 2;

    gravityQuotient = 0.0005;
    
end

function love.update(dt)

    --Lander GRAVITY
    --Lander.vy = Lander.vy + gravityQuotient;
    Lander.y = Lander.y + Lander.vy;

    --Quit game with ESCAPE
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    if love.keyboard.isDown("left") then 
        Lander.angle = Lander.angle + 90 * dt
    end
    if love.keyboard.isDown("right") then 
        Lander.angle = Lander.angle - 90 * dt
    end
    if love.keyboard.isDown("up") then 

    end
   
        
    

end

function love.draw()
    --Show expected ship's first load position on screen
    if (debugSpr == true) then
        --Draw lines to control if spr is centered at begining
        love.graphics.line(largeur/2, 0, largeur/2, hauteur);
        love.graphics.line(0, hauteur/2, largeur, hauteur/2);

        

    end

    --Debug Angle
    love.graphics.print("Angle: "..Lander.angle, 15, 15)

    --Affichage Image
    love.graphics.draw(Lander.spr, Lander.x, Lander.y, math.rad(Lander.angle), Lander.sx, Lander.sy, Lander.ox, Lander.oy);
    
    if love.keyboard.isDown("up") then 
        love.graphics.draw(Lander.engine, Lander.x, Lander.y, math.rad(Lander.angle), Lander.sx, Lander.sy, Lander.eOx, Lander.eOy);
    end
    

    -- ################ Permit to create multiplelines linked toether !! :D
    --love.graphics.line(200,50, 400,50, 500,300, 100,300, 200,50)

end