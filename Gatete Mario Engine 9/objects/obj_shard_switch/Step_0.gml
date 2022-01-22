/// @description Shard logic

//Set gravity
gravity = (direction == 90) ? 0 : 0.1;

//Destroy if outside the view
if (outside_view())
	instance_destroy();