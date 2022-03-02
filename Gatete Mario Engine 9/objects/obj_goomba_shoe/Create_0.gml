/// @description Kuribo Shoe Goomba

//Inherit the parent event
event_inherited();

//How edible is this enemy to yoshi
edible = 1;

//Freeze Sprite
freeze_sprite = spr_goomba_shoe_frozen;

//Shoe animation
anim = 0;

//Whether the goomba is ready to jump
ready = 0;

//Whether the goomba is jumping
jumping = 0;

//Move towards Mario
alarm[10] = 2;

//Do not animate
image_speed = 0;
image_index = 1;

//Set the facing direction
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;