/// @description Player and NPC logic (While in-platform)

//Player / NPC Ride logic
#region RIDE LOGIC

	//Check for the player
	var player = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_bottom+4, obj_mario, 1, 0);

	//If the player exists
	if (player)
	&& (player.state < playerstate.jump)
	&& (player.bbox_bottom < self.bbox_bottom) {

		//Snap the player horizontally
		player.x += x-xprevious;
		if (collision_rectangle(player.bbox_right, player.bbox_top+4, player.bbox_right+1, player.bbox_bottom-1, obj_solid, 1, 1))
			player.x--;
		else if (collision_rectangle(player.bbox_left-1, player.bbox_top+4, player.bbox_left, player.bbox_bottom-1, obj_solid, 1, 1))
			player.x++;
	}

	//Create a list
	var list = ds_list_create();

	//Count items
	var count = collision_rectangle_list(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_physicsparent, 0, 0, list, 0);
	if (count > 0) {

		//Iterate through all items
		for (var i=0; i<count; i++) {

			//Snap the player horizontally
			list[| i].x += x-xprevious;
			if (collision_rectangle(list[| i].bbox_right, list[| i].bbox_top+4, list[| i].bbox_right+1, list[| i].bbox_bottom-1, obj_solid, 1, 1))
				list[| i].x--;
			else if (collision_rectangle(list[| i].bbox_left-1, list[| i].bbox_top+4, list[| i].bbox_left, list[| i].bbox_bottom-1, obj_solid, 1, 1))
				list[| i].x++;
		}
	}

	//Destroy list
	ds_list_destroy(list);
#endregion