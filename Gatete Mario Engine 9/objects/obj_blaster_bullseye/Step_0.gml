/// @description Bullseye Bill Blaster logic

//Inherit the parent event
event_inherited();

//Lose memory of the bullet if it does no longer exist
if (!instance_exists(mybullet))
	mybullet = -1;
