/// @description Break blocks while spinning with the raccoon tail

//If Mario does have either raccoon or tanooki powerup
if (global.powerup == cs_raccoon)
|| (global.powerup == cs_tanooki) {

	//If the spinner has not bumped a block before
	if (other.bump == false) {
	
		//Prevent spinner from breaking more
		other.bump = true;
	
		//Break the block
		event_user(15);
	}
}