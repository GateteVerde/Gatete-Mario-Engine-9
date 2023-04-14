/// @description Take a screenshot (Saves on AppData folder)

//Find the next screenshot name to save as
while (file_exists(working_directory + "screenshots/screen_" + string(num) + ".png")) {
	
	num++;
}

//Save the screenshot
screen_save(working_directory + "screenshots/screen_" + string(num++) + ".png");