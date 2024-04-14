if totaldamage > 0
    totaldamage = 1;
if global.criticalhit = true //Critical Hit
{
    draw_sprite_ext(spr_hittype,2,x,y-16,_image_xscale,_image_yscale,0,-1,_image_alpha);
    //draw_sprite_ext(spr_flashhit,3,x,y,_image_xscale,_image_yscale,0,-1,_image_alpha);
}
/*else if global.takedamage = 1 && global.turn > 1
    draw_sprite_ext(spr_flashhit,4,x,y,_image_xscale,_image_yscale,0,-1,_image_alpha);
else if global.takedamage = 2 && global.turn > 1
    draw_sprite_ext(spr_flashhit,5,x,y,_image_xscale,_image_yscale,0,-1,_image_alpha);*/
else
{
    if global.luckyhit = true && (global.hitrank = 1 or global.hitrank = 3)
    {
        draw_sprite_ext(spr_hittype,1,x,y-16,_image_xscale,_image_yscale,0,-1,_image_alpha); //Lucky
        //draw_sprite_ext(spr_flashhit,2,x,y,_image_xscale,_image_yscale,0,-1,_image_alpha); //Lucky Hit
    }
    //else
     //   draw_sprite_ext(spr_flashhit,0,x,y,_image_xscale,_image_yscale,0,-1,_image_alpha); //Normal Hit
}
if global.damage < 10
    scr_draw_numbers(x,y,global.damage,1,_image_xscale,_image_yscale,0,-1,_image_alpha);
else if global.damage < 100
    scr_draw_numbers(x-8,y,global.damage,2,_image_xscale,_image_yscale,0,-1,_image_alpha);
else if global.damage <= 999
    scr_draw_numbers(x-16,y,global.damage,3,_image_xscale,_image_yscale,0,-1,_image_alpha);
if global.damage = 0
    instance_destroy();