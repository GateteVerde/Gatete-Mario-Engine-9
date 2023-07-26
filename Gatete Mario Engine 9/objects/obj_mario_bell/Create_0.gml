/// @description The player has cleared a level by touching a bell

//Inherit the parent event
event_inherited();

//Destroy every NPC in position
ai_npc_destroy();

//Turn into 'Fire' Mario if you have the 'Gold' powerup
if (global.powerup == cs_gold) {

	//Set 'Fire' powerup
	global.powerup = cs_fire;
	
	//Repeat 6 times
	repeat (32) {

		with (instance_create_depth(x, y, -2, obj_sparkle)) {
	
			sprite_index = (global.player == 0) ? spr_sparkle_b : spr_sparkle_f;
			shrink_rate = 0.0324;
			motion_set(random(360), random_range(1, 3));			
		}
	}

	//Create ring
	with (instance_create_depth(x + 8, y + 8, -2, obj_blend_ring)) {
		
		//Create ring effect
		var col = (global.player == 0) ? make_colour_rgb(252, 224, 25) : make_colour_rgb(128, 128, 128);
		image_blend = col;
	}
}

//Do not animate
image_speed = 0;

//Anim
anim = 0;
cape_anim = 0;

//Move
ready = 0;

//Take time
ready2 = 0;

//Do not flash
isflashing = 0;

//Forget check points
global.checkpoint = noone;

//Level complete
global.clear = (obj_bell_house.secret_exit == true) ? 2 : 1;

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