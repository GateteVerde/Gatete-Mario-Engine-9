/// @description Take a screenshot (Saves on AppData folder)

//If the file exists, repeat the event
if (file_exists(working_directory + "screenshots/screen_" + string(num) + ".png")) {
	
	event_perform_object(obj_coordinator, ev_keypress, vk_f9);
	num++;
}
	
//Otherwise, save a screenshot
else {
	
	screen_save(working_directory + "screenshots/screen_" + string(num++) + ".png");
	exit;
}