/// @description Manage soap bubble

//If not showing, show up the soap bubble
if (ready == 0) {
	
	//If this object is outside the view
	if (outside_view()) {
	
		alarm[0] = 1;
		exit;
	}
	ready = 1;
	alarm[0] = 60;
}

//Otherwise, if the soap bubble is shown. Increment it's size
else if (ready == 1) {

	ready = 2;
	alarm[0] = 30;
}

//Finally, release it
else if (ready == 2) {

	//Create a soap bubble
	instance_create_layer(x + 46, y, "Main", obj_hippo_bubble);
	
	//Generate a new one after 6 seconds
	ready = 0;
	alarm[0] = 360;
}