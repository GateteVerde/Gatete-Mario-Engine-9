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
		
		//Turn on hidden blocks
		with (obj_qblock_p) {
		
			visible = true;
			mysolid = instance_create_layer(x, y, "Main", obj_solid);
			with (mysolid) {

				image_xscale = other.sprite_width/16;
				image_yscale = other.sprite_height/16;
			}
		}
		
		//Turn on doors
		with (obj_door_p) sprite_index = spr_door_p;
		
		//Create blue trampolines
		with (obj_trampoline_switch)		
			instance_create_layer(x, y, "Main", obj_trampoline_switch_activated);
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
		
		//Turn on conveyors
		with (obj_conveyor_r) image_speed = belt_power;
		with (obj_conveyor_l) image_speed = -belt_power;
		
		//Turn off hidden blocks
		with (obj_qblock_p) {
		
			visible = false;
			with (mysolid) instance_destroy();
			mysolid = noone;
		}
		
		//Turn off doors
		with (obj_door_p) {
		
			//If the door is not animated
			if (image_speed == 0) {
				
				sprite_index = spr_door_p_outline;
				image_speed = 0;
				image_index = 0;
			}
		}
		
		//Destroy all blue trampoline
		with (obj_trampoline_switch_activated) instance_destroy();
	}
}