/// @description Destroy

//If Mario does exist, make it vulnerable
if (instance_exists(obj_mario)) {

	obj_mario.invulnerable = false;
}

//Reset combo
global.hitcombo = 0;
hitcombo = 0;

//Destroy
instance_destroy();
