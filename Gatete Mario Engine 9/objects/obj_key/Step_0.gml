/// @description Key logic

//Inherit event from parent
event_inherited();

//Make the semisolid snap into the item
if (instance_exists(mysolid)) {

	mysolid.x = x-8;
	mysolid.y = (held == 1) ? -1000 : bbox_top + 1.5;
}