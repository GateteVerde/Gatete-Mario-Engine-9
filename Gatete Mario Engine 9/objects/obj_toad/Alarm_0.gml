/// @description Display message

//Create the message
with (instance_create_layer(0, 0, "GUI", obj_message)) {

	varmsg = (instance_number(obj_chest) > 1) ? "Pick a box!\n\nIt's contents will help you on your way." : "Here's a rare item!\n\nI'm sure it'll come in handy...";
	mute_sound = 0;
}