/// @description Replace frame

//If the card has not been picked up yet
if (ready == 0) {
	
	//If the object is outside the view
	if (outside_view() == true) {
	
		image_index = 0;
		alarm[0] = 10;
	}
	
	//Otherwise
	else {

		//Replace it
		alarm[0] = 10;
	
		//Set new frame
		image_index++;
		if (image_index > 2)
			image_index = 0;
	}
}