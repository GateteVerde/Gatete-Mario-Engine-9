/// @description Statue logic

//If the player does not have the tanooki powerup
if (global.powerup != cs_tanooki) {
	
    alarm[1] = 1;
	exit;
}

//If the player does exist.
if (instance_exists(owner)) {

    //If the statue combo keys are still held.
	if (input_check(input.action_1))
	&& ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) < 0.5)) {
    
        //Snap into position
        x = owner.x;
        y = owner.y;
        
        //Make the player invulnerable
        owner.invulnerable = true
    }
    else {
		
        alarm[1] = 1;
		exit;
	}
}
else {
	
    alarm[1] = 1;
	exit;
}