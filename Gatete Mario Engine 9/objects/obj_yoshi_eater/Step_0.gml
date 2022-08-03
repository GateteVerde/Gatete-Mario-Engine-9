/// @description Makes yoshi eat berries on contact

if (instance_exists(obj_yoshi)) {
	
	//Set X position
	x = (obj_yoshi.image_xscale == -1) ? obj_yoshi.x-16 : obj_yoshi.x;

	//Set Y position
	y = obj_yoshi.y-16;
}

//Reset berry variable
if (berry != noone)
&& (obj_yoshi.licking == 0) {
	
	//If the berry eaten is a green one, extend time for 20 seconds.
	if (berry == spr_berry_g) {
    
	    //Play 'Coin' sound
	    audio_play_sound(snd_coin, 0, false);
    
	    //Extend time
	    with (instance_create_depth(x+8, y, -6, obj_score)) 
			value = -5;       
	}
    
	//Otherwise if the berry eaten is a red one, increment count till 5 berries are eaten.
	else if (berry == spr_berry) {
    
	    //Increment berry number
	    global.berries++;
        
	    //Make yoshi lay a egg if he eats enough berries
	    if (global.berries == 5) {
        
	        //Make Yoshi lay a egg
	        obj_yoshi.alarm[5] = 1;
        
	        //Show how many berries yoshi ate
	        with (instance_create_depth(x+8, y, -6, obj_score_coins)) {
            
	            amount = global.berries;
	            alarm[0] = 12;
	        }
            
	        //Reset berry counter
	        global.berries = 0;
	    }
        
	    //Create a number and make it flash if 5 berries were eaten
	    else {
                    
	        //Show how many berries yoshi ate
	        with (instance_create_depth(x+8, y, -6, obj_score_coins)) 
	            amount = global.berries;
	    }
	}
    
	//Increment coins
	global.coins++;
	
	//Reset berry variable
	berry = noone;
}