/// @description Turn into a flip block

//If this is a question block
if (other.sprite_index == spr_qblock) {

	other.sprite_index = spr_flipblock;
	other.image_speed = 0;
	other.image_index = 0;
}

//Destroy this modifier
instance_destroy();