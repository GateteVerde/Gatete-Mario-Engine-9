/// @description Handle message display

//If the message is not showing, make the box grow
if ((showing == 0) && (ready == true)) {

	//Scale up
	scale += 0.1;
	
	//If the scale is greater than 1
	if (scale > 1) {
	
		//Set full scale
		scale = 1;
	
		//Prepare the text to be displayed
		alarm[1] = 1;
	}
}

//If the text is being printed on screen
else if (showing == 1) {
	
	//If the player pressed the 'Action 0' button
	if (input_check_pressed(input.action_0)) {

		//If the text is not fully displayed
		if (a <= string_length(text))	
			a = string_length(text)+1;
	
		//Otherwise, cycle through all text
		else {
		
			//If there's not new text to display
			if (new_text != "") {
			
				//Display more text
				text = new_text;
				new_text = "";
				
				//Check if the message is too long
				event_user(0);
			}
			
			//Otherwise, close message
			else
				showing = 2;
		}
	}
}

//If the message is closing
else if (showing == 2) {

	//Scale down
	scale -= 0.1;
	
	//If the scale is lower than 0.1, destroy
	if (scale < 0.1) {
	
		//Delete sprite
		sprite_delete(snapshot);
		
		//Activate all instances
		instance_activate_all();
		
		//Destroy
		instance_destroy();
	}
}