/// @description Toad teaching Mario how to play the minigame

//Fade in
instance_create_depth(0, 0, -99, obj_fade_out);

//Create HUD
instance_create_layer(0, 0, "GUI", obj_hud);

//Do not animate
image_speed = 0;
image_index = 0;

//Display message
alarm[0] = 60;

//Play 'Minigame' music
alarm[1] = 2;

//Whether Toad is done explaining the rules
ready = 0;

//Set message based on minigame chosen
switch (global.minigame) {

	//N-Spade Minigame
	case (0): {
	
		varmsg = "Flip over any two cards and see if they match. Miss twice and you're out!";
	} break;
	
	//Picture Minigame
	case (1): {
	
		varmsg = "Line up the pictures and get a prize!. You only get one try.";
	} break;
	
	//Digging Minigame
	case (2): {
	
		varmsg = "Dig! Dig! Dig! into your hearts content and try to get the chest. You only get one try.";
	} break;
}