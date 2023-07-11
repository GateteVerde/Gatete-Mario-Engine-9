/// @description Draw checkpoint and flag

//Keep waving
angle += wavespeed;

//Draw entire checkpoint
draw_sprite(sprite_index, -1, screen_round(x), screen_round(y));
for (i=0; i<=27/part; i+=1) {
	
	//Temp variable
	var temp = (ready == 0) ? 0 : 1 + (global.player);

	//Render flag
	draw_sprite_part(spr_checkpoint_flag, temp, i*part, 0, part, 18, screen_round(x)+8+(i*part), screen_round(y)+8+(sin(angle+i)));
}