/// @description Render me

//Update cloud animation
cloudanim += 0.1;

//Cloud
draw_sprite_ext(spr_lakitu_cloud, cloudanim, screen_round(x), screen_round(y)+6, 1, 1, 0, c_white, 1);

//Lakitu
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);
