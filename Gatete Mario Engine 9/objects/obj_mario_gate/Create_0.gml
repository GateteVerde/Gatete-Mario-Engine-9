/// @description Mario has cleared the level

//Inherit event from parent
event_inherited();

//Destroy every NPC in position
ai_npc_destroy();

//Clear the level
global.clear = (obj_goalgate.secret_exit == true) ? 2 : 1;

//Stop both music and timer
with (obj_levelcontrol) {

    event_user(0);
    alarm[2] = 0;
}

//Depth
depth = -5;

//Anim
anim = 0;
cape_anim = 0;

//Do not flash
isflashing = 0;

//Set horizontal speed
xspeed = 0.324;

//Forget check points
global.checkpoint = noone;

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

//States
ready = 0;
ready2 = 0;
ready3 = 0;

//Play the clear fanfare
alarm[0] = 70

//Stop the player
alarm[2] = 460;

//Take points off time and add it to score
alarm[3] = 300;

//Whether the object is swimming
swimming = false;

//Create goal fade
instance_create_depth(0, 0, -4, obj_goalgate_fade);