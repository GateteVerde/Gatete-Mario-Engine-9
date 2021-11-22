/// @description Logic for NPCs

//Handle psuedo movement
x += xspeed;
y += yspeed;
yspeed += yadd;

//NPC Wall & Ceiling
ai_npc_wall(turn_toward);
ai_npc_ceiling(turn_toward_ceiling);

//Check if there's a collision below and if NPC is on the ground, and stop gravity if so.
if ((collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0))
|| (collision_rectangle(x-1, bbox_bottom+1, x+1, bbox_bottom+1, obj_slopeparent, 1, 0)))
	yadd = 0;

//Otherwise
else {
	
	//Fall and reset bounces to whatever value depending on vertical acceleration caused by gravity
	bounces = min(bouncy, bounces + sign(yspeed > bounces+1));
	
	//Set up gravity
	if (swimming)
		yadd = 0.025;
	else
		yadd = 0.2; 
}

//Handle position when in-ground
if (yspeed >= 0) {
	
	//Conveyor collisions
	#region CONVEYOR COLLISION
	
		//Check for a conveyor
		var conveyor = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_conveyorparent, 0, 0);
		
		//If there's a conveyor
		if (conveyor)
		&& (conveyor.image_speed != 0) {
		
			//If the conveyor is moving and there's not solid on the way
			if ((conveyor.image_speed < 0) && (!collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom-1, obj_solid, 0, 0)))
			|| ((conveyor.image_speed > 0) && (!collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom-1, obj_solid, 0, 0)))
				x += conveyor.image_speed;
		}
	#endregion
	
	//Check for any nearby ground collision
	var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
	//If there's ground below and Mario is not moving upwards
	if (semisolid)
	&& (bbox_bottom < semisolid.yprevious + 5)
	&& (!collision_rectangle(x-1, bbox_bottom, x+1, bbox_bottom+4, obj_slopeparent, 1, 0)) {
		
		//Snap above the semisolid
		y = semisolid.bbox_top - floor(sprite_height-(sprite_get_yoffset(sprite_index)));
	
		//Stop vertical movement
		yadd = 0;
		
		//Bounce
		bounces = (max(0, bounces - 1));
		
		//Set vertical speed
		if (bounces < 2)
			yspeed = -0.6 * bounces;
		else
			yspeed = -yspeed / bouncy;
	}
}

//Embed into the slope to ensure correct slope mechanics
if (collision_rectangle(x-1, bbox_bottom, x+1, bbox_bottom+4, obj_slopeparent, 1, 0))
&& (!collision_rectangle(x-1, bbox_bottom-4, x+1, bbox_bottom-4, obj_slopeparent, 1, 0))
&& (yspeed == 0)
    y += 4;

///Handle slope collisions
if (collision_rectangle(x-1, bbox_bottom-4, x+1, bbox_bottom, obj_slopeparent, 1, 0))
&& (!collision_rectangle(x-1, bbox_bottom-8, x+1, bbox_bottom-8, obj_slopeparent, 1, 0)) {

	//If Mario is moving down onto a slope
	if (yspeed >= 0) {

	    //Stop vertical movement
	    yadd = 0;
		
		//Bounce
		bounces = (max(0, bounces - 1));
		
		//Set vertical speed
		if (bounces < 2)
			yspeed = -0.6 * bounces;
		else
			yspeed = -yspeed / bouncy;
	}

	//Prevent NPC from getting embed inside a slope
	if (yspeed > -0.85)
	    while (collision_rectangle(x-1, bbox_bottom-4, x+1, bbox_bottom, obj_slopeparent, 1, 0))
	        y--;
}

//Vspeed capacity
yspeed = min(4 - (swimming * 2), yspeed);

//Check for a nearby swimming surface
var water = collision_rectangle(bbox_left, y-1, bbox_right, y, obj_swim, 1, 0);
    
//If the NPC is not swimming and makes contact with a water surface
if ((noswim == false) && (!swimming) && (water)) {
        
    //Make the NPC swim.
    swimming = true;
	
    //Stop most horizontal movement
    xspeed = xspeed/2;
                
    //Stop vertical movement
    if (yspeed > 0)
        yspeed = 0;
}

//Otherwise, if there's no contact with water
else if ((swimming) && (!water)) {

	//Make the NPC not swim
	swimming = false;
	
	//Double horizontal speed
	xspeed = xspeed*2;
}