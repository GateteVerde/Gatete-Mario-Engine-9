/// @description Break with explosion

for (var i=0; i<3; i++) {

	if (shard_sprite != -1) {
	
		//Play 'Break' sound
		audio_play_sound(snd_break, 0, false);

		//Create shards
		shard_create(shard_sprite, x + 8 + (i * 16), y + sprite_height / 2, -2, 6, 45);
		shard_create(shard_sprite, x + 8 + (i * 16), y + sprite_height / 2, -2, 6, 60);
		shard_create(shard_sprite, x + 8 + (i * 16), y + sprite_height / 2, -2, 6, 120);
		shard_create(shard_sprite, x + 8 + (i * 16), y + sprite_height / 2, -2, 6, 135);
	
		//Destroy
		instance_destroy();
	}
}