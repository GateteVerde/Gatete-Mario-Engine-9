/// @description Destroy shoe

//Dismount shoe
global.mount = 0;

//Stop 'Flying' sound
audio_stop_sound(snd_yoshi_fly);

//Destroy movement
with (movement) instance_destroy();

//Make Mario visible and not hold anything
if (instance_exists(obj_mario)) {

    obj_mario.holding = 0;
    obj_mario.visible = 1;
}