/// @description Display message

//Toad is done explaining
ready = 1;

//Create the message
with (instance_create_layer(0, 0, "GUI", obj_message)) {

	varmsg = other.varmsg;
	mute_sound = 0;
}