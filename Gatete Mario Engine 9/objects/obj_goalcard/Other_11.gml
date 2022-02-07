/// @description Set up a spinning card sprite.

//Set the sprite
switch (image_index) {

	case (0): sprite_index = spr_goal_card_mushroom; break;
	case (1): sprite_index = spr_goal_card_flower; break;
	case (2): sprite_index = spr_goal_card_star; break;
}

//Move up
vspeed = -3;

//Animate
image_speed = 1;