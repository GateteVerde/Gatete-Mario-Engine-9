/// @description Coin Snake logic

//Set sprite
sprite_index = (obj_levelcontrol.pswitch_on) ? spr_brick : spr_coin;

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region DIRECTION

	//Change direction based on input
	if (input_check(input.up))
		nextdir = 90;
	else if (input_check(input.down))
		nextdir = 270;
	else if (input_check(input.left))
		nextdir = 180;
	else if (input_check(input.right))
		nextdir = 0;
#endregion