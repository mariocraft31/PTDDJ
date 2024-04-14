function scr_draw_shadow() {
	//draw shadow according to z height and zfloor
	draw_sprite_ext(spr_shadow,image_index,x+lengthdir_x(floorz,-global.z-270),y,2,2,-global.z,c_white,1);
}
