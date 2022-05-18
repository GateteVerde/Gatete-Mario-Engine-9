/// @description Throw spiny

//Play 'Hammer' sound
audio_play_sound(snd_hammer, 0, false);

//Set the frame
image_index = 1;

//Set next throw up
alarm[3] = 60;

//Make Spiny
with (instance_create_depth(x, y-24, -6, obj_lakitu_egg)) {

	//Set the sprite
	sprite_index = spr_spiny_egg;
	
	//Set the vertical speed
    yspeed = -3;
	
	//No bounces
	bounces = -1;
	
	//Set the horizontal speed
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xspeed = -1;
    else
        xspeed = 1;    
}
