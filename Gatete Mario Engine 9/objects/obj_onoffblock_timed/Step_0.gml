/// @description Inherit all block events

//Inherit the parent event
event_inherited();

//Set the block sprite
with (obj_onoffblock_timed) {

	sprite_index = other.sprite_index;
	image_speed = other.image_speed;
	image_index = other.image_index;
}