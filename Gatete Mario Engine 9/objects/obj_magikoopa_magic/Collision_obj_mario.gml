/// @description Hurt Mario or make it bounce

if (other.yspeed > 0)
&& (other.bbox_bottom < yprevious+5) {

	//Play 'Stomp' sound
	audio_play_sound(snd_stomp, 0, false);
	
	//Bounce
	with (other) event_user(1);
	
	//Create a effect
	with (instance_create_depth(other.x, other.bbox_bottom, other.depth + 1, obj_smoke))
        sprite_index = spr_spinthump;
}
else
	with (other) event_user(0);
