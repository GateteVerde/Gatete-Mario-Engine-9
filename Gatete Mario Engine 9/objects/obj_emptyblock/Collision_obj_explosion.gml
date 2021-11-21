/// @description 

//Play 'Break' sound
audio_play_sound(snd_break, 0, false);

//If this is a triple wide block
if (sprite_index == spr_qblock_triple_empty) {

	for (var i=0; i<3; i++) {
	
		shard_create(spr_shard_empty, x + 8 + (i * 16), y + sprite_height / 2, -2, 6, 45);
		shard_create(spr_shard_empty, x + 8 + (i * 16), y + sprite_height / 2, -2, 6, 60);
		shard_create(spr_shard_empty, x + 8 + (i * 16), y + sprite_height / 2, -2, 6, 120);
		shard_create(spr_shard_empty, x + 8 + (i * 16), y + sprite_height / 2, -2, 6, 135);
	}
}
	
//Otherwise, if this is a big block
else if (sprite_index == spr_qblock_big_empty) {
	
	//Create shards
	shard_create(spr_shard_big_empty, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 45);
	shard_create(spr_shard_big_empty, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 60);
	shard_create(spr_shard_big_empty, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 120);
	shard_create(spr_shard_big_empty, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 135);
}

//Otherwise
else {

	//Create shards
	shard_create(spr_shard_empty, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 45);
	shard_create(spr_shard_empty, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 60);
	shard_create(spr_shard_empty, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 120);
	shard_create(spr_shard_empty, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 135);
}
	
//Destroy
instance_destroy();