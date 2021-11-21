/// @description Make Mario do stuff when it's animation ends.

//If Mario is walking with the frog suit
if (sprite_index == spr_mario_frog_walk) {

    //Play 'Frog' sound
    audio_play_sound(snd_frog, 0, false);

    //If the horizontal speed is not equal to 0.
    if (xspeed <> 0)
        xspeed = 0;
}

//Otherwise, if Mario is floating with the either the carrot or bee powerup.
else if ((sprite_index == spr_mario_carrot_jump)
|| (sprite_index == spr_mario_bee_jump))
    image_index = 1;
    
//Otherwise, if Mario is sliding inside his shell.
else if (sprite_index == spr_mario_shell_slide)
    image_index = 2;
    
//Otherwise, if Mario is climbing with the cat suit
else if (sprite_index == spr_mario_cat_climb2)
    image_index = 1;
    
//Otherwise, if Mario is swimming with either the frog or penguin powerup.
else if ((sprite_index == spr_mario_frog_swim2) || (sprite_index == spr_mario_penguin_swim2))
|| ((sprite_index == spr_mario_frog_swim3) || (sprite_index == spr_mario_penguin_swim3))
|| ((sprite_index == spr_mario_frog_swim4) || (sprite_index == spr_mario_penguin_swim4)) {

    //Play 'Swim' sound
    audio_stop_sound(snd_swim);
    audio_play_sound(snd_swim, 0, false);
}

//Otherwise, if Mario is dashing while having the football suit
else if (sprite_index == spr_mario_football_run) {

    //Play 'Bump' sound
    audio_stop_sound(snd_bump);
    audio_play_sound(snd_bump, 0, false);
}