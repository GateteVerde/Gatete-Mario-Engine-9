/// @description Jump

//Set the sprite
sprite_index = spr_beachkoopa_blue_super_fly;

//Set the jump state
jumping = 1;
jumpy = y;

//Boost jump
y--;

//Set the vertical speed
if (swimming == false)
    yspeed = -4;
else
    yspeed = -1;