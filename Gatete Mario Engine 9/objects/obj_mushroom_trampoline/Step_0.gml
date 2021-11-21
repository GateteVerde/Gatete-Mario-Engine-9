/// @description Mushroom Jelly logic

//If bouncing on
if (ready == 1) {
		
	xscale = lerp(xscale, 1.25, 0.3);
	yscale = lerp(yscale, 0.75, 0.3);
	if (xscale > 1.24)	
		ready = 0;
}
	
//If returning to normal
else {
		
	xscale = lerp(xscale, 1, 0.15);
	yscale = lerp(yscale, 1, 0.15);
}