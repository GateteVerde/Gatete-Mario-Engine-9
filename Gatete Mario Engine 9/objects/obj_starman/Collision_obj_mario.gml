/// @description Make Mario invulnerable

//Play 'Powerup' sound
audio_play_sound(snd_powerup, 0, false);

//Play 'Here I go' sound
audio_play_sound(global.voiceline_hereigo, 0, false);

//If the player is already invincible
if (instance_exists(obj_invincibility)) {

    //Extend the timer on his invincibility
    obj_invincibility.alarm[0] = 720;
    obj_invincibility.alarm[2] = 1;
    
    //Deny invincibility end.
    if (obj_invincibility.alarm[1] > 0)    
        obj_invincibility.alarm[1] = -1;    
}

//Otherwise, if it's not invincible.
else {

    //Create invincibility
    instance_create_layer(0, 0, "Main", obj_invincibility);
}

//Get 1000 points
with (instance_create_depth(x, y, -6, obj_score)) value = 1000;

//Create effect
with (instance_create_depth(x, y+8, -6, obj_blend_ring)) beam = true;

//Destroy
instance_destroy();