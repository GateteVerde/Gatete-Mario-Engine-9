/// @description Venus Fire Trap logic
#region LOGIC

	//If the object is frozen, stop
	if (freeze == true)
	exit;

	//If the piranha plant is coming out
	if (ready == 1) {

		y--;
		if (y < ystart-32) {
	
			//Snap in position
			y = ystart-32;
		
			//Come in
			ready = 2;
			alarm[0] = 120;
			alarm[1] = 30;
		}
	}

	//Otherwise, if the piranha plant is going inside
	else if (ready == 3) {

		y++;
		if (y > ystart) {
		
			//Snap in position
			y = ystart;
	
			//Come out
			ready = 0;
			alarm[0] = 60;
		}
	}
#endregion

//Face towards Mario
if (instance_exists(obj_mario)) {

	//If Mario is above the plant face
	if (obj_mario.y < y) {
	
		//If Mario is at the right
		if (obj_mario.x > x) {
		
			direct = 22.5;
			xscale = 1;
		}
		
		//Otherwise, if Mario is at the left
		else if (obj_mario.x < x) {
		
			direct = 157.5;
			xscale = -1;
		}
	}
	
	//Otherwise, if Mario is below
	else if (obj_mario.y > y) {
	
		//If Mario is at the right
		if (obj_mario.x > x) {
		
			direct = 337.5;
			xscale = 1;
		}
		
		//Otherwise, if Mario is at the left
		else if (obj_mario.x < x) {
		
			direct = 202.5;
			xscale = -1;
		}		
	}
	
	//Switch frame
	if (obj_mario.y < y)
		image_index = (place_meeting(x, y, obj_plantfire)) ? 1 : 0;
	else
		image_index = (place_meeting(x, y, obj_plantfire)) ? 3 : 2;
}
