/// @description Get card ID and play music

//If the first card is not available
if (global.card[0] == -1) {

	//Set music
	stream = snd_cardsong;
	audio_play_sound(stream, 0, false);
	
	//Set Card A
	global.card[0] = image_index;
}

//Otherwise, if the first card is set and the second one is not
else if (global.card[0] != -1) && (global.card[1] == -1) {

	//Set music
	stream = snd_cardsong;
	audio_play_sound(stream, 0, false);
	
	//Set Card B
	global.card[1] = image_index;	
}

//Otherwise, if the first card is set and the second one is not
else if (global.card[0] != -1) && (global.card[1] != -1) && (global.card[2] == -1) {

	//Set Card C
	global.card[2] = image_index;
	
	//If cards B and C are equal to card A
	if (global.card[1] == global.card[0])
	&& (global.card[2] == global.card[0]) {
		
		//Set the stream
		stream = snd_cardsong_match;
		audio_play_sound(stream, 0, false);
	
		//3 Mushrooms
		if (global.card[0] == 0) {
			
			//Card type
			cardtype = 1;
			
			//Give extra lives
			alarm[1] = 120;
		}
		
		//3 Fire Flowers
		else if (global.card[0] == 1) {
		
			//Card type
			cardtype = 2;
			
			//Give extra lives
			alarm[1] = 120;
		}
		
		//3 Stars
		else if (global.card[0] == 2) {
		
			//Card type
			cardtype = 3;
			
			//Give extra lives
			alarm[1] = 120;
		}
	}
	
	//Otherwise
	else {
	
		stream = snd_cardsong_nomatch;
		audio_play_sound(stream, 0, false);
		
		//Set card type
		cardtype = 0;
		
		//Give extra lives
		alarm[1] = 120;
	}
}