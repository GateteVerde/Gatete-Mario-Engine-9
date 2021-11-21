// @function pswitch_event
// @param {bool} If true, the event should be turned off

function pswitch_event() {

	//Check if the event should be turned off
	_indexedTurnOff = (argument_count > 0) ? argument[0] : false;
	
	//If the event should turn on
	if (!_indexedTurnOff) {
		
		//Make sure event is active
		pswitch_on = true;
	
		//Turn bricks into coins
		with (obj_brick) {
		
			instance_create_layer(x, y, "Main", obj_coinchange);
			instance_destroy();
		}
		
		//Turn coins into bricks
		with (obj_coin) {
		
			if (x == xstart)
			&& (y == ystart) {
				
				instance_create_layer(x, y, "Main", obj_brick);
				instance_destroy();
			}
		}
		
		//Turn the fake coins into real coins
		with (obj_coinchange) {
		
			instance_create_layer(x, y, "Main", obj_coin);
			instance_destroy();
		}
		
		//Make P-Coins visible
		with (obj_coin_p) visible = true;
		
		//Turn off conveyors
		with (obj_conveyor_r) image_speed = 0;
		with (obj_conveyor_l) image_speed = 0;
	}
	
	//Otherwise
	else if (_indexedTurnOff) {
	
		//Make sure event is not active
		pswitch_on = false;
		
		with (obj_brick) {
		
			instance_create_layer(x, y, "Main", obj_coinchange);
			instance_destroy();
		}
		
		//Turn coins into bricks
		with (obj_coin) {
		
			if (x == xstart)
			&& (y == ystart) {
				
				instance_create_layer(x, y, "Main", obj_brick);
				instance_destroy();
			}
		}
		
		//Turn the fake coins into real coins
		with (obj_coinchange) {
		
			instance_create_layer(x, y, "Main", obj_coin);
			instance_destroy();
		}
		
		//Make P-Coins visible
		with (obj_coin_p) visible = false;
		
		//Turn off conveyors
		with (obj_conveyor_r) image_speed = belt_power;
		with (obj_conveyor_l) image_speed = -belt_power;		
	}
}