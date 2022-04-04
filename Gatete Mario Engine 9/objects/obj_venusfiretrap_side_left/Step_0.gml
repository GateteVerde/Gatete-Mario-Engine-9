/// @description Venus Fire Trap logic
#region LOGIC

	//If the object is frozen, stop
	if (freeze == true)
	exit;

	//If the piranha plant is coming out
	if (ready == 1) {

		x--;
		if (x < xstart-32) {
	
			//Snap in position
			x = xstart-32;
		
			//Come in
			ready = 2;
			alarm[0] = 120;
			alarm[1] = 30;
		}
	}

	//Otherwise, if the piranha plant is going inside
	else if (ready == 3) {

		x++;
		if (x > xstart) {
		
			//Snap in position
			x = xstart;
	
			//Come out
			ready = 0;
			alarm[0] = 60;
		}
	}
#endregion

//Face towards Mario
if (instance_exists(obj_mario)) {

	//If Mario is above the plant face
	if (obj_mario.y <= y) 
		direct = 157.5;
	
	//Otherwise, if Mario is below
	else if (obj_mario.y > y)
		direct = 202.5;
	
	//Switch frame
	if (obj_mario.y <= y)
		image_index = (place_meeting(x, y, obj_plantfire)) ? 1 : 0;
	else
		image_index = (place_meeting(x, y, obj_plantfire)) ? 3 : 2;
}
