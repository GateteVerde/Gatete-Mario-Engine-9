/// @description Damage boo

//If the boo is visible
if (ready == 2) {

	//Play 'Kick' sound
	audio_play_sound(snd_kick, 0, false);
	
	//Play 'Hurt' sound
	audio_play_sound(snd_hurt, 0, false);
	
	//Decrement hp
	hp--;
	
	//Set hurt state
	ready = 3;
	alarm[0] = 90;
	
	//Destroy block
	with (other) event_user(0);
}