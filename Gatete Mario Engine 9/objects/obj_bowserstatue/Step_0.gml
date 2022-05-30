/// @description Bowser Statue logic

//Inherit the parent event
event_inherited();

//Make the solid move along this object
if (instance_exists(mysolid)) {
	
	mysolid.x = x-8;
	mysolid.y = y;
}
