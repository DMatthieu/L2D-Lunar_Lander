--Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no');

debugSpr = false;

local Lander = {}
        Lander.x = 0;
        Lander.y = 0;
        Lander.angle = -90;
        Lander.vx = 0;
        Lander.vy = 0;
        Lander.spr = love.graphics.newImage("images/ship.png");
        
        --Lander scale
        Lander.sx = 1;
        Lander.sy = 1;

        --Origin Offset
        Lander.ox = Lander.spr:getWidth() / 2;
        Lander.oy = Lander.spr:getHeight() / 2;   


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
    Lander.vy = Lander.vy + gravityQuotient;
    Lander.y = Lander.y + Lander.vy;

end

function love.draw()
    --Show expected ship's first load position on screen
    if (debugSpr) then
        --Draw lines to control if spr is centered at begining
        love.graphics.line(largeur/2, 0, largeur/2, hauteur);
        love.graphics.line(0, hauteur/2, largeur, hauteur/2);
    end

    --Debug Angle
    love.graphics.print("Angle: "..Lander.angle, 15, 15)

    --Affichage Image
    love.graphics.draw(Lander.spr, Lander.x, Lander.y, math.rad(Lander.angle), Lander.sx, Lander.sy, Lander.ox, Lander.oy);

    

end