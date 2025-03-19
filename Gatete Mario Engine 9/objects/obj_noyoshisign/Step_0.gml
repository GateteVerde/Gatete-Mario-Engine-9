/// @description Prevent player from crossing if they are riding a yoshi

var yoshi1 = collision_rectangle(x - 8, 0, x + 8, room_height, obj_yoshi_abandon, 0, 0);
var yoshi2 = collision_rectangle(x - 8, 0, x + 8, room_height, obj_yoshi_runaway, 0, 0);

//If the player is within the sign and it's riding a yoshi
if (instance_exists(obj_mario))
&& (global.mount == 1)
&& (collision_rectangle(x - 8, 0, x + 8, room_height, obj_mario, 0, 0)) {

	//If the sign is pointing to the right
	if (left == false) {
	
		//If the player is at the middle of the sign
		if (obj_mario.x > x + 8) {
		
			obj_mario.x = x + 8;
			if (obj_mario.xspeed > 0)
				obj_mario.xspeed = 0;
		}
	}
	
	//Otherwise, if the sign is pointing to the left
	else if (left == true) {
	
		//If the player is at the middle of the sign
		if (obj_mario.x < x + 8) {
		
			obj_mario.x = x + 8;
			if (obj_mario.xspeed < 0)
				obj_mario.xspeed = 0;
		}
	}
}

//Abandoned Yoshi logic
if (yoshi1) {
	
	//If the sign is pointing to the right
	if (left == false) {
	
		//If Yoshi is at the middle of the sign
		if (yoshi1.x > x + 8) {
		
			yoshi1.x = x + 8;
			if (yoshi1.xspeed > 0)
				yoshi1.xspeed = 0;
		}
	}
	
	//Otherwise, if the sign is pointing to the left
	else if (left == true) {
	
		//If Yoshi is at the middle of the sign
		if (yoshi1.x < x + 8) {
		
			yoshi1.x = x + 8;
			if (yoshi1.xspeed < 0)
				yoshi1.xspeed = 0;
		}		
	}
}

//Runaway Yoshi logic
else if (yoshi2) {
	
	//If the sign is pointing to the right
	if (left == false) {
	
		//If Yoshi is at the middle of the sign
		if (yoshi2.x > x + 8) {
			
			if (yoshi2.xspeed > 0)
				yoshi2.xspeed = -yoshi2.xspeed;
		}
	}
	
	//Otherwise, if the sign is pointing to the left
	else if (left == true) {
	
		//If Yoshi is at the middle of the sign
		if (yoshi2.x < x + 8) {

			if (yoshi2.xspeed < 0)
				yoshi2.xspeed = -yoshi2.xspeed;
		}		
	}
}