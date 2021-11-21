/// @description Destroy on contact with Mario if this one is big

//Check for Mario
var mario = collision_rectangle(bbox_left-6, bbox_top-6, bbox_right+6, bbox_bottom+8, obj_mario, 0, 0);

//If Mario does exist
if (mario) 
&& (global.powerup == cs_mega) {

	//Play 'Break' sound
	audio_play_sound(snd_break, 0, false);

	//Create shards
	shard_create(spr_shard_wood, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 45);
	shard_create(spr_shard_wood, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 60);
	shard_create(spr_shard_wood, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 120);
	shard_create(spr_shard_wood, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 135);
	
	//Destroy
	instance_destroy();	
}
