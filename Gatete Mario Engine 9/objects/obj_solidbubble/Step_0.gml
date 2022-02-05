/// @description Manage animation

if (ready2 == 1) {
	
    if (ready_hits[0] < 5) {
		
        switch (ready[0]) {
			
            case (0): {
				
                scale += 0.05
                offset -= 1
                if (scale >= 1)
                    ready[0] = 1
            } break;
			
            case (1): {
				
                scale -= 0.05
                offset += 1
                if (scale < 0.75) {
					
                    ready_hits[0] += 1
                    ready[0] = 0
                }
            }
        }
    }
    else {
		
        scale = 0.75
        offset = 4
    }
}
else if (ready2 == 2) {
	
    if (ready_hits[1] < 5) {
		
        switch (ready[1]) {
			
            case (0): {
				
                scale += 0.05
                offset -= 1
                if (scale >= 0.75)
                    ready[1] = 1
            } break;
			
            case (1): {
				
                scale -= 0.05
                offset += 1
                if (scale < 0.5) {
					
                    ready_hits[1] += 1
                    ready[1] = 0
                }
            }
        }
    }
    else {
		
        scale = 0.5
        offset = 8
    }
}

//Top
if (myt != 0)
&& (instance_exists(myt)) {
	
	myt.image_xscale = scale;
	myt.image_yscale = scale;
}
	
//Bottom
if (myb != 0)
&& (instance_exists(myb)) {
	
	myb.image_xscale = scale;
	myb.image_yscale = scale;
}