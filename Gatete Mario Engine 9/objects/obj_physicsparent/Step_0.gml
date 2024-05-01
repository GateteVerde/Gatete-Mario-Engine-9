/// @description Logic for NPCs

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//NPC Wall & Ceiling
ai_npc_wall(turn_toward);
ai_npc_ceiling(turn_toward_ceiling);

//Handle position when in-ground
if (yspeed >= 0) {

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
	
	//Vspeed capacity
	yspeed = min(4 - (swimming * 2), yspeed);
	
	//Check for any nearby ground collision
	var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
	//If there's ground below and Mario is not moving upwards
	if (semisolid)
	&& (bbox_bottom < semisolid.yprevious + 5)
		y = semisolid.bbox_top - floor(sprite_height-(sprite_get_yoffset(sprite_index)));
}

//Slope Collision
slope_collision();

//Check if there's a semisolid
if ((collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0)) 
&& (!collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom-4, obj_semisolid, 0, 0)))
|| (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_slopeparent, 1, 0)) {
	
	//If moving down
	if (yspeed > 0) {
	
		//If this object cannot bounce
		if (bounces == -1) {
			
			yadd = 0;
		    yspeed = 0;
		}
		
		//Otherwise, if it can bounce
		else if (bounces != -1) {

			bounces--;
			if (bounces == 0) {
			
				yadd = 0;
				yspeed = 0;
			}
			else {
				
				yspeed = -yspeed/2;
				y--;
			}
		}
	}
}

//Otherwise
else {
	
	//Set up gravity
	yadd = (swimming) ? 0.03125 : 0.25;
	
	//If the item can bounce, reset amount of bounces
	if (bounces > -1) {
		
		if (bounces == 0)
		&& (bounces_max > 0)
			bounces = bounces_max;
	}
}
	
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

//Check for a nearby lava object
var lava = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom+8, obj_lava, 1, 0);

//If the NPC makes contact with lava
if (lava) {
	
	//If this object is not a baburu shoe
	if ((object_index != obj_kuriboshoe) && (sprite_index != spr_shoe_baburu)) {
	
		//Play 'Burn' sound
		audio_play_sound(snd_burn, 0, false);
		
		//Go *poof*
		instance_create_depth(round(bbox_left + bbox_right) / 2, lava.y - 8, -6, obj_smoke);
		with (instance_create_depth(round(bbox_left + bbox_right) / 2, lava.y - 8, -6, obj_smoke)) {
			
			sprite_index = spr_splash_lava;
		}
		
		//Destroy
		instance_destroy();
	}	
}
