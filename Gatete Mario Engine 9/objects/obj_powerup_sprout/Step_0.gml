/// @description Turn into a real item when no solid is overlapping

//If not frozen
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Depth
depth = 50;

//If not overlapping with a solid
if (readytogo == 1)
&& (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 0, 0)) {

    //Create an item
    with (sprite_create_object(sprite_index, x, y, -2)) {
    
        //If moving up
        if (other.yspeed < 0) {
        
            //Make the item bounce
            alarm[10] = 1;
            
            //If the item came from a big block
            if (other.big > 0)
                yspeed = (place_meeting(x, y, obj_swim)) ? -1.5 : -3;
            
            //If the item is a holdable item or the item came out from a big block
            else if (other.bouncy == 1)
                yspeed = (place_meeting(x, y, obj_swim)) ? -1.25 : -2.5;
        }
            
        //Otherwise, stop it
        else {

            y--;
			move_after_landing = 1;
        }
        
        //If the item is underwater, make it swim
        if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0))
            swimming = true;
    }
    
    //Destroy
    instance_destroy();
}