/// @description Reverse moment or break

if (global.powerup > cs_small) {

	//Play 'Break' sound
	audio_play_sound(snd_break, 0, false);
	
	//Get 10 points
	score += 10;
	
	//Create shards
	shard_create(shard_sprite, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 45);
	shard_create(shard_sprite, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 60);
	shard_create(shard_sprite, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 120);
	shard_create(shard_sprite, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 135);
	
	//Destroy
	instance_destroy();
}

//Inherit event from parent
event_inherited();