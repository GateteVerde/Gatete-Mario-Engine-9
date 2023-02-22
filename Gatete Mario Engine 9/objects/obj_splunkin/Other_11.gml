/// @description Custom Stomp script

//If this enemy has not been stomped yet
if (ready == 0) {

	//Set the sprite
	sprite_index = spr_splunkin_b;
	
	//Play 'Break' sound
	audio_play_sound(snd_break, 0, false);

	//Create shards
	shard_create(spr_shard_area_y, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 45);
	shard_create(spr_shard_area_y, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 60);
	shard_create(spr_shard_area_y, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 120);
	shard_create(spr_shard_area_y, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 135);
	
	//Double horizontal speed
	xspeed = xspeed*2;
	
	//Set state
	ready = 1;
}

//Otherwise if this enemy has been stomped once, turn into a pancake
else if (ready == 1) {
	
	//Play 'Break' sound
	audio_play_sound(snd_break, 0, false);

	//Create shards
	shard_create(spr_shard_area_r, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 45);
	shard_create(spr_shard_area_r, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 60);
	shard_create(spr_shard_area_r, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 120);
	shard_create(spr_shard_area_r, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 135);
	
	//Destroy
	instance_destroy();
}