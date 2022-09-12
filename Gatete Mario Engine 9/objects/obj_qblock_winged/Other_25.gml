/// @description Destroy

//Play 'Break' sound
audio_play_sound(snd_break, 0, false);

//Create shards
shard_create(spr_shard_area_r, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 45);
shard_create(spr_shard_area_r, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 60);
shard_create(spr_shard_area_r, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 120);
shard_create(spr_shard_area_r, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 135);

//Create 'Feathers' effect
with (instance_create_depth(x + 8, y, -6, obj_smoke)) sprite_index = spr_feathers;
	
//Destroy
instance_destroy();