/// @description Reveals hidden passages when overlapped

/*
//	Make sure you have the following stuff set before using this object
//
//	- A tile layer called "Tileset_Front" with a depth of -6
*/

global.fakeTileAlpha = 1;
if (layer_exists(layer_get_id("Tileset_Front"))) {

	global.layFake = layer_get_id("Tileset_Front");
	global.mapFake = layer_tilemap_get_id(global.layFake);
	global.uFakeTileAlpha = shader_get_uniform(shd_alpha, "alpha");
	layer_script_begin(global.layFake, fake_tile_alpha_set);
	layer_script_end(global.layFake, fake_tile_alpha_reset);
}