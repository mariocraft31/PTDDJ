function scr_draw_sprite_3d_z() {
	draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(z,-global.z-270),y+lengthdir_y(z,-global.z-270),image_xscale,image_yscale,-global.z,c_white,1);
}