/// @description Move towards Mario

//If the koopa can move
if (ready > 0) {

    //Inherit event
    event_inherited();

    //Jump if stun
    if (sprite_index == spr_beachkoopa_red) {
    
        //Set walking sprite
        sprite_index = spr_beachkoopa_red_walk;
        
        //Boost jump
		yspeed = (swimming) ? -0.625 : -2.5;
        y--;
    }
}