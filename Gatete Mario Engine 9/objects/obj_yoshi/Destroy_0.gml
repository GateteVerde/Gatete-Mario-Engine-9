/// @description Destroy Yoshi

//Dismount Yoshi
global.mount = 0;

//Stop 'Flying' sound
audio_stop_sound(snd_yoshi_lick);

//Stop 'Flutter' sound
audio_stop_sound(snd_yoshi_hover);

//Destroy Yoshi's tongue if it exists
with (obj_yoshi_tongue) instance_destroy();

//Make both the player and yoshi do stuff
if (instance_exists(obj_mario)) {

    obj_mario.holding = 0;
    obj_mario.visible = 1;
    if (mouthholder != noone)
        event_user(0);
}