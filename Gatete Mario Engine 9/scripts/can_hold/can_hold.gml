/// @function can_hold()

function can_hold() {

	//Return whether if the player is able to hold an item or not
	return (input_check(input.action_1))
	&& (!instance_exists(obj_mario_balloon))
	&& (!instance_exists(obj_mario_puller))
	&& (!instance_exists(obj_mario_fly))
	&& (instance_exists(obj_mario))
	&& (global.mount == 0)
	&& (obj_mario.holding == 0)
	&& (obj_mario.sliding == 0)
	&& (global.powerup != cs_tiny)
	&& (global.powerup != cs_mega)
	&& (obj_mario.enable_control == true)
}