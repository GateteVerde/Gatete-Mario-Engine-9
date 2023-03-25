/// @description Hang the balloon

if (other.state == playerstate.jump)
&& (ready == 0)
&& (global.powerup != cs_tiny)
&& (global.powerup != cs_mega) {
	
	//Hang balloon
	ready = 1;
	
	//Stop jumping
	if (other.jumping > 0)
		other.jumping = 0;
}