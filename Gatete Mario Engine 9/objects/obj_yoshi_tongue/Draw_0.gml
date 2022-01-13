/// @description Render tongue

//Draw eaten item
if (hunger) {

    draw_sprite(foodsprite, foodindex, screen_round(x + 3 + 3 * obj_mario.xscale - foodoffset), screen_round(y) - 4)
}

//Draw tongue parts
draw_sprite_ext(spr_tongue, 1, screen_round(tongue1x+3-3*obj_mario.xscale), screen_round(y), obj_mario.xscale, 1, 0, c_white, 1)
draw_sprite_ext(spr_tongue, 1, screen_round(tongue2x+3-3*obj_mario.xscale), screen_round(y), obj_mario.xscale, 1, 0, c_white, 1)
draw_sprite_ext(spr_tongue, 1, screen_round(tongue3x+3-3*obj_mario.xscale), screen_round(y), obj_mario.xscale, 1, 0, c_white, 1)
draw_sprite_ext(spr_tongue, 1, screen_round(tongue4x+3-3*obj_mario.xscale), screen_round(y), obj_mario.xscale, 1, 0, c_white, 1)
draw_sprite_ext(spr_tongue, 0, screen_round(x+3-3*obj_mario.xscale), screen_round(y), obj_mario.xscale, 1, 0, c_white, 1)