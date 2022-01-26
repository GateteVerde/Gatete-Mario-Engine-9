/// @description Perform switch events

//Play 'Course Clear' music
audio_play_sound(snd_goalgate_b, 0, false);

//Display message
instance_create_depth(0, 0, -10, obj_message_palace);

//Clear the level
global.clear = 1;

//The switch is pressed
ready = 2;

//Activate Yellow [!] blocks
if (sprite_index == spr_palaceswitch_y)
	global.palace_y = 1;

//Activate Green [!] blocks
else if (sprite_index == spr_palaceswitch_g)
	global.palace_g = 1;
	
//Activate Red [!] blocks
else if (sprite_index == spr_palaceswitch_r)
	global.palace_r = 1;

//Activate Blue [!] blocks
else if (sprite_index == spr_palaceswitch_b)
	global.palace_b = 1;





