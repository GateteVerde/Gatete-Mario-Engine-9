/// @func screen_ceil(value)
/// @desc Ceils value to decimal that matches screen size
/// @param {real} value What to ceil to screen

function screen_ceil(value) {
	
	if (global.subpixels)
		return ceil(value * obj_coordinator.size) / obj_coordinator.size;
	else
		return ceil(value);
}