///draw 3d rotating relative to z axis
function scr_draw_sprite_3d() {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,-global.z,c_white,1);

}
