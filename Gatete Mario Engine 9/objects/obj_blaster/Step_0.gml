/// @description Destroy on contact with Mario if this one is big

//Check for Mario
var mario = collision_rectangle(bbox_left-6, bbox_top-6, bbox_right+6, bbox_bottom+8, obj_mario, 0, 0);

//If Mario does exist
if (mario) 
&& (global.powerup == cs_mega) {

	//Play 'Destroy' sound
	audio_play_sound(snd_destroy, 0, false);
	
	//Create shards
	for (var i=0; i<image_yscale; i++) {
	
		//Create dead object
		imdead = instance_create_depth(x, y + (16 * i), -6, obj_enemy_dead)
		
		//Hereby sprite
		imdead.sprite_index = sprite_index;

		//Hereby frame
		imdead.image_index = (i < 2) ? i : 2;

		//Hereby facing direction
		imdead.image_xscale = 1;
		
		//Hereby horizontal
		imdead.hspeed = mario.xspeed;
	}
	
	//Destroy
	instance_destroy();	
}
