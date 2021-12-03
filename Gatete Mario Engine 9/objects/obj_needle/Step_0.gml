/// @description Change angle, scale and alpha

angle -= 10;
if (angle < -360) {
	
	angle = -360;
	scale += 0.05;
	if (scale > 0.5) {
		
		alpha -= 0.05
		if (alpha < 0.05)
			instance_destroy();
	}
}