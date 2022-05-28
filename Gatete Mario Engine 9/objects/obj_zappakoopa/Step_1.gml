/// @description Laser 

//If the laser does not exist
if (laser_ex == 1)
&& (!instance_exists(mylaser)) {

	//Close the mouth
	alarm[4] = 30;
	
	//Lose memory of the laser
	laser_ex = 0;
	mylaser = noone;
}
