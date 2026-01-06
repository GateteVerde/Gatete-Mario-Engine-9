/// @function is_desktop()

function is_desktop(){

	//If the game is played on desktop
	if (os_type == os_windows)
	|| (os_type == os_linux)
	|| (os_type == os_macosx)
		return true;

	//Otherwise
	else
		return false;
}