/// @description Set offset

//If not beaten
if (beaten == 0) {

	//If moving right
	if (xscale == 1) {

		offset += 0.5;
		if (offset > 8) {
	
			offset = 8;
			xscale = -1;
		}
	}

	//Otherwise, if moving left
	else if (xscale == -1) {

		offset -= 0.5;
		if (offset < -8) {
	
			offset = -8;
			xscale = 1;
		}
	}
}