/// @description Make Mario able to move

if (instance_number(obj_mapopener) == 1) {

	with (obj_mapmario) alarm[10] = 32;
	with (obj_mapcontrol) alarm[0] = 32;
}