/// @description Ghost floor logic

//Manage pseudo movement variables
if (freeze == false) then x += xspeed;

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0);

//If Mario does exist
if (mario) {
	
	//If Mario's is inside the pit, make him fall
	if (mario.bbox_left >= bbox_left)
	&& (mario.bbox_right <= bbox_right) {
		
		mario.y++;
		if (mario.state != playerstate.jump)			
			mario.state = playerstate.jump;
	}
}

//Turn on arrows
if (collision_rectangle(x-1, y, x, y+15, obj_right, 0, 0))
    xspeed = 1;
else if (collision_rectangle(x+33, y, x, y+15, obj_left, 0, 0))
    xspeed = -1;
