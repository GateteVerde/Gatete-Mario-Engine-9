/// @description Mario entering a hawk mouth

//Hawk ID
myhawk = -1;

//Play 'Hawkmouth Clear' fanfare
audio_play_sound(snd_hawksong_clear, 0, false);

//Turn into 'Fire' Mario if you have the 'Gold' powerup
if (global.powerup == cs_gold) {

	//Set 'Fire' powerup
	global.powerup = cs_fire;
	
	//Repeat 6 times
	repeat (32) {

		with (instance_create_depth(x, y, -2, obj_sparkle)) {
	
			sprite_index = spr_sparkle_b;
			shrink_rate = 0.0324;
			motion_set(random(360), random_range(1, 3));			
		}
	}

	//Create ring
	with (instance_create_depth(x + 8, y + 8, -2, obj_blend_ring)) 
		image_blend = make_colour_rgb(248, 216, 0);
}

//Do not animate
image_speed = 0.15;

//Use walk sprite
sprite_index = global.walk_sprite[global.powerup];

//Stop both music and timer
with (obj_levelcontrol) {

    event_user(0);
    alarm[2] = 0;
}

//Clear the level
global.clear = 1;

//Anim
anim = 0
cape_anim = 0;

//Do not flush
isflashing = 0;

//Forget checkpoints
global.checkpoint = noone;

//Do not bring kuribo shoes outside
if (global.mount == 2) {

    //Play 'Power Lost' sound
    audio_play_sound(snd_powerlost, 0, false);
    
    //Forget it
    global.mount = 0;
    
    //With the shoe
    with (obj_kuriboshoe) {
    
        //Create flying shoe
        with (instance_create_depth(x, y, -6, obj_kuriboshoe_lost)) {
        
            sprite_index = other.sprite_index;
            image_xscale = -1;
            hspeed = -1;
        }
        
        //Destroy
        instance_destroy();
    }
}

//Whether the player entered completely on the mouth
ready = 0;

//Allows to return to the map
ready2 = 0;
ready3 = 0;