///Set up the sprite based on the last room

//Get layer and background id
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);

//Check the last room
switch (obj_coordinator.last_room) {

	//Green
	case (rm_switchpalace_g): {
	
		sprite_index = spr_palaceswitch_g;
		if (layer_background_get_sprite(back_id) != spr_bgr_switchpalace_g)
			layer_background_sprite(back_id, spr_bgr_switchpalace_g);
	} break;
	
	//Green
	case (rm_switchpalace_r): {
	
		sprite_index = spr_palaceswitch_r;
		if (layer_background_get_sprite(back_id) != spr_bgr_switchpalace_r)
			layer_background_sprite(back_id, spr_bgr_switchpalace_r);
	} break;
	
	//Green
	case (rm_switchpalace_b): {
	
		sprite_index = spr_palaceswitch_b;
		if (layer_background_get_sprite(back_id) != spr_bgr_switchpalace_b)
			layer_background_sprite(back_id, spr_bgr_switchpalace_b);
	} break;
}