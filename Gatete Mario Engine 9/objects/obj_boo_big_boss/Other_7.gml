/// @description Stop animation

//If the boo is turning
if (sprite_index == spr_boo_big_turn) {

	//Set the sprite
	sprite_index = spr_boo_big;

	//Set facing direction
	xscale = prevxscale;

	//Do not animate
	image_speed = 0;
	image_index = 1;
}