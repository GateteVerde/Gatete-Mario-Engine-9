/// @description Manage credits sequence

//Draw the curtain
if (ready == 0) {

	curtain_yy += 2;
	if (curtain_yy > 240) {
	
		curtain_yy = 240;
		ready = 1;
	}
}

//Draw first the background
else if (ready == 1) {

    alpha += 0.025;
    if (alpha > 1) {
    
        alpha = 1;
        ready = 2;
        alarm[2] = 240;
    }
}
else if (ready == 3) {

    wait_time -= 0.025;
    if (wait_time < 0) {
    
        wait_time = 0;
        ready = 4;
    }
}

//Update yy
else if (ready == 4) {
	
	//Make "Front Tileset" layer visible
	layer_set_visible("Tileset_Front", true);
	
	//Scroll through text
    yy += (input_check(input.action_0)) ? 1 : 0.25;
	
	//If the whole text scrolled through, show "The End" prompt
    if (yy > string_height(text) + global.gh)
		ready = 5;
}

//Move curtain down
else if (ready == 5) {
	
	//Make "Front Tileset" layer not visible
	layer_set_visible("Tileset_Front", false);

	curtain_yy--;
	if (curtain_yy < 0) {
	
		curtain_yy = 0;
		ready = 6;
	}		
}

//Fade in 'The End' text
else if (ready == 6) {

    alpha2 += 0.025;
    if (alpha2 > 1) {
        
        alpha2 = 1;
        ready = 7;
        alarm[3] = 30;
    }
}