/// @description Destroy

//If Mario does exist
if (instance_exists(obj_mario)) {

	obj_mario.invulnerable = false;
}

//Destroy
instance_destroy();
