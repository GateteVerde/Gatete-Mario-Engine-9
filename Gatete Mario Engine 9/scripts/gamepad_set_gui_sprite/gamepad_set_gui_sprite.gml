/// @function gamepad_set_gui_sprite();

function gamepad_set_gui_sprite() {

	//Check in what device are you playing
	var temp = os_device;
	
	//Check between all devices
	switch (temp) {
		
		//PS3 / PS4 / PS5
		case (os_ps3):
		case (os_ps4):
		case (os_ps5):
			return spr_gui_global_buttons_ps4; break;
	
		//Nintendo Switch
		case (os_switch):
			return spr_gui_global_buttons_switch; break;
			
		//Default keys
		default:
			return spr_gui_global_buttons_xbox; break;
	}
}