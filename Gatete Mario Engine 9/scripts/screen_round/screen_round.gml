/**
 * Pass-through functions to allow more seamless rounding to screen,
 * keeps subpixels from going on an incorrect value and causing screen
 * tearing, etc.
**/

/// @func screen_round(value)
/// @desc Rounds value to decimal that matches screen size
/// @param {real} value What to round to screen
function screen_round(value) {
	
	if (global.subpixels)
		return round(value * (1*obj_coordinator.size)) / (1*obj_coordinator.size);
	else
		return round(value);
}

/// @func screen_floor(value)
/// @desc Floors value to decimal that matches screen size
/// @param {real} value What to floor to screen
function screen_floor(value) {
	
	if (global.subpixels)
		return floor(value * (1*obj_coordinator.size)) / (1*obj_coordinator.size);
	else
		return floor(value);
}

/// @func screen_ceil(value)
/// @desc Ceils value to decimal that matches screen size
/// @param {real} value What to ceil to screen
function screen_ceil(value) {
	
	if (global.subpixels)
		return ceil(value * (1*obj_coordinator.size)) / (1*obj_coordinator.size);
	else
		return ceil(value);
}