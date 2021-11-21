/// @description Generate effects or play sounds

//Repeat the process
alarm[1] = post_t;

//Set smoke position
post = !post;

//Generate smoke effect
with (instance_create_depth(x+4+(post*8), y, depth-1, obj_smoke)) sprite_index = spr_smoke_c;

//If the engine is moving, play sounds
if (state == "IN_LINE")
&& (outside_view() == false)
	audio_play_sound(snd_engine, 0, false);