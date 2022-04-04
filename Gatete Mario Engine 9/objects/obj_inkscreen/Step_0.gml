/// @description Fade out and destroy

//Begin fade out
if (ready == 1) {

	alpha -= 0.025;
	if (alpha < 0.025)
		instance_destroy();
}
