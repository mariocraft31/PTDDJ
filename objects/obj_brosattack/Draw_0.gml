//Draw sprite
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,0,-1,1);

//Show A button
/*if global.turn = 0 && ready = 1
    draw_sprite_ext(spr_mariochoose,-1,room_width-16,room_height-8,1,1,0,-1,1);
else if global.turn = 1 && ready = 1
    draw_sprite_ext(spr_gustavochoose,-1,room_width-16,room_height-8,1,1,0,-1,1);