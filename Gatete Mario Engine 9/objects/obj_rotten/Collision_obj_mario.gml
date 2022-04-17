/// @description Hurt Mario

//If the player is invulnerable
if (instance_exists(obj_invincibility)) {

    //Play 'Kick' sound
    audio_play_sound(snd_kick, 0, false);

    //Get 1000 points
    with (instance_create_depth(x+8, y, -6, obj_score)) 
		value = 1000;
}

//Hurt the player
with (other) event_user(0);

//Turn into a poof of smoke
event_user(0);
