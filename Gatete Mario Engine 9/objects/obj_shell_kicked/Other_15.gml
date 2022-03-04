/// @description Check for 1 block gaps and destroy blocks on the way

//Slowdown if nearby a 1 block gap.
if ((collision_rectangle(bbox_left-4, bbox_top+4, bbox_left, bbox_bottom+4, obj_solid, 0, 0)) && (xspeed < 0))
|| ((collision_rectangle(bbox_right, bbox_top+4, bbox_right+4, bbox_bottom+4, obj_solid, 0, 0)) && (xspeed > 0)) {

    if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+4, obj_semisolid, 0, 0))
    && (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+4, obj_slopeparent, 1, 0)) {
    
        //Move 4 pixels downwards.
        if (check == false) {
        
            y += 4;
            check = true;
        }
    }
    
    //Make the shell able to enter on small gaps.
    else 
        check = false;
}

//Make the shell able to enter on small gaps
else {
	
    check = false;
}
    
//Check for blocks to the left
var block_l = collision_rectangle(bbox_left-9-hspeed, bbox_top, bbox_left, bbox_bottom, obj_solid, 0, 0);
if (block_l)
&& (xspeed < 0)
&& (sprite_height > 16)
&& (block_l.sprite_height < 17)
    with (block_l) event_user(15);

//Check for blocks to the right    
var block_r = collision_rectangle(bbox_right, bbox_top, bbox_right+9+hspeed, bbox_bottom, obj_solid, 0, 0);
if (block_r)
&& (xspeed > 0)
&& (sprite_height > 16)
&& (block_r.sprite_height < 17)
    with (block_r) event_user(15);