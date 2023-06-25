/// @description Checks if a pair is a match.

if (obj_cardmanager.oncard == mycard) {

    //Check out prizes
    switch (mycard) {
    
        //Mushroom
        case (0): {
        
            //Play 'Correct' sound
            audio_play_sound(snd_correct, 0, false);
        
            //If the inventory is not full, increment size
		    if (global.inventory[0] < 15) {
		
		        global.inventory[0]++;
			}
			
			//Add a mushroom or a leaf to the inventory
			global.inventory[global.inventory[0]] = (global.hp_mode) ? sprite_get_macro(spr_leaf) : sprite_get_macro(spr_mushroom);
			
        } break;
        
        //Fire Flower
        case (1): { 
        
            //Play 'Correct' sound
            audio_play_sound(snd_correct, 0, false);
        
            //If the inventory is not full, increment size
		    if (global.inventory[0] < 15) {
		
		        global.inventory[0]++;
			}
			
			//Add a fire flower to the inventory
			global.inventory[global.inventory[0]] = sprite_get_macro(spr_fireflower);
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
            audio_play_sound(snd_correct, 0, false);
        
            //If the inventory is not full, increment size
		    if (global.inventory[0] < 15) {
		
		        global.inventory[0]++;
			}
			
			//Add a starman to the inventory
			global.inventory[global.inventory[0]] = 29;
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