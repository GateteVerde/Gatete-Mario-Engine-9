/// @description Unleash the laser

//Play 'Zappakoopa / Fire' sound
audio_play_sound(snd_zappakoopa_fire, 0, false);

//Create the item
mylaser = instance_create_depth(x+8*sign(xscale), y+8, -2, obj_zappakoopa_laser);
mylaser.parent = id;
laser_ex = 1;
