/// @description Break blocks while scratching with the cat powerup

//If Mario does have the cape feather
if (global.powerup == cs_bell) {

	//If the spinner has not bumped a block before
	if (other.bump == false) {
	
		//Prevent spinner from breaking more
		other.bump = true;
	
		//Break the block
		event_user(15);
	}
}