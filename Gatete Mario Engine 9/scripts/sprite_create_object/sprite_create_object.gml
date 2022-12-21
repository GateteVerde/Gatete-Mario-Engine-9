/// @function sprite_get_macro(sprite, x, y, depth);
/// @param sprite
/// @param x
/// @param y
/// @param depth

function sprite_create_object() {

	switch (argument[0]) {
	
		//Tiny Mushroom
		case (spr_tinyshroom): return instance_create_depth(argument[1], argument[2], argument[3], obj_tinyshroom);
		
		//Mushroom
		case (spr_mushroom): 
		case (spr_mushroom_cb):
			return instance_create_depth(argument[1], argument[2], argument[3], obj_mushroom);
		
		//Fire Flower
		case (spr_fireflower):
		case (spr_fireflower_cb): 
			return instance_create_depth(argument[1], argument[2], argument[3], obj_fireflower);
		
		//Ice Flower
		case (spr_iceflower): 
		case (spr_iceflower_cb):
			return instance_create_depth(argument[1], argument[2], argument[3], obj_iceflower);
		
		//Carrot
		case (spr_carrot): return instance_create_depth(argument[1], argument[2], argument[3], obj_carrot);
		
		//Frog Suit
		case (spr_frogsuit): return instance_create_depth(argument[1], argument[2], argument[3], obj_frogsuit);
		
		//Tanooki Suit
		case (spr_tanookisuit): return instance_create_depth(argument[1], argument[2], argument[3], obj_tanookisuit);
		
		//Hammer Flower
		case (spr_hammerflower): return instance_create_depth(argument[1], argument[2], argument[3], obj_hammerflower);
		
		//Boomerang Flower
		case (spr_boomerangflower): return instance_create_depth(argument[1], argument[2], argument[3], obj_boomerangflower);
		
		//Super Flower
		case (spr_superflower):
		case (spr_superflower_cb): 
			return instance_create_depth(argument[1], argument[2], argument[3], obj_superflower);
		
		//Bomb Mushroom
		case (spr_bombshroom): return instance_create_depth(argument[1], argument[2], argument[3], obj_bombshroom);
		
		//Blue Shell
		case (spr_blueshell): return instance_create_depth(argument[1], argument[2], argument[3], obj_blueshell);
		
		//Bee Mushroom
		case (spr_beeshroom): return instance_create_depth(argument[1], argument[2], argument[3], obj_beeshroom);
		
		//Volt Mushroom
		case (spr_voltshroom): return instance_create_depth(argument[1], argument[2], argument[3], obj_voltshroom);
		
		//Penguin Suit
		case (spr_penguinsuit): return instance_create_depth(argument[1], argument[2], argument[3], obj_penguinsuit);
		
		//Super Bell
		case (spr_superbell): return instance_create_depth(argument[1], argument[2], argument[3], obj_superbell);
		
		//Helmet
		case (spr_helmet): return instance_create_depth(argument[1], argument[2], argument[3], obj_helmet);
		
		//Ranger Hat
		case (spr_rangerhat): return instance_create_depth(argument[1], argument[2], argument[3], obj_rangerhat);
		
		//Super Acorn
		case (spr_superacorn): return instance_create_depth(argument[1], argument[2], argument[3], obj_superacorn);
		
		//Beetroot
		case (spr_beet): return instance_create_depth(argument[1], argument[2], argument[3], obj_beet);
		
		//Jumping Lui
		case (spr_lui): return instance_create_depth(argument[1], argument[2], argument[3], obj_lui);
		
		//Golden Flower
		case (spr_goldenflower):
		case (spr_goldenflower_cb): 
			return instance_create_depth(argument[1], argument[2], argument[3], obj_goldenflower);
		
		//Heart
		case (spr_heart): return instance_create_depth(argument[1], argument[2], argument[3], obj_heart);
		
		//1-UP
		case (spr_1up):
		case (spr_1up_cb): 
			return instance_create_depth(argument[1], argument[2], argument[3], obj_1up);
		
		//3-UP
		case (spr_3up): return instance_create_depth(argument[1], argument[2], argument[3], obj_3up);
		
		//Poison
		case (spr_poison): 
		case (spr_poison_cb):
			return instance_create_depth(argument[1], argument[2], argument[3], obj_poison);
		
		//Rotten
		case (spr_rotten): return instance_create_depth(argument[1], argument[2], argument[3], obj_rotten);
		
		//Starman
		case (spr_starman): return instance_create_depth(argument[1], argument[2], argument[3], obj_starman);
		
		//P-Wing
		case (spr_pwing): return instance_create_depth(argument[1], argument[2], argument[3], obj_pwing);
		
		//P-Switch
		case (spr_pswitch): return instance_create_depth(argument[1], argument[2], argument[3], obj_pswitch);
		
		//G-Switch
		case (spr_gswitch): return instance_create_depth(argument[1], argument[2], argument[3], obj_gswitch);
		
		//Trampoline
		case (spr_trampoline): return instance_create_depth(argument[1], argument[2], argument[3], obj_trampoline);
		
		//Propeller Block
		case (spr_propellerblock): return instance_create_depth(argument[1], argument[2], argument[3], obj_propellerblock);
		
		//POW Block
		case (spr_powblock): return instance_create_depth(argument[1], argument[2], argument[3], obj_powblock);
		
		//Key
		case (spr_key): return instance_create_depth(argument[1], argument[2], argument[3], obj_key);
		
		//Billy Gun
		case (spr_billygun): return instance_create_depth(argument[1], argument[2], argument[3], obj_billygun);
		
		//Green Yoshi
		case (spr_egg): return instance_create_depth(argument[1], argument[2], argument[3], obj_egg);

		//Red Yoshi
		case (spr_egg_r): {
    
		    var i;
		    i = instance_create_depth(argument[1], argument[2], argument[3], obj_egg);
		        i.sprite_index = spr_egg_r;
		}
		return i;
    
		//Yellow Yoshi
		case (spr_egg_y): {
    
		    var i;
		    i = instance_create_depth(argument[1], argument[2], argument[3], obj_egg);
		        i.sprite_index = spr_egg_y;
		}
		return i;
    
		//Blue Yoshi
		case (spr_egg_b): {
    
		    var i;
		    i = instance_create_depth(argument[1], argument[2], argument[3], obj_egg);
		        i.sprite_index = spr_egg_b;
		}
		return i;
    
		//Teal Yoshi
		case (spr_egg_t): {
    
		    var i;
		    i = instance_create_depth(argument[1], argument[2], argument[3], obj_egg);
		        i.sprite_index = spr_egg_t;
		}
		return i;
    
		//Pink Yoshi
		case (spr_egg_p): {
    
		    var i;
		    i = instance_create_depth(argument[1], argument[2], argument[3], obj_egg);
		        i.sprite_index = spr_egg_p;
		}
		return i;
		
		//Kuribo Shoe
	    case (spr_shoe_kuribo): return instance_create_depth(argument[1], argument[2], argument[3], obj_getshoe);
    
	    //Baburu Shoe
	    case (spr_shoe_baburu): {
    
	        var i;
	        i = instance_create_depth(argument[1], argument[2], argument[3], obj_getshoe);
	            i.sprite_index = spr_shoe_baburu;
	    }
	    return i;
    
	    //Dossun Shoe
	    case (spr_shoe_dossun): {
    
	        var i;
	        i = instance_create_depth(argument[1], argument[2], argument[3], obj_getshoe);
	            i.sprite_index = spr_shoe_dossun;
	    }
	    return i;
    
	    //Jugemu Shoe
	    case (spr_shoe_jugemu): {
    
	        var i;
	        i = instance_create_depth(argument[1], argument[2], argument[3], obj_getshoe);
	            i.sprite_index = spr_shoe_jugemu;
	    }
	    return i;
    
	    //Pentaro Shoe
	    case (spr_shoe_pentaro): {
    
	        var i;
	        i = instance_create_depth(argument[1], argument[2], argument[3], obj_getshoe);
	            i.sprite_index = spr_shoe_pentaro;
	    }
	    return i;        
	}
}