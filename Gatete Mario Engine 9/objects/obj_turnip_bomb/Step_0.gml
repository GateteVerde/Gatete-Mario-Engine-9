/// @description Turnip bomb logic

//Inherit the parent event
event_inherited();

//Explosion timer
if ((aa > 0) && (freeze == false)) {

	aa--;
	if (aa < 120)
		sprite_index = spr_turnip_bomb_th;
}

//Otherwise
else {

	instance_create_layer(x, y, "Main", obj_explosion_lite);
	instance_destroy();
	exit;
}

//Manage semisolid position
if (instance_exists(mytop)) {

	//If not held
	if (held == false) {
		
		mytop.x = x;
		mytop.y = y+2;
	}
	else {
	
		mytop.x = -1000;
		mytop.y = -1000;
	}
}