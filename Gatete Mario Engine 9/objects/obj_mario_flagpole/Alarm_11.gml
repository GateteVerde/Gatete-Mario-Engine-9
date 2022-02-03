/// @description Go down the flagpole

//Play 'Flagpole' sound
audio_play_sound(snd_flagpole, 0, false);

//Give points
with (flagpole) {

    event_user(0);
    with (instance_create_depth(x+8, y+144, depth-1, obj_flagpole_flag_mario)) 
        vspeed = -1.5;
}

//Move down
vspeed = 1.5;

//Start walking
alarm[0] = 112;