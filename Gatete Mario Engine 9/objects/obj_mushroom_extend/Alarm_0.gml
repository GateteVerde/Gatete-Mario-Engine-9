/// @description Extend / Contract

//Do not trigger this alarm if the mushroom is still expanding
if (image_xscale != xscale_new) {

	alarm[0] = 1;
	exit;
}

alarm[0] = shrink_time+30;
alarm[1] = shrink_time;
extend = !extend;
boop = 0;