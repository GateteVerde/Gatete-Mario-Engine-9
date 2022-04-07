/// @description Give Mario temporary invincibility

if (invulnerable != -1) {
	
	//If not invulnerable
	if (invulnerable == 0) {

		//Become invulnerable
		invulnerable = 1;

		//Run a repeating timer and save it to a temporary variable
		_timer = timer(change_alpha, 1, true);

		//Destroy the timer and make the player vulnerable in 2 seconds
		timer(become_vulnerable, 120, false, _timer);
	}
	
	//Otherwise, if Mario is invulnerabler
	else if (invulnerable == 1)
		timer_change(become_vulnerable, 120);
}
