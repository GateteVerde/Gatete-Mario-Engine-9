/// @func screen_round(value)
/// @desc Rounds value to decimal that matches screen size
/// @param {real} value What to round to screen

function screen_round(value) {
	
	if (global.subpixels)
		return round(value * obj_coordinator.size) / obj_coordinator.size;
	return round(value);
}