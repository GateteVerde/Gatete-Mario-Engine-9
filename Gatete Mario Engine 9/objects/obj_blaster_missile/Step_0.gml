/// @description Missile Bill Blaster logic

//Inherit the parent event
event_inherited();

//Lose memory of the missile bill
if (!instance_exists(mybullet))
	mybullet = -1;
