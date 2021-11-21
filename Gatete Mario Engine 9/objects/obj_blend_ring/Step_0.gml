/// @description Vanish when scale is over 0.5

scale += 0.03245;
if (scale > 0.5) {

	alpha -= 0.05;
	if ((alpha < 0.05) && (alpha2 < 0.025))
		instance_destroy();
}
alpha2 -= 0.025;