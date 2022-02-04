/// @description You got points!

//Score font
font = font_add_sprite_ext(spr_score, "0123456789", 0, 0);
font_big = font_add_sprite_ext(spr_score_big, "0123456789", 0, 0);

//Depth
depth = -6;

//Default value
value = 10;

//Scale
scale = 0;

//Alpha
alpha = 0;

//Set vertical speed
vspeed = -1;

//Set friction
friction = 0.0175;

//Give the amount of score
alarm[0] = 2;

//Create sparkle effects
alarm[1] = 1;