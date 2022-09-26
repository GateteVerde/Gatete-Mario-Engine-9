/// @description Draw the inventory

//Draw background
draw_sprite_ext(spr_gui_map_inventory, -1, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - inv_offset_y, 1, 1, 0, c_white, 1);

//If there's powerups on the inventory
if (boxselection > 0) {
		
	//Set sprite to use
	var sprite = (obj_coordinator.colourblind) ? spr_gui_map_inventory_items_cb : spr_gui_map_inventory_items;

	//Draw powerups
	for (var i = 1; i <= global.inventory[0]; i++) {
			
		//Set alpha of item
		alpha[i] = (boxselection == i) ? lerp(alpha[i], 1, 0.2) : lerp(alpha[i], 0.5, 0.2);
		scale[i] = (boxselection == i) ? lerp(scale[i], 1.5, 0.2) : lerp(scale[i], 1, 0.2);
		
		//Draw items in inventory
		draw_sprite_custom_origin(sprite, global.inventory[i], camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 162 + (i-1) * 22, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - inv_offset_y + 10, 8, 8, scale[i], scale[i], 0, c_white, alpha[i]);
	}
}