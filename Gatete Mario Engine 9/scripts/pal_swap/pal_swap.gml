/// @function					pal_swap_set(pal_sprite,pal_index);
/// @param	pal_sprite			Palette sprite
/// @param	pal_index			Palette index

function pal_swap_set(_pal_sprite, _pal_index) {

	// store information about the shader to be used
	static pal_shader =			shd_palette_swapper;
	static pal_texel_size =		shader_get_uniform(shd_palette_swapper, "texel_size");
	static pal_uvs =			shader_get_uniform(shd_palette_swapper, "palette_UVs");
	static pal_index =			shader_get_uniform(shd_palette_swapper, "palette_index");
	static pal_texture =		shader_get_sampler_index(shd_palette_swapper, "palette_texture");

	shader_set(pal_shader);

	var tex = sprite_get_texture(_pal_sprite, 0);
	var UVs = sprite_get_uvs(_pal_sprite, 0);

	texture_set_stage(pal_texture, tex);
	gpu_set_texfilter_ext(pal_texture, 1)

	var texel_x = texture_get_texel_width(tex);
	var texel_y = texture_get_texel_height(tex);
	var texel_hx = texel_x * 0.5;
	var texel_hy = texel_y * 0.5;

	shader_set_uniform_f(pal_texel_size, texel_x, texel_y);
	shader_set_uniform_f(pal_uvs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
	shader_set_uniform_f(pal_index, _pal_index);

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