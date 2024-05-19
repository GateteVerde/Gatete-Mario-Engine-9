/// @function draw_text_shadowed(string, x, y, pw, ph, scroll);
/// @param string
/// @param x
/// @param y
/// @param pw
/// @param ph
/// @param scroll

function draw_text_port() {
	
	var _string, _temp, _xx, _yy, _pw, _ph, _scroll;
	
	_string			= argument[0];
	_xx				= argument[1];
	_yy				= argument[2];
	_pw				= argument[3];
	_ph				= argument[4];
	_scroll			= argument[5];

	//Create the surface
	_temp = surface_create(argument[3], argument[4]);
	
	//If the surface exists
	if (surface_exists(_temp)) {

	    //Set the target
	    surface_set_target(_temp);
    
	    //Clear alpha
	    draw_clear_alpha(c_black, 0);
    
	    //Draw the text
	    draw_text(_scroll, 0, _string);
    
	    //Reset target
	    surface_reset_target();
    
	    //Draw the surface
	    draw_surface(_temp, _xx, _yy);
    
	    //Free the surface
	    surface_free(_temp);
	}
}