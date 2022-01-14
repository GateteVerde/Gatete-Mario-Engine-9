/// @description Lava logic (Player)

//If Mario does exist
if (instance_exists(obj_mario)) {

	//With Mario
	with (obj_mario) {
	
		//Check for lava
		lava = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom+7, obj_lava, 1, 0);
		
		//If there's lava in-position
		if (lava) {
		
			//If lava has collision attached and this one is not poison or chocolate
			if (lava.mycol != -1) {
			
				//If the player is riding a baburu shoe
				if (global.mount == 2)
				&& (global.mountcolour == 1)
					exit;
					
				//Otherwise
				else {
				
					//Create Mario death object
					with (instance_create_depth(x, y, -5, obj_mario_dead)) {

						if (obj_levelcontrol.lava_palette != 1) {
		
							image_blend = c_gray;
							alarm[2] = 1;
						}
					}

					//Destroy
					instance_destroy();					
				}
			}
			
			//Otherwise
			else {
			
				//Create Mario death object
				with (instance_create_depth(x, y, -5, obj_mario_dead)) {

					if (obj_levelcontrol.lava_palette != 1) {
		
						image_blend = c_gray;
						alarm[2] = 1;
					}
				}

				//Destroy real Mario object
				instance_destroy();
			}
		}
	}
}