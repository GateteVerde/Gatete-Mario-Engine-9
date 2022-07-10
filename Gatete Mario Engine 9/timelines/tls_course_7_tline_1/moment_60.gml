/// @description Create coins and the event block

//Play 'Transform' sound
audio_play_sound(snd_transform, 0, false);

//Create coins
create_coin(864, 240);
create_coin(848, 256);
create_coin(832, 272);
create_coin(848, 272);
create_coin(864, 272);
create_coin(880, 272);
create_coin(896, 272);
create_coin(912, 272);
create_coin(928, 272);
create_coin(848, 288);
create_coin(864, 304);

//Create smoke
instance_create_depth(680, 312, -6, obj_smoke);

//Create block
event = instance_create_depth(672, 304, 0, obj_qblock_event);
with (event)
	tline = tls_course_7_tline_2;