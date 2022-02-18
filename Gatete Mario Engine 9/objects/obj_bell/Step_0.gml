/// @description Set alternative bell sprite

if (instance_exists(obj_bell_house)) {

	//If the house opens the secret exit
	if (obj_bell_house.secret_exit)
		sprite_index = spr_bell_alt;
}