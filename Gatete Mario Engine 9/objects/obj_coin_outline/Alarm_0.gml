/// @description Turn visible

//Do not appear if Mario is overlapping
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0)) {

	alarm[0] = 1;
	exit;
}

//Play 'Coin' sound
audio_play_sound(snd_coin, 0, false);

//Make it visible
visible = true;