/// @description Held blue boomerang logic

//If the object is being held.
if (held) {

    //If the control key is being pressed and the vegetable can be thrown.
    if (input_check_pressed(input.action_1)) {
    
        //If Mario does exist
        if (instance_exists(obj_mario)) {
        
            //Play 'Throw' sound
            audio_play_sound(snd_throw, 0, false);
            
            //With Mario
            with (obj_mario) {
				
				holding = 0;
				kicking = 1;
				timer(kicking_end, 10, false);
			}
            
            //Create a thrown boomerang
            with (instance_create_depth(x, y-8, -4, obj_boomerang)) {
            
				sprite_index = spr_boomerang_blue;
                canpick = 1;
                hspeed = 2 * sign(obj_mario.xscale);
            }
            
            //Destroy
            instance_destroy();
        }
    }
}