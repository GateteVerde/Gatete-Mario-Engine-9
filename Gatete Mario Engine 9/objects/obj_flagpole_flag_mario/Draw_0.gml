/// @description Render flag

angle += wavespeed;
for (i=0; i<=27/part; i+=1) {
	
	draw_sprite_part_ext(sprite_index, -1, i*part, 0, part, 27, screen_round(x)+(i*part), screen_round(y)-11+(sin(angle+i)), 1, 1, c_white, 1);	
}