/// @description Finish licking

//End licking
licking = 0;

//If Yoshi ate a powerup, create it.
if (powerup != noone) {

    //Create eaten powerup
    instance_create_layer(x, y, "Main", powerup);
    
    //Reset eaten powerup
    powerup = noone;
}

//If Yoshi are a berry, count up until he eats 5
else if (berry != noone) {

    //If the berry eaten is a green one, extend time for 20 seconds.
    if (berry == spr_berry_g) {
    
        //Play 'Coin' sound
        audio_play_sound(snd_coin, 0, false);
    
        //Extend time
        with (instance_create_depth(x-8, y-15, -6, obj_score)) 
			value = -5;       
    }
    
    //Otherwise if the berry eaten is a red one, increment count till 5 berries are eaten.
    else if (berry == spr_berry) {
    
        //Increment berry number
        global.berries++;
        
        //Make yoshi lay a egg if he eats enough berries
        if (global.berries == 5) {
        
            //Make Yoshi lay a egg
            alarm[5] = 1;
        
            //Show how many berries yoshi ate
            with (instance_create_depth(x, y-15, -6, obj_score_coins)) {
            
                amount = global.berries;
                alarm[0] = 12;
            }
            
            //Reset berry counter
            global.berries = 0;
        }
        
        //Create a number and make it flash if 5 berries were eaten
        else {
                    
            //Show how many berries yoshi ate
            with (instance_create_depth(x, y-15, -6, obj_score_coins)) 
                amount = global.berries;
        }
    }
    
    //Play 'Coin' sound
    audio_play_sound(snd_coin, 0, false);
    
    //Increment coins
    global.coins++;
    
    //Reset eaten berry
    berry = noone;
}