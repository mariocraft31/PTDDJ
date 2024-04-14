function pattern_enable(enable)
{
	shader_set_uniform_i(global.Pattern_Enable, enable);
}

function pattern_set_color_array(color_array) {
	shader_set_uniform_f_array(global.Pattern_Color_Array, color_array);
}

function pattern_set_pattern(sprite, subimg)
{
	if sprite == global.Pattern_Texture_Indexed && global.Pattern_Texture_Indexed != noone
		exit;
	if sprite == noone
		exit;
	
	global.Pattern_Texture_Indexed = sprite;
	var _tex = sprite_get_texture(sprite, subimg);
	texture_set_stage(global.Pattern_Texture, _tex);
	texture_set_interpolation_ext(global.Pattern_Texture, 0);
	var _uvs = sprite_get_uvs(sprite, subimg);
	shader_set_uniform_f(global.Pattern_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
	shader_set_uniform_f(global.Pattern_Tex_Data, _uvs[4], _uvs[5], texture_get_width(_tex) / texture_get_texel_width(_tex), texture_get_height(_tex) / texture_get_texel_height(_tex));
}

function pattern_set_sprite(sprite, subimg, xscale, yscale)
{
	var _tex = sprite_get_texture(sprite, subimg);
	var _uvs = sprite_get_uvs(sprite, subimg);
	shader_set_uniform_f(global.Pattern_Spr_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
	shader_set_uniform_f(global.Pattern_Spr_Tex_Data, _uvs[4], _uvs[5], texture_get_width(_tex) / texture_get_texel_width(_tex), texture_get_height(_tex) / texture_get_texel_height(_tex));
	shader_set_uniform_f(global.Pattern_Spr_Scale, xscale, yscale);
}

function pattern_set(color_array, sprite, subimg, xscale, yscale, pattern)
{
	if pattern == noone
		exit;
	
	pattern_enable(true);
	pattern_set_pattern(pattern, 0);
	pattern_set_sprite(sprite, subimg, xscale, yscale);
	pattern_set_color_array(color_array);
}

function pattern_reset() {
	pattern_enable(false);
}