/// @description Prepare the text to be displayed

//Set up the font
draw_set_font(global.gui_font);

//Set up the text
text = string(string_make_width(varmsg, 216));

//The text that should display next if it is too long
new_text = "";
	
//Check if the message is too long
event_user(0);

//The text should start displaying now
showing = 1;