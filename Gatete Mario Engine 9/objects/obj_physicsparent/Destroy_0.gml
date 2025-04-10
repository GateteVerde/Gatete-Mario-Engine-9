/// @description Destroy light if needed

if (variable_instance_exists(id, "mylight")) {

	if (instance_exists(mylight))
		with (mylight) instance_destroy();
}