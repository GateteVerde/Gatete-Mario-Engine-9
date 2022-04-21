/// @description Render me

//Draw fireballs if about to spit
if (alarm[0] < 180) 
&& (sprite_index == spr_lavalotus)
    draw_sprite(spr_lavalotus_ball, -1, screen_round(x), screen_round(y)-4);
    
//Draw lava lotus    
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, 1, 1, 0, c_white, 1);
