//Draw enemy
if shake > 0
	draw_sprite_ext( sprite_index, image_index, x + random_range(-shake,shake), y + random_range(-shake,shake), -scale, scale, image_angle, image_blend, image_alpha);
else
	draw_sprite_ext(sprite_index,image_index,x,y,-scale,scale,0,-1,image_alpha);