/// @description Winged block logic

//Increment animation
anim += 0.15;

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_mario, 0, 0);

//If the player is in position
if (mario)
&& (mario.yspeed <= 0)
&& (mario.state = playerstate.jump) 
&& (mario.bbox_top > bbox_bottom+mario.yspeed-1) {

    //Create a new block, give it the same item and bump it.
    with (instance_create_layer(x, y, "Main", obj_qblock)) {
    
		//Set the item to reveal
		sprout = other.sprout;
	
		//Set state to bumped
		ready = 1;
						
		//Set horizontal speed
		vspeed = -2;
		alarm[0] = 4;
						
		//Create block specific events
		event_user(0);	
    }
	
	//Create 'Feathers' effect
	with (instance_create_depth(x + 8, y, -6, obj_smoke)) sprite_index = spr_feathers;
    
    //Destroy
    instance_destroy();
}

//Handle block movement
event_user(0);

//Check for Mario
var mario2 = collision_rectangle(bbox_left-6, bbox_top-6, bbox_right+6, bbox_bottom+6, obj_mario, 0, 0);

//If Mario does exist
if (mario2) 
&& (global.powerup == cs_mega)
&& (instance_exists(obj_megashroom_timer))	
	event_user(15);