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

	//Gameplay Macros (Edit this when releasing your game)
	#macro LEVEL_AMOUNT	   10; //Number of levels this game have, this variable is used for the star coins
	#macro EXITS_AMOUNT	   20; //Number of exits this game have		
	#macro STARS_AMOUNT		1; //Number of power stars this game have

	//Don't round off the sub-pixels (applies to uses of screen_round/screen_floor/screen_ceil, NOT values using the built in GMS rounding)
	//false:	Integer rounding similar to GBA/SNES
	//true:		Smoother sub-pixel float movement
	global.subpixels = true;
	
	//Health (If enabled, Mario will be able to take multiple hits to die and cannot turn into small mario)
	global.hp_mode = 1;
	
	//HP / Maximum Health (Sets the maximum hitpoints for Mario if health mode is active)
	global.hp = 3;
	global.hp_max = 3;

	//Turn enemies into coins when hit with a fireball
	//0: Disabled
	//1: Enabled
	global.enemy_to_coin = false;
	
	//Makes Mario able or not able to perform his 3D moves (Wall-Jump, Triple Jump, etc...)
	//0: Disabled
	//1: Enabled
	global.special_moves = true;

	//Makes Mario bounce on note blocks from any side
	global.noteblock_all_sides = false;

	//Flight time (In seconds, how much time allow Mario to fly as Raccoon/Tanooki Mario)
	global.flighttime = 4;

	//Climb time (In seconds, how much time allow Mario to climb walls as Cat Mario)
	global.cattime = 3;

	//Maximum amount of hearts (Overridden if health mode is activated)
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

#macro cs_small	0
#macro cs_big 1
#macro cs_fire 2
#macro cs_ice 3
#macro cs_carrot 4
#macro cs_raccoon 5
#macro cs_cape 6
#macro cs_frog 7
#macro cs_tanooki 8
#macro cs_hammer 9
#macro cs_boomerang	10
#macro cs_superball 11
#macro cs_bomb 12
#macro cs_shell	13
#macro cs_bee 14
#macro cs_volt 15
#macro cs_penguin 16
#macro cs_propeller 17
#macro cs_bell 18
#macro cs_football 19
#macro cs_ranger 20
#macro cs_squirrel 21
#macro cs_fraccoon 22
#macro cs_iraccoon 23
#macro cs_tiny 24
#macro cs_gold 25
#macro cs_mega 26

#endregion

//Item Macros
#region ITEM MACROS

	#macro cs_snake -32
	#macro cs_balloon -31
	#macro cs_beanstalk_side -30
	#macro cs_beanstalk -29
	#macro cs_billy -28
	#macro cs_powblock -27
	#macro cs_propellerblock -26
	#macro cs_trampoline -25
	#macro cs_key -24
	#macro cs_gswitch -23
	#macro cs_pswitch -22
	#macro cs_starman -21
	#macro cs_rotten -20
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

//World Map Enums
#region WORLD MAP ENUMS

	enum mapstate {

	    preidle,
	    idle,
	    wait,
	    walk
	}
#endregion

//Screenshot number
num = 0;

//Progress (Used to calculate how much you progressed in-game)
got = 0;
total = 0;

//Current pitch
pitch = 1;

//Lives
addlives = 0;

//Remember last room
last_room = noone;

//Current File
global.file = 0;

//Game Width
global.gw = room_width;

//Game Height
global.gh = room_height;

//Game Restart
global.restart = false;

//Data structure for picked up 3up moons
global.moons = ds_map_create();

//Font Variables
global.gui_font	= font_add_sprite(spr_gui_font, ord("!"), 0, 0);
global.gui_font_menu = font_add_sprite(spr_gui_font_menu, ord("!"), 0, 0);
global.gui_font_numbers	= font_add_sprite_ext(spr_gui_font_numbers, "0123456789-", 0, 0);
global.gui_font_numbers_gold = font_add_sprite_ext(spr_gui_font_numbers_gold, "0123456789-", 0, 0);
global.gui_font_numbers_black = font_add_sprite_ext(spr_gui_font_numbers_black, "0123456789-", 0, 0);
global.gui_font_numbers_large = font_add_sprite_ext(spr_gui_font_numbers_large, "0123456789-", 0, 0);
global.gui_font_numbers_large_gold = font_add_sprite_ext(spr_gui_font_numbers_large_gold, "0123456789-", 0, 0);

//Disable application surface automatic drawing
application_surface_draw_enable(false);

//Set up epsilon for floating point numbers
math_set_epsilon(0.00001);