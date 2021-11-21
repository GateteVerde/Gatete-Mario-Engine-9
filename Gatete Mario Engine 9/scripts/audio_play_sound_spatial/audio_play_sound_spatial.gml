/// @function audio_play_sound_spatial(soundid, priority, loops, sound_x, sound_y)
/// @param {sound} soundid The index of the sound to play.
/// @param {real} priority Set the channel priority for the sound.
/// @param {bool} loops Flags the sound as looping or not.
/// @param {real} sound_x The X position for the sound to play
/// @param {real} sound_y The Y position for the sound to play

function audio_play_sound_spatial(soundid, priority, loops, sound_x, sound_y) {
	
	//Position variables on-screen
	var view_x = camera_get_view_x(view_camera[0]);
	var view_w = camera_get_view_width(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[0]);
	var view_h = camera_get_view_height(view_camera[0]);

	//Play sound
	audio_play_sound_at(soundid, view_x + (view_w / 2 ) -sound_x, view_y + (view_h / 2) - sound_y, 0, view_w * 2, 100, 1, loops, priority);	
}