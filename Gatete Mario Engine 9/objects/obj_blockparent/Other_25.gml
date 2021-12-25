/// @description Destroy with explosion

if (shard_sprite != -1) {
	
	//Play 'Break' sound
	audio_play_sound(snd_break, 0, false);

	//Create shards
	shard_create(shard_sprite, round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -2, 6, 45);
	shard_create(shard_sprite, round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -2, 6, 60);
	shard_create(shard_sprite, round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -2, 6, 120);
	shard_create(shard_sprite, round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -2, 6, 135);
	
	//Destroy
	instance_destroy();
}