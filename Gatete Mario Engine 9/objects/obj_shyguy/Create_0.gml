/// @description Shy Guy

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 1;

//How vulnerable is this enemy to Mario?
stomp = 3;

//Move towards Mario
alarm[10] = 2;

//Shitpost
if (object_index != obj_snifit)
&& (object_index != obj_shyguy_big) {

	//Turn into a sus-guy
	if (sus == false)
	&& (sprite_index == spr_susguy)
		sus = true;
	
	//Otherwise
	else if (sus)
		sprite_index = spr_susguy;
}