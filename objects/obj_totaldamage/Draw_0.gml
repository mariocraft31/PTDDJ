draw_sprite_ext(spr_hittype,0,x-4,y-16,_image_xscale,_image_yscale,0,-1,_image_alpha);
//draw_sprite_ext(spr_flashhit,1,x,y,_image_xscale,_image_yscale,0,-1,_image_alpha);
if global.totaldamage < 10
    scr_draw_numbers(x,y,global.totaldamage,1,_image_xscale,_image_yscale,0,-1,_image_alpha);
else if global.totaldamage < 100
    scr_draw_numbers(x-8,y,global.totaldamage,2,_image_xscale,_image_yscale,0,-1,_image_alpha);
else if global.totaldamage <= 999
    scr_draw_numbers(x-16,y,global.totaldamage,3,_image_xscale,_image_yscale,0,-1,_image_alpha);
if global.damage = 0
    instance_destroy();