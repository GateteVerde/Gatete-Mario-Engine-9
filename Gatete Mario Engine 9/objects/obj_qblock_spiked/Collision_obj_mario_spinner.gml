/// @description Open by hitting it with the tail

//Create a new block, give it the same item and bump it.
with (instance_create_layer(x, y, "Main", obj_qblock)) {
    
	//Set the item to reveal
	sprout = other.sprout;
	
	//Set state to bumped
	ready = 1;
						
	//Set horizontal speed
	vspeed = -2;
	alarm[0] = 4;
						
	//Create block specific events
	event_user(0);	
}

//Destroy
instance_destroy();
