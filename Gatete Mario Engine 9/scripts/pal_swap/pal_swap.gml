/// @function pal_swap_init_system();

function pal_swap_init_system() {

	// Telling the compiler to compile this script inline
	gml_pragma("forceinline");

	// Initiate global variables
	globalvar Pal_Shader, Pal_Texel_Size, Pal_UVs, Pal_Index, Pal_Texture;
	Pal_Shader = shd_palette_swapper;
	Pal_Texel_Size = shader_get_uniform(shd_palette_swapper, "texel_size");
	Pal_UVs = shader_get_uniform(shd_palette_swapper, "palette_UVs");
	Pal_Index = shader_get_uniform(shd_palette_swapper, "palette_index");
	Pal_Texture = shader_get_sampler_index(shd_palette_swapper, "palette_texture");

}

/// @function					pal_swap_set(pal_sprite,pal_index);
/// @param	pal_sprite			Palette sprite
/// @param	pal_index			Palette index

function pal_swap_set() {

	shader_set(Pal_Shader);

	var _pal_sprite = argument[0];
	var _pal_index = argument[1];

	var tex = sprite_get_texture(_pal_sprite, 0);
	var UVs = sprite_get_uvs(_pal_sprite, 0);

	texture_set_stage(Pal_Texture, tex);
	gpu_set_texfilter_ext(Pal_Texture, 1)

	var texel_x = texture_get_texel_width(tex);
	var texel_y = texture_get_texel_height(tex);
	var texel_hx = texel_x * 0.5;
	var texel_hy = texel_y * 0.5;

	shader_set_uniform_f(Pal_Texel_Size, texel_x, texel_y);
	shader_set_uniform_f(Pal_UVs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
	shader_set_uniform_f(Pal_Index, _pal_index);

}


/// @function			pal_swap_get_pal_count(pal_sprite);
/// @param pal_sprite	Palette sprite

function pal_swap_get_pal_count() {

	//Telling the compiler to compile this script inline
	gml_pragma("forceinline");

	return sprite_get_width(argument[0]);
	
}

/// @function pal_swap_reset();

function pal_swap_reset() {
	
	shader_reset();
	
}