/// @description Shoot billies if held

if (held)
&& (freeze == false)
&& (instance_exists(obj_mario)) {

    //Play 'Thud' sound
    audio_play_sound(snd_thud, 0, false);
    
    //Repeat
    alarm[0] = 30;
    
    //Create billy
    with (instance_create_depth(x, y+1, 50, obj_billygun_bullet)) {
    
        xspeed = 4*sign(obj_mario.xscale);
        image_xscale = 1*sign(obj_mario.xscale);
    }
}
else
    alarm[0] = 30;
