/// @description Split into three

//Play 'Magic' sound
audio_play_sound(snd_magic, 0, false);
    
//Create main chuck
instance_create_depth(x, y, -2, obj_charginchuck);
    
//Create two chucks
with (instance_create_depth(x, y, -2, obj_charginchuck)) {
    
    //Set the jumping sprite
    sprite_index = spr_charginchuck_jump;
    
    //Set the horizontal speed
    xspeed = -1;
        
    //Boost jump
    y--;
        
    //Set the vertical speed
	yspeed = (other.swimming) ? -1 : -4;
}

with (instance_create_depth(x, y, -2, obj_charginchuck)) {

    //Set the jumping sprite
    sprite_index = spr_charginchuck_jump;    
       
    //Set the horizontal speed
    xspeed = 1;
        
    //Boost jump
    y--;
        
    //Set the vertical speed
	yspeed = (other.swimming) ? -1 : -4;
}

//Destroy
instance_destroy();