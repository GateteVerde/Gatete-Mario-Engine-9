/// @description Jump

//If Birdo is not shooting
if (shooting == 0) {

	//Stop animation
	image_speed = 0;

	//Stop horizontal speed
	xspeed = 0;

	//Hop
	yspeed = -2;
	y--;

	//Jump
	jumping = 1;
}