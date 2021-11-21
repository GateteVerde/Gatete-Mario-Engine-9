/// @description Handle tile movement

//Check tiles in layer
var lay_id = layer_get_id(target_layer);
var map_id = layer_tilemap_get_id(lay_id);

//Get position
var _xx = tilemap_get_x(map_id);
var _yy = tilemap_get_y(map_id);

//Set position
tilemap_x(map_id, _xx + hspeed);
tilemap_y(map_id, _yy + vspeed);

//Manage collision position
#region

	with (obj_solid_moving) {
			
		hspeed = other.hspeed;
		vspeed = other.vspeed;
	}
	
	with (obj_semisolid_moving) {
			
		hspeed = other.hspeed;
		vspeed = other.vspeed;
	}

#endregion

//Arrow collision
if (collision_rectangle(x, y, x + 15, y + 15, obj_up, 0, 0))
    vspeed -= target_speed;
else if (collision_rectangle(x, y, x + 15, y + 15, obj_down, 0, 0))
    vspeed += target_speed;
else if (collision_rectangle(x, y, x + 15, y + 15, obj_left, 0, 0))
    hspeed -= target_speed;
else if (collision_rectangle(x, y, x + 15, y + 15, obj_right, 0, 0))
    hspeed += target_speed;