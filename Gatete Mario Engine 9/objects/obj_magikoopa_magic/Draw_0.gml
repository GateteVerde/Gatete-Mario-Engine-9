/// @description Draw magic

//Set palette
pal_swap_set(spr_palette_yoshi, pal);

//Draw spell
for (var i=0; i<3; i++) {

    draw_sprite_ext(spr_magikoopa_magic, i, x+8*cos((angle+(i*360/3))*pi/180), y+8*sin((angle+(i*360/3))*pi/180), 1, 1, 0, c_white, 1);
}

//Reset palette
pal_swap_reset();

//Update angle
angle += 10*sign(xspeed);
if (angle > 360)
    angle -= 360;
