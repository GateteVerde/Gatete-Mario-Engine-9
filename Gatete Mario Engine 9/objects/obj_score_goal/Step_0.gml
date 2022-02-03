/// @description Keep in view and rescale if necessary

//Scale
scale += 0.05;
if (scale > 1) {
	
    scale = 1;
}

//Stay in flag
if (y < obj_flagpole_flag_mario.y)
    y = obj_flagpole_flag_mario.y;