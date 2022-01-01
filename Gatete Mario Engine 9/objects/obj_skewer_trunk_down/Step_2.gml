/// @description Downward skewer logic

//Check for a floor object
var semisolid = collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0);

//If the skewer is not on the ground.
if ((ready == 0) && (gravity > 0)) {
    
    //Check for floor objects
    if ((collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+1, semisolid, 0, 0)) && (semisolid.y > ystart)) {
    
        //Play 'Thud' sound
        audio_play_sound(snd_thud, 0, false);
        
        //Create smoke effects
        instance_create_depth(bbox_left, bbox_bottom, -4, obj_smoke);
        instance_create_depth(bbox_right, bbox_bottom, -4, obj_smoke);
    
        //No gravity
        gravity = 0;
        
        //Is ready
        ready = 1;
        
        //Stop vertical movement if moving down and go up after a bit.
        if (vspeed > 0) {
        
            //Stop vertical movement
            vspeed = 0;
            
            //Go up again
            alarm[3] = 60;
        }
    }
    
    //Otherwise, check if it's long enough to stop it.
    else if (y > parent.y+208) {
    
        //Snap into position
        y = parent.y+208;
        
        //No gravity
        gravity = 0;
        
        //Is ready
        ready = 1;
        
        //Stop vertical movement if moving down and go up after a bit.
        if (vspeed > 0) {
        
            //Stop vertical movement
            vspeed = 0;
            
            //Go up again
            alarm[3] = 60;
        }
    }
	
	//Handle semisolid collisions
    if (semisolid)
    && (semisolid.y > ystart)
    && (bbox_bottom < semisolid.yprevious+5)
        y = semisolid.bbox_top-16;
}

//Otherwise, if the skewer touched the ground and it's ascending.
else if (ready) {

    //If the skewer is above the start position.
    if (y < ystart) {
    
        //Stop vertical movement
        vspeed = 0;
        y = ystart;
        
        //Not ready
        ready = 0;
        
        //Go down
        alarm[0] = 120;
		
		//Reset masher count
		masher.count = 0;
    }
}

//Update masher position
masher.x = round(x);
masher.y = round(y) + 16;

//Cap vertical speed
if (vspeed > 5) then vspeed = 5;

//Hurt Mario if it's overlapping the skewer.
mario = collision_rectangle(bbox_left, parent.y+16, bbox_right, bbox_bottom, obj_mario, 1, 0);
if (mario)
    with (mario) event_user(0);