/// @function input_check_released(enum);
/// @param {_enum} The key enum to check

function input_check_released(_enum) {

	var _gamepad;
	var _keyboard = keyboard_check_released(global.key[argument[0]]);
	
	//If there's a gamepad connected
	if (gamepad_is_connected(0)) {
		
		_gamepad = gamepad_button_check_released(0, global.button[argument[0]]);
		return _gamepad + _keyboard;
	}
	else
		return _keyboard;
}