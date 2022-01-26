/// @description Display message

//Create the message
with (instance_create_layer(0, 0, "GUI", obj_message)) {

	varmsg = "Pick a box!\n\nIt's contents will help you on your way.";
	mute_sound = 0;
}