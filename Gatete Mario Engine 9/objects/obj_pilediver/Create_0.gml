/// @description Pile Diver Micro-Goomba

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various projectiles?
vulnerable = 1;

//How edible is this enemy to Yoshi?
edible = 2;

//Whether this enemy is jumping
jumping = 0

//Do not animate
image_speed = 0;
image_index = 0;

//Turn into a flip block if there's one below
if (collision_point(x, bbox_bottom+8, obj_flipblock, 0, 0)) 
    sprite_index = spr_pilediver_flip