/// @description Restart up animation and destroy if the trampoline can't be used anymore

if (sprite_index == spr_trampoline) {

    //If the trampoline is about to launch the player upwards.
    if (ready2 == 1) {
    
        //If the player does exist.
        if (instance_exists(obj_mario)) {
        
            //Play 'Trampoline' sound.
            audio_play_sound(snd_trampoline, 0, false);
			
			//If Yoshi exists, force end flutter
			if (instance_exists(obj_yoshi)) {

				if (obj_yoshi.flutter > 0)
					obj_yoshi.flutter = 0;
			}
            
            //Set the player vertical speed
            obj_mario.yspeed = -5.425;
            
            //Boost Jump
            obj_mario.y--;
            
            //Check if 'Shift' is pressed.
            if (input_check(input.action_0))
                obj_mario.jumping = 1;
            else
                obj_mario.jumping = 2;
        }
    }
	
	#region MANGE USAGE
	
		//If the trampoline can be used more times, change animation
		if (max_uses > 1) {
			
			//Decrement uses
			max_uses--;
    
		    //Allow use
		    ready = 0;
		    alarm[0] = 8;
    
		    //Restart animation
		    image_speed = 1;
		    image_index = 0;
    
		    //Set the end sprite
		    sprite_index = spr_trampoline_end;
		}
		
		//Otherwise
		else if (max_uses == 1) {
		
			instance_create_depth(x, y+8, -6, obj_smoke);
			instance_destroy();
			exit;
		}
	
	#endregion
}
else if (sprite_index == spr_trampoline_end) {

    //Do not animate
    image_speed = 0;
    image_index = 0;
    
    //Set the sprite
    sprite_index = spr_trampoline;
}