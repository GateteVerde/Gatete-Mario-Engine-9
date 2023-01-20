/// @description Jump boost after stomping

//If Yoshi exists, force end flutter
if (instance_exists(obj_yoshi)) {

	if (obj_yoshi.flutter > 0)
		obj_yoshi.flutter = 0;
}

//Set the vertical speed
yspeed = -4.125;

//Boost jump
y--;

//End groundpound
groundpound = 0;

//Variable jumping
if (input_check(input.action_0))
	jumping = 1;
else
	jumping = 2;