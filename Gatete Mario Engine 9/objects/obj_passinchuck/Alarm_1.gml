/// @description Kick the ball

//Play 'Kick' sound
audio_play_sound(snd_kick, 0, false);
    
//Set kicking frame
image_speed = 0;
image_index = 1;
alarm[2] = 30;
    
//Do not show ball
ready = 2;
    
//Kick another one
alarm[0] = 90;
    
//Generate kick effect
with (instance_create_depth(x+18*sign(xscale), y+8, -4, obj_smoke)) sprite_index = spr_spinthump;
    
//Generate a ball
with (instance_create_depth(x+18*sign(xscale), y, -2, obj_passinchuck_football)) {
    
    xspeed = 1.5*sign(other.xscale);
	yspeed = -2;
    y--;
}