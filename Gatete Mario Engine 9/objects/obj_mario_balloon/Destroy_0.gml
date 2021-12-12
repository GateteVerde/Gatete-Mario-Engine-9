/// @description Make Mario visible

if (instance_exists(obj_mario))
&& (!instance_exists(obj_mario_transform))
	obj_mario.visible = true;