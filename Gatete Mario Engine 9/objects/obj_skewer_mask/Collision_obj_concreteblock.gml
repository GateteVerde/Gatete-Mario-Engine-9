/// @description Destroy only 4 blocks per round

if (parent.gravity > 0) {
	
	if (count < 4) {

		count++;
		with (other) event_user(15);
	}
}