/// @description Destroy

//Play 'Break' sound
audio_play_sound(snd_break, 0, false);

//Create shards
shard_create(spr_shard_gray, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 45);
shard_create(spr_shard_gray, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 60);
shard_create(spr_shard_gray, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 120);
shard_create(spr_shard_gray, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 135);
	
//Destroy
instance_destroy();