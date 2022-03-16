/// @function can_carry()

function can_carry() {

	//Return whether if the player is able to hold an item or not
	return (input_check_pressed(input.action_1))
	&& (!instance_exists(obj_mario_balloon))
	&& (!instance_exists(obj_mario_fly))
	&& (instance_exists(obj_mario))
	&& (global.mount == 0)
	&& (obj_mario.kicking == 0)
	&& (obj_mario.holding == 0)
	&& (obj_mario.sliding == 0)
	&& (global.powerup != cs_tiny)
	&& (global.powerup != cs_mega)
	&& (obj_mario.enable_control == true)
	&& (obj_mario.state < playerstate.jump)
	&& (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_holdparent, 0, 0))
}