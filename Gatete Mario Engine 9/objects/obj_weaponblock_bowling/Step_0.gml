/// @description Break when approaching while under the effect of the P-Wing

//Inherit the parent event
event_inherited();

//Check for a bowling ball
var bowl = collision_rectangle(bbox_left - 4, bbox_top, bbox_right + 4, bbox_bottom, obj_bowlinchuck_ball, 1, 0)

//If there's a lightning bolt in position
if (bowl) {
	
	//Play 'Bowl' sound
	audio_play_sound(snd_bowl, 0, false);

	//Create shards
	shard_create(spr_shard_gray, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 45);
	shard_create(spr_shard_gray, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 60);
	shard_create(spr_shard_gray, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 120);
	shard_create(spr_shard_gray, x + sprite_width / 2, y + sprite_height / 2, -2, 6, 135);
	
	//Destroy
	instance_destroy();
}