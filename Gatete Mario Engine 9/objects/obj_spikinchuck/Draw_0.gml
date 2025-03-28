/// @description Render me

//Draw the ball
if (ready == 1) {
	
    draw_sprite_ext(spr_spikinchuck_ball, 0, round(x)+13*sign(xscale), y + 1, xscale, 1, 0, c_white, 1);
}

//Inherit the parent event
event_inherited();