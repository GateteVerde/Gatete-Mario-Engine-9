/// @description Handle message display

if (showing == 1) {
	
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
			else {
				
				//Delete sprite
				sprite_delete(snapshot);
		
				//Activate all instances
				instance_activate_all();
		
				//Destroy
				instance_destroy();
			}
		}
	}
}