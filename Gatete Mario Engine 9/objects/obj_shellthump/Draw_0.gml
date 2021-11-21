/// @description Draw full effect

//Stars
draw_sprite(spr_shellthump_st, star, x-star, y-star+8);
draw_sprite(spr_shellthump_st, star, x+star, y-star+8);
draw_sprite(spr_shellthump_st, star, x-star, y+star+8);
draw_sprite(spr_shellthump_st, star, x+star, y+star+8);

//Thump
draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 0, c_white, alpha);