/// @description Prepare to spit fireballs

//Set the sprite
sprite_index = spr_nipper_jump;

//Set fireballs
if (fires == 0) {

    fires = prevfires;
    prevfires = 0;
}

//Spit them
alarm[1] = 6;
