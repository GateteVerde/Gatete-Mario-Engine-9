/// @description Jumping Monty Mole logic

//Default event
event_inherited()

//Land on the ground as a regular monty mole
if (yadd == 0) {
	
	//Set the monty type to spawn
	with (instance_create_depth(x, y, -2, obj_montymole)) {
		
		charge = other.type;
	}
   
    //Destroy
    instance_destroy();
}
else
	yadd = 0.15;
