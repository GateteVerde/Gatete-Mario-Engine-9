/// @description Set offset

inv_offset_y = lerp(inv_offset_y, global.gh / 2 - 51, 0.2);

if (boxselection < (list_pos+(margin+1))) {
	
	list_pos--;
}

else if (boxselection >= (list_pos+length-(margin-1))) {
	
	list_pos++;
}
					
list_pos = clamp(list_pos, 0, max(0,global.inventory[0]-length));