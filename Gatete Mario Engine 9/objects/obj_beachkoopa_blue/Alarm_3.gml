/// @description Kick object if it exists

//If object is somehow gone
if (!instance_exists(idd)) {

    //Walk as normal
    alarm[2] = 20;
    xspeed = 0;
    
    //Set funny sprite
    sprite_index = spr_beachkoopa_blue;
    exit;
}

//If no item exists
if (!initem) {

    //If idd is dectected 
    if (idd) {
    
        //Set the kick sprite
        sprite_index = spr_beachkoopa_blue_kick;
        
        //Play 'Kick' sound
        audio_play_sound(snd_kick, 0, false);        
        
        //Kick the special object
        if (idd.object_index == obj_shell) 
		|| (idd.object_index == obj_shell_kicked) {
        
            //Account for the no longer used shell
            oldidd = idd;
            
            //Remove ID 
            idd = noone;
            
            //Set shell parameters
            with (instance_create_depth(oldidd.x, oldidd.y, -2, obj_shell_kicked)) {
            
                xspeed = (1*other.xscale)*(2.7+(abs(other.xspeed)/4));
                sprite_index = other.oldidd.sprite_index;
                koopainside = other.oldidd.koopainside;
                flip = other.oldidd.flip;
            }
            
            //Destroy the shell
            with (oldidd) instance_destroy();
            
        }
        //Otherwise if it's a normal object
        else {
			
			//All events are ran by item
			with (idd) {

			    //If the item is not overlapping a solid.
			    if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 0, 0)) {

			        //Item bounce
			        yspeed = -1;
        
			        //If the object is not on contact with a slope
			        if (!collision_rectangle(x-2, bbox_bottom-4, x-2, bbox_bottom, obj_slopeparent, 1, 0))
			            yspeed = (3*other.xscale);
            
			        //Otherwise, do not apply horizontal speed
			        else
			            xspeed = 0.5*sign(other.xscale);
			    }
			    else
			        inwall = true;
			}
		}
    }
    
    //Go back to normal
    alarm[2] = 15;
    
    //End kick
    alarm[4] = 6;

}
else 
	alarm[3] = 5;