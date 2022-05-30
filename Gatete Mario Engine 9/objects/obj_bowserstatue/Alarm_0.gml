/// @description Spit Fire

//Play 'Flames' sound
audio_play_sound(snd_flames, 0, false);

//Spit another one
alarm[0] = 240;

//Create fire
with (instance_create_depth(x+(8*sign(xscale)), y, 50, obj_bowserstatue_fire)) {

    hspeed = 2*(other.xscale);
    xscale = other.xscale;
}
