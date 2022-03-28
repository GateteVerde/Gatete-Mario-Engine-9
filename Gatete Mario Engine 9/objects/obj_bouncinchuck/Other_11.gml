/// @description Custom stomp script

//Create a new chuck
with (instance_create_depth(x, y, depth, obj_charginchuck)) {

	event_user(1);
	hp = 1;
	firehp = other.firehp-2;
}

//Destroy
instance_destroy();