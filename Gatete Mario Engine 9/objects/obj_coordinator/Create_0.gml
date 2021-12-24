/// @description Gatete Mario Engine 9 Game Coordinator (This is required for the game to run, do not remove it.)

//Set game caption
window_set_caption("Gatete Mario Engine 9");

//Initialize Colour Swap Shader
pal_swap_init_system();

//Initialize Player Sprites
index_powerups();

//Initialize global variables
init_globals();

//Initialize shader variables
init_shockwave();

//Gameplay variables
#region GAMEPLAY VARIABLES

	//Don't round off the sub-pixels (applies to uses of screen_round/screen_floor/screen_ceil, NOT values using the built in GMS rounding)
	//false:	Integer rounding similar to GBA/SNES
	//true:		Smoother sub-pixel float movement
	global.subpixels = true;

	//Turn enemies into coins when hit with a fireball
	//0: Disabled
	//1: Enabled
	global.enemy_to_coin = 0;

	//Makes Mario bounce on note blocks from any side
	global.noteblock_all_sides = true;

	//Flight time (In seconds, how much time allow Mario to fly as Raccoon/Tanooki Mario)
	global.flighttime = 4;

	//Climb time (In seconds, how much time allow Mario to climb walls as Cat Mario)
	global.cattime = 3;

	//Maximum amount of hearts
	global.safeguard_max = 3;

	//Allow reserve of items if enabled
	//0: Disabled
	//1: Enabled
	global.reserve_activated = true;

	//Play P-meter sound?
	global.pmeter_sound = true;

	//How long it takes for Mario's P-meter to fill up
	global.pmeter_limit = 144;

#endregion

//MacOS Key Macros
#region MAC KEY MACROS

	#macro vk_lcommand 92
	#macro vk_rcommand 91
	
#endregion

//Powerup Macros
#region POWERUP MACROS

#macro cs_tiny 0
#macro cs_small	1
#macro cs_big 2
#macro cs_fire 3
#macro cs_ice 4
#macro cs_carrot 5
#macro cs_raccoon 6
#macro cs_cape 7
#macro cs_frog 8
#macro cs_tanooki 9
#macro cs_hammer 10
#macro cs_boomerang	11
#macro cs_superball 12
#macro cs_bomb 13
#macro cs_shell	14
#macro cs_bee 15
#macro cs_volt 16
#macro cs_penguin 17
#macro cs_propeller 18
#macro cs_bell 19
#macro cs_football 20
#macro cs_ranger 21
#macro cs_squirrel 22
#macro cs_fraccoon 23
#macro cs_iraccoon 24
#macro cs_gold 25
#macro cs_mega 26

#endregion

//Item Macros
#region ITEM MACROS

	#macro cs_balloon -30
	#macro cs_beanstalk_side -29
	#macro cs_beanstalk -28
	#macro cs_billy -27
	#macro cs_powblock -26
	#macro cs_propellerblock -25
	#macro cs_trampoline -24
	#macro cs_key -23
	#macro cs_gswitch -22
	#macro cs_pswitch -21
	#macro cs_starman -20
	#macro cs_poison -19
	#macro cs_heart -18
	#macro cs_3up -17
	#macro cs_1up -16
	#macro cs_pwing -15
	#macro cs_pballoon -14
	#macro cs_shoe_pentaro -13
	#macro cs_shoe_jugemu -12
	#macro cs_shoe_dossun -11
	#macro cs_shoe_baburu -10
	#macro cs_shoe_kuribo -9
	#macro cs_yoshi_p -8
	#macro cs_yoshi_t -7
	#macro cs_yoshi_b -6
	#macro cs_yoshi_y -5
	#macro cs_yoshi_r -4
	#macro cs_yoshi_g -3
	#macro cs_coin_s -2
	#macro cs_coin -1
	
#endregion

//Key Enums
#region KEY ENUMS

	enum input {
	
		//Directions
		up,
		down,
		left,
		right,
		
		//A Key
		action_0,
		
		//B Key
		action_1,
		
		//X Key
		action_2,
		
		//Start / Select
		start,
		select,
	}
	
#endregion

//Current pitch
pitch = 1;

//Lives
addlives = 0;

//Current File
global.file = 0;

//Game Width
global.gw = room_width;

//Game Height
global.gh = room_height;

//Game Restart
global.restart = false;

//Rescale the surface (sub-pixels)
rescale_surface = false;

//Data structure for picked up 3up moons
global.moons = ds_map_create();

//GUI Button Sprites
gui_buttons = gamepad_set_gui_sprite();

//Font Variables
global.gui_font	= font_add_sprite(spr_gui_font, ord("!"), 0, 0);
global.gui_font_menu = font_add_sprite(spr_gui_font_menu, ord("!"), 0, 0);
global.gui_font_numbers	= font_add_sprite_ext(spr_gui_font_numbers, "0123456789-", 0, 0);
global.gui_font_numbers_gold = font_add_sprite_ext(spr_gui_font_numbers_gold, "0123456789-", 0, 0);
global.gui_font_numbers_black = font_add_sprite_ext(spr_gui_font_numbers_black, "0123456789-", 0, 0);
global.gui_font_numbers_large = font_add_sprite_ext(spr_gui_font_numbers_large, "0123456789-", 0, 0);

//Disable application surface automatic drawing
application_surface_draw_enable(false);

//Set up epsilon for floating point numbers
math_set_epsilon(0.00001);