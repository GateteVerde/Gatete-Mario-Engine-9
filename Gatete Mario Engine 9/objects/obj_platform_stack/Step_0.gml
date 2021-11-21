/// @description Manage solid position and scale

//Set up solid mask scale
mysolid2.image_yscale = h_pos / 16;
mysolid2.y = bbox_bottom - h_pos - 15;

//Manage height
if (deploy > 0) {

	//If the blocks are being emplaced
	if (deploy == 2) {
	
		h_pos -= 2;
		if (h_pos < 0) {
		
			h_pos = 0;
			deploy = 0;
		}
	}
	
	//If 'h' is greater than 'hpos'
	if (h > h_pos)
		h_pos += 2; //This basically sets up the height of the block
}

//Set frame
if (speed > 0)
	image_index = 1;
else
	image_index = 0;