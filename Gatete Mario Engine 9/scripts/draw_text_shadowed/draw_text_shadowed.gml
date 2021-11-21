/// @function draw_text_shadowed(x,y,string,back_colour,front_colour,back_xoffset,back_yoffset,back_alpha,front_alpha);
/// @param x
/// @param y
/// @param string
/// @param back_colour
/// @param front_colour
/// @param back_xoffset
/// @param back_yoffset
/// @param back_alpha
/// @paran front_alpha

function draw_text_shadowed() {

	var _xx, _yy, _string, _back_colour, _front_colour, _sha_xoffset, _sha_yoffset, _back_alpha, _front_alpha;
	
	_xx				= argument[0];
	_yy				= argument[1];
	_string			= argument[2];
	_back_colour	= argument[3];
	_front_colour	= argument[4];
	_sha_xoffset	= argument[5];
	_sha_yoffset	= argument[6];
	_back_alpha		= argument[7];
	_front_alpha	= argument[8];
	
	draw_text_colour(_xx + _sha_xoffset, _yy + _sha_yoffset, _string, _back_colour, _back_colour, _back_colour, _back_colour, _back_alpha);
	draw_text_colour(_xx, _yy, _string, _front_colour, _front_colour, _front_colour, _front_colour, _front_alpha);
}