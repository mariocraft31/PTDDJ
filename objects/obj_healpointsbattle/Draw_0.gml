if totaldamage > 0
    totaldamage = 1;

draw_sprite_ext(spr_flashhit,6,x,y,_image_xscale,_image_yscale,0,-1,_image_alpha);

if instance_exists(obj_itemb)
{
    if obj_itemb.amount < 10
        scr_draw_numbers_blue(x+4,y+3,obj_itemb.amount,1,_image_xscale/1.3,_image_yscale/1.3,0,-1,_image_alpha);
    else if obj_itemb.amount < 100
        scr_draw_numbers_blue(x-4,y+3,obj_itemb.amount,2,_image_xscale/1.3,_image_yscale/1.3,0,-1,_image_alpha);
    else if obj_itemb.amount <= 999
        scr_draw_numbers_blue(x-12,y+3,obj_itemb.amount,3,_image_xscale/1.3,_image_yscale/1.3,0,-1,_image_alpha);
    if obj_itemb.amount = 0
        instance_destroy();

    //Whether to draw HP or BP being healed
    if global.turn = 0 && obj_pep_battle.itemid >= 0 && obj_pep_battle.itemid <= 8
        draw_sprite_ext(spr_hpdisplay,0,x-10,y+14,_image_xscale/1.35,_image_yscale/1.35,0,-1,_image_alpha);
    else if global.turn = 0 && obj_pep_battle.itemid >= 9 && obj_pep_battle.itemid <= 12
        draw_sprite_ext(spr_bpdisplay,0,x-10,y+14,_image_xscale/1.35,_image_yscale/1.35,0,-1,_image_alpha);
    else if global.turn = 1 && obj_gustavob.itemid >= 0 && obj_gustavob.itemid <= 8
        draw_sprite_ext(spr_hpdisplay,0,x-10,y+14,_image_xscale/1.35,_image_yscale/1.35,0,-1,_image_alpha);
    else if global.turn = 1 && obj_gustavob.itemid >= 9 && obj_gustavob.itemid <= 12
        draw_sprite_ext(spr_bpdisplay,0,x-10,y+14,_image_xscale/1.35,_image_yscale/1.35,0,-1,_image_alpha);

}
else if !instance_exists(obj_itemb)
{
    if global.damage < 10
        scr_draw_numbers_blue(x+4,y+3,global.damage,1,_image_xscale/1.3,_image_yscale/1.3,0,-1,_image_alpha);
    else if global.damage < 100
        scr_draw_numbers_blue(x-4,y+3,global.damage,2,_image_xscale/1.3,_image_yscale/1.3,0,-1,_image_alpha);
    else if global.damage <= 999
        scr_draw_numbers_blue(x-12,y+3,global.damage,3,_image_xscale/1.3,_image_yscale/1.3,0,-1,_image_alpha);
    draw_sprite_ext(spr_hpdisplay,0,x-10,y+14,_image_xscale/1.35,_image_yscale/1.35,0,-1,_image_alpha);
}

