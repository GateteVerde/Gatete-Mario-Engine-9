/// @description Set up window size
	
//Set windowed mode
window_set_fullscreen(fullscreen);

//Reset display
display_reset(8, vsync);

//Set up the window
window_set_size(global.gw * size, global.gh * size);

//Set up the display
display_set_gui_size(global.gw * size, global.gh * size);

//Center the window
alarm[1] = 2;