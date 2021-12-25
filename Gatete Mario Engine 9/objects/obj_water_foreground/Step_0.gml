/// @description Tide logic

//Update xx
xx += push;

//If the water is changing it's position.
if (vspeed != 0) {

    //If the water collides with a 'End' modifier.
    if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_endmarker, 0, 1)) {
    
        //Stop moving
        vspeed = 0;
        
        //Snap in grid
        move_snap(16,16);
        
        //Repeat again
        alarm[0] = 360;
    }
}

//Update water position
water.y = y + 4;

//Check for Mario
var mario = collision_rectangle(water.bbox_left, water.bbox_top, water.bbox_right, water.bbox_bottom, obj_mario, 0, 1);

//If Mario is overlapping this object and it's swimming.
if (mario)
&& (mario.swimming == true)
&& (global.powerup != cs_frog)
&& (global.powerup != cs_penguin)
&& (instance_number(obj_mario_transform) < 1) {

    //If this object can push to the right
    if (push == 1) {
		
        if (!collision_rectangle(mario.bbox_right, mario.bbox_top+4, mario.bbox_right+1, mario.bbox_bottom-1, obj_solid, 1, 1))
            mario.x += 0.3;
	}
	
	//Otherwise, if this object can push to the left
	else if (push == -1) {
	
        if (!collision_rectangle(mario.bbox_left-1, mario.bbox_top+4, mario.bbox_left, mario.bbox_bottom-1, obj_solid, 1, 1))
            mario.x -= 0.3;		
	}
}