/// @func screen_floor(value)
/// @desc Floors value to decimal that matches screen size
/// @param {real} value What to floor to screen
function screen_floor(value) {
	
	if (global.subpixels)
		return floor(value * (1*obj_coordinator.size)) / (1*obj_coordinator.size);
	else
		return floor(value);
}