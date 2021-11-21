/// @description Move the player

var x_rate = (length * 16) / 2000;
var y_rate = (length * 16) / 2000;

//If the platform is extending
if (extend == true) {

	//Get the new scale
	xscale_new = lerp(image_xscale, length+1, x_rate);
	yscale_new = lerp(image_yscale, 1, y_rate);
	
	#region PLAYER / NPC MOVEMENT
	
		//Create list
		var list = ds_list_create();
		
		//Check for Mario
		var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0)
		
		//Check for items
		var count = collision_rectangle_list(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_physicsparent, 0, 0, list, 0);
		
		//If Mario does exist
		if (mario)
		&& (mario.state < playerstate.jump)
		&& (mario.bbox_bottom < yprevious+5) {
			
			//Make Mario move
			mario.x += (image_xscale - xscale_new) * 16 * ((mario.x < x)*2-1);
		}
		
		//If there's a npc or more on the platform
		if (count > 0)
			for (var i=0; i<count; i++)
				list[| i].x += (image_xscale - xscale_new) * 16 * ((list[| i].x < x)*2-1);
				
	#endregion

	//Set scale
	image_xscale = xscale_new;
	image_yscale = yscale_new;
	
	//Increment palette
	if (pal < 1)
		pal += 0.05;
}

//Otherwise
else if (extend == false) {
	
	//Get the new scale
	xscale_new = lerp(image_xscale, 1, x_rate);
	yscale_new = lerp(image_yscale, 2, y_rate);

	#region PLAYER / NPC MOVEMENT
	
		//Create list
		var list = ds_list_create();
		
		//Check for Mario
		var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0)
		
		//Check for items
		var count = collision_rectangle_list(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_physicsparent, 0, 0, list, 0);
		
		//If Mario does exist
		if (mario)
		&& (mario.state < playerstate.jump)
		&& (mario.bbox_bottom < yprevious+5) {
			
			//Make Mario move
			mario.x += (image_xscale - xscale_new) * 16 * ((mario.x < x)*2-1);
		}
		
		//If there's a npc or more on the platform
		if (count > 0)
			for (var i=0; i<count; i++)
				list[| i].x += (image_xscale - xscale_new) * 16 * ((list[| i].x < x)*2-1);
				
	#endregion
	
	//Set scale
	image_xscale = xscale_new;
	image_yscale = yscale_new;
	
	//Increment palette
	if (pal > 0)
		pal -= 0.05;	
}

//Boop the mushroom
if (boop_change <> 0)
    boop_change = lerp(boop_change, 0, 0.125);