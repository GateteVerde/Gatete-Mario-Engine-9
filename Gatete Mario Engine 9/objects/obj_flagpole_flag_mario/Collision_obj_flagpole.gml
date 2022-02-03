/// @description Keep the flag in sight

//Make sure it does not go past the player
if (vspeed < 0)
&& (y < other.y+other.limit) {

    //Stop 'Flagpole' sound
    audio_stop_sound(snd_flagpole);
    
    //Stop moving
    vspeed = 0;

    //Snap to the player initial position
    y = other.y+other.limit;
}