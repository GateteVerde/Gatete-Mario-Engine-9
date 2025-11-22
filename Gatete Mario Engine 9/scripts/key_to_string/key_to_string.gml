/// @function key_to_string(key)

function key_to_string() {

	switch (argument[0]) {
    
	    //Backspace
	    case (8): return "backspace"; break;
    
	    //Tab
	    case (9): return "tab"; break;
    
	    //Numpad middle
	    case (12): return "numpad middle"; break;
    
	    //Enter
	    case (13): return "enter"; break;
    
	    //Shift
	    case (16): return "shift"; break;
    
	    //Control
	    case (17): {
		
			//If the game is being played on MacOS
			if (os_type == os_macosx)
				return "command";
			else
				return "control";
			
		} break;

	    //Alt
	    case (18): return "alt"; break;
    
	    //Pause
	    case (19): return "pause"; break;
    
	    //Caps Lock
	    case (20): return "caps lock"; break;
    
	    //Escape
	    case (27): return "escape"; break;

	    //Space
	    case (32): return "space"; break;
    
	    //Page Up
	    case (33): return "page up"; break;
    
	    //Page Down
	    case (34): return "page down"; break;
    
	    //End
	    case (35): return "end"; break;
    
	    //Home
	    case (36): return "home"; break;
    
	    //Left
	    case (37): return "left"; break;
    
	    //Up
	    case (38): return "up"; break;
    
	    //Right 
	    case (39): return "right"; break;
    
	    //Down
	    case (40): return "down"; break;
    
	    //Print Screen
	    case (44): return "print screen"; break;
    
	    //Insert
	    case (45): return "insert"; break;
    
	    //Delete
	    case (46): return "delete"; break;

	    //Left Windows
	    case (91): return "left windows"; break;

	    //Right Windows
	    case (92): return "right windows"; break;
    
	    //Menu
	    case (93): return "menu"; break;
    
	    //Numpad 0
	    case (96): return "numpad 0"; break;

	    //Numpad 1
	    case (97): return "numpad 1"; break;
    
	    //Numpad 2
	    case (98): return "numpad 2"; break;
    
	    //Numpad 3
	    case (99): return "numpad 3"; break;
    
	    //Numpad 4
	    case (100): return "numpad 4"; break;
    
	    //Numpad 5
	    case (101): return "numpad 5"; break;
    
	    //Numpad 6
	    case (102): return "numpad 6"; break;

	    //Numpad 7
	    case (103): return "numpad 7"; break;
    
	    //Numpad 8
	    case (104): return "numpad 8"; break;
    
	    //Numpad 9
	    case (105): return "numpad 9"; break;
    
	    //Numpad *
	    case (106): return "numpad *"; break;

	    //Numpad +
	    case (107): return "numpad +"; break;

	    //Numpad -
	    case (109): return "numpad -"; break;
    
	    //Numpad .
	    case (110): return "numpad ."; break;
   
	    //Numpad /
	    case (111): return "numpad /"; break;
    
	    //F1
	    case (112): return "F1"; break;
    
	    //F2
	    case (113): return "F2"; break;
    
	    //F3
	    case (114): return "F3"; break;
    
	    //F4
	    case (115): return "F4"; break;
    
	    //F5
	    case (116): return "F5"; break;
    
	    //F6
	    case (117): return "F6"; break;
    
	    //F7
	    case (118): return "F7"; break;
    
	    //F8
	    case (119): return "F8"; break;
    
	    //F9
	    case (120): return "F9"; break;
    
	    //F10
	    case (121): return "F10"; break;
    
	    //F11
	    case (122): return "F11"; break;
    
	    //F12
	    case (123): return "F12"; break;

	    //Num lock
	    case (144): return "num lock"; break;
    
	    //Scroll lock
	    case (145): return "scroll lock"; break;

	    //Any key
	    default: return chr(argument[0]); break;
	}
}