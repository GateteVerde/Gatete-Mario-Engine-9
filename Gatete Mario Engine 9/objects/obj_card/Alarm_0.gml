/// @description Checks if a pair is a match.

if (obj_cardmanager.oncard == mycard) {

    //Check out prizes
    switch (mycard) {
    
        //Mushroom
        case (0): { 
        
            //Play 'Correct' sound
            audio_play_sound(snd_correct, 0, false);
        
            //Add 1 mushroom into the inventory
			if (global.inventory[1] < 9) {
				
				global.inventory[1]++;
			}
        } break;
        
        //Fire Flower
        case (1): { 
        
            //Play 'Correct' sound
            audio_play_sound(snd_correct, 0, 0);
        
            //Add 1 fire flower into the inventory
			if (global.inventory[2] < 9) {
				
				global.inventory[2]++;
			}
        } break;
        
        //10 Coins
        case (2): {
        
            //Play 'Correct' sound
            audio_play_sound(snd_correct, 0, false);
            
            //Get 10 coins
            global.coins += 10;
            if (global.coins >= 100) {
            
                //Subtract 100 coins
                global.coins -= 100;
                
                //Get a life
                lives++;
                
                //Play a sound
                if (!audio_is_playing(snd_1up))
                    audio_play_sound(snd_1up, 0, false);
            }
        } break;
        
        //20 Coins
        case (3): {
        
            //Play 'Correct' sound
            audio_play_sound(snd_correct, 0, false);
            
            //Get 10 coins
            global.coins += 20;
            if (global.coins >= 100) {
            
                //Subtract 100 coins
                global.coins -= 100;
                
                //Get a life
                lives++;
                
                //Play a sound
                if (!audio_is_playing(snd_1up))
                    audio_play_sound(snd_1up, 0, false);
            }
        } break;
        
        //Starman
        case (4): { 
        
            //Play 'Correct' sound
            audio_play_sound(snd_correct, 0, 0);
        
            //Add 1 fire flower into the inventory
			if (global.inventory[25] < 9) {
				
				global.inventory[25]++;
			}           
        } break;
                
        //1-UP
        case (5): { 

            //Get a life
            lives++;
            
            //Play a sound
            if (!audio_is_playing(snd_1up))
                audio_play_sound(snd_1up, 0, false);    
        } break;
    }
    
    //Let the game progress
    obj_cardmanager.alarm[0] = 80;
    
    //Stop celebrating
    obj_cardmanager.alarm[1] = 60;
    
    //Celebrate
    obj_cardmanager.alarm[2] = 1;
    
    //Increment the total number of cards flipped.
    obj_cardmanager.count += 2;
}

//Otherwise, if the pair is not a match.
else {

    //Play the wrong sound.
    audio_play_sound(snd_wrong,0,0);

    //Increment the number of wrong choices
    obj_cardmanager.wrong += 1;

    //Flip this card
    alarm[1] = 7;

    //Flip the other card in the pair
    with (obj_cardmanager.lastcard) alarm[1] = 28;

    //Let the game progress
    obj_cardmanager.alarm[0] = 70;
}