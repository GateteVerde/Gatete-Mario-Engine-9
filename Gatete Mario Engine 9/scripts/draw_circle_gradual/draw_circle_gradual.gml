/// @function draw_circle_gradual(x, y, radius, glow_distance, inner_colour, outer_colour, inner_alpha, outer_alpha);
/// @param x
/// @param y
/// @param radius
/// @param glow_distance
/// @param inner_colour
/// @param outer_colour
/// @param inner_alpha
/// @param outer_alpha

function draw_circle_gradual() {

	var _x   = argument[0], // X Position
	    _y   = argument[1], // Y Position
	    _r   = argument[2], // Radius
	    _d   = argument[3], // Glow Distance (Outwards)
	    _c1  = argument[4], // Inner Color
	    _c2  = argument[5], // Outer Color
	    _a1  = argument[6], // Inner Alpha
	    _a2  = argument[7], // Outer Alpha
	    _q   = 64,          // Quality (Amount of segments)
	    _dir = 0;           // Direction (For drawing the circle)

	draw_primitive_begin(pr_trianglefan);
	draw_vertex_color(_x,_y, _c1, _a1);

	repeat (_q + 1)
	{
	    draw_vertex_color(_x + lengthdir_x(_r, _dir),_y + lengthdir_y(_r, _dir), _c1, _a1);
	    _dir += 360 / _q;
	}

	draw_primitive_end();

	draw_primitive_begin(pr_trianglestrip);

	repeat (_q + 1)
	{
	    draw_vertex_color(_x + lengthdir_x(_r, _dir),     _y + lengthdir_y(_r, _dir),      _c1, _a1);
	    draw_vertex_color(_x + lengthdir_x(_r + _d, _dir),_y + lengthdir_y(_r + _d, _dir), _c2, _a2);
	    _dir += 360 / _q;
	}

	draw_primitive_end();
}