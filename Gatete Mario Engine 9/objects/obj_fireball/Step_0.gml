/// @description Fireball logic

//Check previous horizontal speed
prevxspeed = xspeed;

//No swimming
swimming = false;

//Inherit the parent event
event_inherited();

#region GRAVITY

	if (global.fireballtype == 0) {

		//If there's no gravity
		if (yadd == 0) {

			yadd = 0;
			if (global.player == 0)
				yspeed = -2.5;
			else
				yspeed = -3.5;
		}
		else
			yadd = 0.25;
	}

	//Otherwise
	else {

		//If Mario is being controlled
		if (global.player == 0) {
		
			//If there's no gravity
			if (yadd == 0) {

				yadd = 0;
				if (global.player == 0)
					yspeed = -2.5;
				else
					yspeed = -3.5;
			}
			else
				yadd = 0.25;
		}
		else {
		
			yadd = 0;
			if (yspeed != 0)
				yspeed = 0;
		}
	}
#endregion

//Destroy if horizontal speed is not the same as prevxspeed
if (freeze == false)
&& (sign(xspeed) != sign(prevxspeed))
	event_user(0);