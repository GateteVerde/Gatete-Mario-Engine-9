/// @description Check if Mario is transforming or dead

//If not frozen
if (freeze == false) {

	//If Mario is dead or transforming
	if (instance_exists(obj_mario_dead))
	|| (instance_exists(obj_mario_transform))
		event_user(13);
}

//Otherwise, if frozen
else if (freeze == true) {
	
	//If Mario ended transforming
	if (!instance_exists(obj_mario_transform))
		event_user(14);
}
