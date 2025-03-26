/// @description Make Mario interact with the item

if (can_carry()) {		
	
	//Play 'Pull Hard' sound
	audio_play_sound(global.sound_pull_hard, 0, false); 

    //Force player hold
    with (obj_mario) {
    
        holding = 1;
        visible = 0;
    }
    
    //Create puller
    instance_create_depth(other.x, other.y, -5, obj_mario_puller);
    
    //Finish pull
    alarm[0] = 40;
}