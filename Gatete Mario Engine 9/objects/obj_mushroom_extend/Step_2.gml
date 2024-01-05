/// @description Player and NPC logic (While in-platform)

//Check for the player
var player = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If the player exists
if (player)
&& (player.state != playerstate.jump)
&& (player.bbox_bottom < yprevious+5) {
		
	//Check there's no semisolid on the way
	var check = collision_line(obj_mario.bbox_left, bbox_top, obj_mario.bbox_right, bbox_top, obj_semisolid, 0, 1);
		
	//If there's a platform on the way, exit
	if (!check) {
    
		//Snap the player vertically
		player.y = ceil(bbox_top-16);
	}
}

//Create a list
var list = ds_list_create();

//Count items
var count = collision_rectangle_list(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_physicsparent, 0, 0, list, 0);
if (count > 0) {

	//Iterate through all items
	for (var i=0; i<count; i++) {
		
		//If the item is above this platform
		if (list[| i].yspeed >= 0)
		&& (list[| i].bbox_bottom < yprevious+5) {
				
			//If there's a platform on the way, ignore this event
			if (!collision_rectangle(list[| i].bbox_left, bbox_top-5, list[| i].bbox_right, bbox_top+1, obj_semisolid, 0, 1)) {
	
				//Snap the item vertically
				list[| i].y = ceil(bbox_top-list[| i].sprite_height);
			}
		}
	}
}

//Destroy list
ds_list_destroy(list);