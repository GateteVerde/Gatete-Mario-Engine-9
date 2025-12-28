/// @description Boomerang hurt script

//Exit if the boom-boom is on the defeat state
if (sprite_index == spr_boomboom_defeat) {

	with (other) event_user(0);
	exit;
}

//If the enemy is vulnerable to projectiles
if (vulnerable < 2) {

    //Play 'Kick' sound
    audio_play_sound(snd_kick, 0, false);
    
    //Create 'Spinthump' effect
    with (instance_create_depth(round(bbox_left+bbox_right)/2, round(bbox_top+bbox_bottom)/2-8, -6, obj_smoke)) sprite_index = spr_spinthump;
    
    //Decrement hits
    firehp--;
    
    //If there's no more fire hits left
    if (firehp == 0) {
		
		//Set vulnerability
		vulnerable = 100;
    
        //Force set hits
        hp = 1;
        
        //Default hurt script
        event_user(1);
    }
    
    //Otherwise, become invulnerable for a bit.
    else {

        vulnerable = 99;
        inv = 4;
    }
}