/// @description Render me

for (i=1; i<followers; i++;) {

    draw_sprite_ext(spr_fireball, anim, screen_round(oldx[i*closeness]), screen_round(oldy[i*closeness]+4), 1, 1, 0, c_white, 1);
}

//Draw Fire Chomp
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);
