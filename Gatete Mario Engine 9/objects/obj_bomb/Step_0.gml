/// @description Carryable Bomb logic

//Inherit the parent event
event_inherited();

//Destroy when outside the view
if (outside_view() == true)
	instance_destroy();