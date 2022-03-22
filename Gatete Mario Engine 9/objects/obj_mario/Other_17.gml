/// @description Give Mario temporary invincibility

if (invulnerable != -1) {

	//Become invulnerable
	invulnerable = 1;

	//Run a repeating timer and save it to a temporary variable
	_timer = timer(change_alpha, 2, true);

	//Destroy the timer and make the player vulnerable in 2 seconds
	timer(become_vulnerable, 120, false, _timer);
}

//Otherwise, if the timer is still running
else if (invulnerable == 1)
	timer_change(become_vulnerable, 120, false);