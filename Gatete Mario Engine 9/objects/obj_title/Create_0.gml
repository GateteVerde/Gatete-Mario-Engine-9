/// @description Title Screen menu object

//Loop music
audio_play_sound(snd_title, 0, true);

//Sub menu enums
enum menupage {

	main		=		0,
	deletion	=		1,
	options		=		2,
	keys		=		3
}

//Save File info
for (i=0; i<3; i++) {

    completion[i] = -1;
}

//Options sub-menu 0
menu[menupage.main, 0] = "FILE A ..... NEW!";
menu[menupage.main, 1] = "FILE B ..... NEW!";
menu[menupage.main, 2] = "FILE C ..... NEW!";
menu[menupage.main, 3] = "Delete File";
menu[menupage.main, 4] = "Settings";
menu[menupage.main, 5] = "Exit";

//Options sub-menu 1: File Deletion
menu[menupage.deletion, 0] = "Delete File A";
menu[menupage.deletion, 1] = "Delete File B";
menu[menupage.deletion, 2] = "Delete File C";
menu[menupage.deletion, 3] = "Back";

//Options sub-menu 2: Options 1 / 2
menu[menupage.options, 0] = "Keyboard Configuration";
menu[menupage.options, 1] = "Window Size";
menu[menupage.options, 2] = "Colourblind Mode: Off";
menu[menupage.options, 3] = "Music Volume: " + string(round(obj_coordinator.music_vol * 100));
menu[menupage.options, 4] = "Sound Volume: " + string(round(obj_coordinator.sound_vol * 100));
menu[menupage.options, 5] = "Voice Volume: " + string(round(obj_coordinator.voice_vol * 100));
menu[menupage.options, 6] = "Auto Save: On";
menu[menupage.options, 7] = "V-Sync: On";
menu[menupage.options, 8] = "FPS: On";
menu[menupage.options, 9] = "View Credits";
menu[menupage.options, 10] = "Back";

//Options sub-menu 3: Keys
menu[menupage.keys, 0] = "Jump/Confirm:";
menu[menupage.keys, 1] = "Run/Shoot/Cancel:";
menu[menupage.keys, 2] = "Reserve:";
menu[menupage.keys, 3] = "Pause:";
menu[menupage.keys, 4] = "Up:";
menu[menupage.keys, 5] = "Down:";
menu[menupage.keys, 6] = "Left:";
menu[menupage.keys, 7] = "Right:";
menu[menupage.keys, 8] = "Reset key config"
menu[menupage.keys, 9] = "Back";

//Set keys
key[0] = string(key_to_string(global.key[input.action_0]));
key[1] = string(key_to_string(global.key[input.action_1]));
key[2] = string(key_to_string(global.key[input.action_2]));
key[3] = string(key_to_string(global.key[input.start]));
key[4] = string(key_to_string(global.key[input.up]));
key[5] = string(key_to_string(global.key[input.down]));
key[6] = string(key_to_string(global.key[input.left]));
key[7] = string(key_to_string(global.key[input.right]));

//Input delay
delay = 0;

//Menu index position
index = 0;

//Current submenu
sub_menu = 0;

//Waiting
waiting = 0;

//Allow navigation
start = 0;

//Cog wheel vars
alpha = 0;
anim = 0;

//Title y position
yy = 0;

//Cursor sprite
cursor = spr_gui_cursor;

//Display "Start" text
display = 1;
alarm[0] = 30;