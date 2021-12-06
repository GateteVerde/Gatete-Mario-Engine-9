/// @func shake_camera(intensity, shake_time, fall_off)
/// @param {real} intensity How intense the shake is
/// @param {real} shake_time How long the shake should last in frames
/// @param {bool} falloff Does the shake lose intensity over time?

function shake_camera(intensity, time, falloff) {
	
	if (instance_exists(obj_levelcontrol)) {
		
		obj_levelcontrol.shake_intensity = intensity;
		obj_levelcontrol.shake_time = time;
		obj_levelcontrol.shake_starttime = time;
		obj_levelcontrol.shake_falloff = falloff;
		
	} else {
		
		show_debug_message("ERROR: No camera to shake!");
		
	}

}