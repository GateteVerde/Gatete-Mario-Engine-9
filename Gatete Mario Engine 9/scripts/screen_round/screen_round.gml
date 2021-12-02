/// @func screen_round(value)
/// @desc Rounds value to decimal that matches screen size
/// @param {real} value What to round to screen
function screen_round(value) {
	
	if (global.subpixels)
		return round(value * (1*obj_coordinator.size)) / (1*obj_coordinator.size);
	else
		return round(value);
}