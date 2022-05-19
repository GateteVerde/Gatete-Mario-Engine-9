/// @function move_contact_object(dir, maxdist, object);
/// @param dir
/// @param maxdist
/// @param object

function move_contact_object() {

	for (i=0; i<argument[1]; i++) {

	    if (place_meeting(lengthdir_x(i, argument[0]), lengthdir_y(i, argument[0]), argument[2])) || (i == argument[1]) {
    
	        x += lengthdir_x(i, argument[0]);
	        y += lengthdir_y(i, argument[0]);
	        exit;
	    }
	}
}
