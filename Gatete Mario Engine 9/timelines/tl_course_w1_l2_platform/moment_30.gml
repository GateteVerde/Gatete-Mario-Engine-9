/// @description Generate items

//Play 'Chest' sound
audio_play_sound(snd_chest, 0, false);

//Create a bouncy mushroom platform
instance_create_depth(2944, 192, depth, obj_platform);

//Generate smoke
var a = 0
repeat (8) {

	with (instance_create_depth(2968, 200, -6, obj_smoke)) motion_set(a, 1);
	with (instance_create_depth(2968, 200, -6, obj_smoke)) motion_set(a + 22.5, 2);
	a += 45;
}