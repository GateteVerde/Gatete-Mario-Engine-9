///@description Create Mushroom

//Play 'Magic' sound
audio_play_sound(snd_magic, 0, false);

//Create a mushroom
instance_create_layer(x + 32, y, "Main", obj_mushroom);

//Create a smoke effect
instance_create_depth(x + 32, y + 8, -6, obj_smoke);

//Create a new toad
with (instance_create_layer(x, y, "Main", obj_npc)) {
	
	varmsg = "Don't be so greedy...";
	mugshot = spr_gui_mugshot_toad;
	char_name = "Toad";
	mute_sound = true;
}

//Destroy this toad
instance_destroy();