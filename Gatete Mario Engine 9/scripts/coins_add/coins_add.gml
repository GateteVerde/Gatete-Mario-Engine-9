// @function coins_add
// @param amount

function coins_add() {

	//Check if the argument exists
	_indexedCoinsVariable = (argument_count > 0) ? argument[0] : 1;
	
	//Increment coins
	global.coins += _indexedCoinsVariable;
	
	//If there's a branch pipe
	with (obj_warpparent) coins += other._indexedCoinsVariable;
	
	//If the coin collection mode is active
	if (global.coins_left > -1)
		global.coins_left -= _indexedCoinsVariable;
}