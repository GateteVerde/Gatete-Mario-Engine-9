/// @description Make Mario visible and enable it's controls

if (instance_exists(obj_mario))
&& (!instance_exists(obj_mario_transform)) {
	
	obj_mario.visible = true;
	obj_mario.enable_control = true;
}