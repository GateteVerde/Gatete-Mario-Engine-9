/// @description Arrow Platform logic

//Inherit the parent event
event_inherited();

//Check for mario
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If Mario does exist
if (mario)
&& (mario.state < playerstate.jump)
&& (mario.bbox_bottom < yprevious+5) {
	
    //If the platform can change it's direction
    if (ready == 0) {
    
        //Change it
        ready = 1;
        
        //If the block can be changed
        if (type == 0) {
        
            //Play 'Move' sound
            audio_play_sound(snd_move, 0, false);
            
            //Set the default frame
            image_index = 4;
            
            //Change direction
            alarm[2] = 4;
            
            //If the direction was not set
            if (dir == 0) {
            
                if (mario.xscale == -1)
                    dir = 2;
                else
                    dir = 4;
            }
        }
	}
	
	//Destroy if there's a solid right above Mario
	if (collision_rectangle(mario.bbox_left, mario.bbox_top, mario.bbox_right, mario.bbox_top, obj_solid, 0, 0))
		instance_destroy();
}

//Otherwise, allow direction to be changed
else
	ready = 0;