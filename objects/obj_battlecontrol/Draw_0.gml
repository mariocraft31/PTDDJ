//Show Counterattack HUD
if global.turn = 2 && obj_pep_battle.stance <> 7 && obj_gustavob.stance <> 7
{
    //Mario Counterattack HUD
    if global.Pdead = 0 or global.Pdead = 0.5 && instance_exists(obj_pep_battle)
    {
        /*draw_sprite_ext(spr_defensedisplay,0,52,52,1,1,0,-1,1);
        if obj_pep_battle.phase = -1
            draw_sprite(spr_jumpdefense,-1,56,50);
        if obj_pep_battle.phase = -2
            draw_sprite(spr_hammerdefense,-1,56,54);*/ //When counterattacking with the hammer
    }

    //gustavo Counterattack HUD
    if global.Gdead = 0 or global.Gdead = 0.5 && instance_exists(obj_gustavob)
    {
		/*draw_sprite_ext(spr_defensedisplay,1,28,68,1,1,0,-1,1);
        if obj_gustavob.phase = -1
            draw_sprite(spr_jumpdefense,-1,32,66);
        if obj_gustavob.phase = -2
            draw_sprite(spr_hammerdefense,-1,32,70);*/ //When counterattacking with the hammer
    }
}
//Fade in pad when background fades out
if padvisibility > 0 && global.turn = -1.5
{
    if obj_pep_battle.visible = true && instance_exists(obj_pep_battle)
        draw_sprite_ext(spr_winstrikedisplay,0,104,134,1,1,0,-1,padvisibility);
    else if obj_gustavob.visible = true && instance_exists(obj_gustavob)
        draw_sprite_ext(spr_winstrikedisplay,1,104,134,1,1,0,-1,padvisibility);
}
//Mario's Level Up
if global.turn = -1.25 && global.Pdead = 0 && instance_exists(obj_pep_battle)
{
    //Draw Level Up Display
    draw_sprite_ext(spr_levelupdisplay,0,146,38,1,1,1,-1,1);
    //Draw Mario's name
    draw_sprite_ext(spr_bronames,0,104,186,1,1,0,-1,1);
    //Draw LVL
     draw_sprite_ext(spr_lvl,0,74,205,1,1,0,-1,1);
    //Draw level number
    if global.Plvl < 10
        scr_draw_numbers(106,194,global.Plvl,1,1,1,0,c_yellow,0.8);
    else if global.Plvl < 100
        scr_draw_numbers(96,194,global.Plvl,2,1,1,0,c_yellow,0.8);     
    else if global.Plvl >= 99
        global.Plvl = 99;
    //Draw pad
    draw_sprite_ext(spr_winstrikedisplay,0,104,134,1,1,0,-1,1);
    //Draw Level Up Bars 
    if instance_exists(obj_levelupbonus) && obj_levelupbonus.moveto = 0
    {
        if obj_levelupbonus.movechoose = 52
            draw_sprite_ext(spr_levelupbardisplay,0,272,76,1,1,0,c_blue,1); //HP highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,76,1,1,0,-1,1); //HP
        if obj_levelupbonus.movechoose = 76
            draw_sprite_ext(spr_levelupbardisplay,0,272,100,1,1,0,c_blue,1); //BP highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,100,1,1,0,-1,1); //BP
        if obj_levelupbonus.movechoose = 100
            draw_sprite_ext(spr_levelupbardisplay,0,272,124,1,1,0,c_blue,1); //POW highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,124,1,1,0,-1,1); //POW
        if obj_levelupbonus.movechoose = 124
            draw_sprite_ext(spr_levelupbardisplay,0,272,148,1,1,0,c_blue,1); //DEF highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,148,1,1,0,-1,1); //DEF
        if obj_levelupbonus.movechoose = 148
            draw_sprite_ext(spr_levelupbardisplay,0,272,172,1,1,0,c_blue,1); //SPEED highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,172,1,1,0,-1,1); //SPEED
        if obj_levelupbonus.movechoose = 172
            draw_sprite_ext(spr_levelupbardisplay,0,272,196,1,1,0,c_blue,1); //STACHE highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,196,1,1,0,-1,1); //STACHE  
    }
    else
    {
        draw_sprite_ext(spr_levelupbardisplay,0,272,76,1,1,0,-1,1); //HP
        draw_sprite_ext(spr_levelupbardisplay,0,272,100,1,1,0,-1,1); //BP
        draw_sprite_ext(spr_levelupbardisplay,0,272,124,1,1,0,-1,1); //POW
        draw_sprite_ext(spr_levelupbardisplay,0,272,148,1,1,0,-1,1); //DEF
        draw_sprite_ext(spr_levelupbardisplay,0,272,172,1,1,0,-1,1); //SPEED
        draw_sprite_ext(spr_levelupbardisplay,0,272,196,1,1,0,-1,1); //STACHE    
    }
    //Draw Level Up Stats
    draw_sprite_ext(spr_levelupstatsdisplay,0,222,76,1,1,0,-1,1); //HP
    draw_sprite_ext(spr_levelupstatsdisplay,1,222,100,1,1,0,-1,1); //BP
    draw_sprite_ext(spr_levelupstatsdisplay,2,222,124,1,1,0,-1,1); //POW
    draw_sprite_ext(spr_levelupstatsdisplay,3,222,148,1,1,0,-1,1); //DEF
    draw_sprite_ext(spr_levelupstatsdisplay,4,222,172,1,1,0,-1,1); //SPEED
    draw_sprite_ext(spr_levelupstatsdisplay,5,222,196,1,1,0,-1,1); //STACHE
    //Draw stats earned
    if hpamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,68,1,1,0,-1,0.8); //HP+
    if bpamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,92,1,1,0,-1,0.8); //BP+
    if powamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,116,1,1,0,-1,0.8); //POW+
    if defamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,140,1,1,0,-1,0.8); //DEF+
    if spdamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,164,1,1,0,-1,0.8); //SPEED+
    if stacheamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,188,1,1,0,-1,0.8); //STACHE+
    //Draw Mario's Stats
    //Draw Mario's HP
    if global.maxPHP < 10
        scr_draw_numbers(328,66,global.maxPHP,1,0.85,0.85,0,c_yellow,0.8);
    else if global.maxPHP < 100
        scr_draw_numbers(314,66,global.maxPHP,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.maxPHP < 1000
        scr_draw_numbers(300,66,global.maxPHP,3,0.85,0.85,0,c_yellow,0.8);  
    if global.maxPHP >= 999
        global.maxPHP = 999;        
    //Mario's HP earned
    if hpamount >= 0
        scr_draw_numbers(376,66,hpamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw Mario's BP
    if global.maxPBP < 10
        scr_draw_numbers(328,90,global.maxPBP,1,0.85,0.85,0,c_yellow,0.8);
    else if global.maxPBP < 100
        scr_draw_numbers(314,90,global.maxPBP,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.maxPBP < 1000
        scr_draw_numbers(300,90,global.maxPBP,3,0.85,0.85,0,c_yellow,0.8);  
    if global.maxPBP >= 999
        global.maxPBP = 999;        
    //Mario's BP earned
    if bpamount >= 0
        scr_draw_numbers(376,90,bpamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw Mario's POW
    if global.Ppow < 10
        scr_draw_numbers(328,114,global.Ppow,1,0.85,0.85,0,c_yellow,0.8);
    else if global.Ppow < 100
        scr_draw_numbers(314,114,global.Ppow,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.Ppow < 1000
        scr_draw_numbers(300,114,global.Ppow,3,0.85,0.85,0,c_yellow,0.8);  
    if global.Ppow >= 999
        global.Ppow = 999;        
    //Mario's POW earned
    if powamount >= 0
        scr_draw_numbers(376,114,powamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw Mario's DEF
    if global.Pdef < 10
        scr_draw_numbers(328,138,global.Pdef,1,0.85,0.85,0,c_yellow,0.8);
    else if global.Pdef < 100
        scr_draw_numbers(314,138,global.Pdef,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.Pdef < 1000
        scr_draw_numbers(300,138,global.Pdef,3,0.85,0.85,0,c_yellow,0.8);  
    if global.Pdef >= 999
        global.Pdef = 999;        
    //Mario's DEF earned
    if defamount >= 0
        scr_draw_numbers(376,138,defamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw Mario's SPEED
    if global.Pspd < 10
        scr_draw_numbers(328,162,global.Pspd,1,0.85,0.85,0,c_yellow,0.8);
    else if global.Pspd < 100
        scr_draw_numbers(314,162,global.Pspd,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.Pspd < 1000
        scr_draw_numbers(300,162,global.Pspd,3,0.85,0.85,0,c_yellow,0.8);  
    if global.Pspd >= 999
        global.Pspd = 999;        
    //Mario's SPEED earned
    if spdamount >= 0
        scr_draw_numbers(376,162,spdamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw Mario's STACHE
    if global.Pstache < 10
        scr_draw_numbers(328,186,global.Pstache,1,0.85,0.85,0,c_yellow,0.8);
    else if global.Pstache < 100
        scr_draw_numbers(314,186,global.Pstache,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.Pstache < 1000
        scr_draw_numbers(300,186,global.Pstache,3,0.85,0.85,0,c_yellow,0.8);  
    if global.Pstache >= 999
        global.Pstache = 999;        
    //Mario's STACHE earned
    if stacheamount >= 0
        scr_draw_numbers(376,186,stacheamount,1,0.85,0.85,0,c_yellow,0.8);
}
//gustavo's Level Up
if global.turn = -1.75 && global.Gdead = 0 && instance_exists(obj_gustavob)
{
    //Draw Level Up Display
    draw_sprite_ext(spr_levelupdisplay,0,146,38,1,1,1,-1,1);
    //Draw gustavo's name
    draw_sprite_ext(spr_bronames,1,104,186,1,1,0,-1,1);
    //Draw LVL
     draw_sprite_ext(spr_lvl,0,74,205,1,1,0,-1,1);
    //Draw level number
    if global.Glvl < 10
        scr_draw_numbers(106,194,global.Glvl,1,1,1,0,c_yellow,0.8);
    else if global.Glvl < 100
        scr_draw_numbers(96,194,global.Glvl,2,1,1,0,c_yellow,0.8);     
    else if global.Glvl >= 99
        global.Glvl = 99;
    //Draw pad
    draw_sprite_ext(spr_winstrikedisplay,1,104,134,1,1,0,-1,1);
    //Draw Level Up Bars 
    if instance_exists(obj_levelupbonus) && obj_levelupbonus.moveto = 0
    {
        if obj_levelupbonus.movechoose = 52
            draw_sprite_ext(spr_levelupbardisplay,0,272,76,1,1,0,c_blue,1); //HP highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,76,1,1,0,-1,1); //HP
        if obj_levelupbonus.movechoose = 76
            draw_sprite_ext(spr_levelupbardisplay,0,272,100,1,1,0,c_blue,1); //BP highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,100,1,1,0,-1,1); //BP
        if obj_levelupbonus.movechoose = 100
            draw_sprite_ext(spr_levelupbardisplay,0,272,124,1,1,0,c_blue,1); //POW highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,124,1,1,0,-1,1); //POW
        if obj_levelupbonus.movechoose = 124
            draw_sprite_ext(spr_levelupbardisplay,0,272,148,1,1,0,c_blue,1); //DEF highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,148,1,1,0,-1,1); //DEF
        if obj_levelupbonus.movechoose = 148
            draw_sprite_ext(spr_levelupbardisplay,0,272,172,1,1,0,c_blue,1); //SPEED highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,172,1,1,0,-1,1); //SPEED
        if obj_levelupbonus.movechoose = 172
            draw_sprite_ext(spr_levelupbardisplay,0,272,196,1,1,0,c_blue,1); //STACHE highlighted
        else
            draw_sprite_ext(spr_levelupbardisplay,0,272,196,1,1,0,-1,1); //STACHE  
    }
    else
    {
        draw_sprite_ext(spr_levelupbardisplay,0,272,76,1,1,0,-1,1); //HP
        draw_sprite_ext(spr_levelupbardisplay,0,272,100,1,1,0,-1,1); //BP
        draw_sprite_ext(spr_levelupbardisplay,0,272,124,1,1,0,-1,1); //POW
        draw_sprite_ext(spr_levelupbardisplay,0,272,148,1,1,0,-1,1); //DEF
        draw_sprite_ext(spr_levelupbardisplay,0,272,172,1,1,0,-1,1); //SPEED
        draw_sprite_ext(spr_levelupbardisplay,0,272,196,1,1,0,-1,1); //STACHE    
    }
    //Draw Level Up Stats
    draw_sprite_ext(spr_levelupstatsdisplay,0,222,76,1,1,0,-1,1); //HP
    draw_sprite_ext(spr_levelupstatsdisplay,1,222,100,1,1,0,-1,1); //BP
    draw_sprite_ext(spr_levelupstatsdisplay,2,222,124,1,1,0,-1,1); //POW
    draw_sprite_ext(spr_levelupstatsdisplay,3,222,148,1,1,0,-1,1); //DEF
    draw_sprite_ext(spr_levelupstatsdisplay,4,222,172,1,1,0,-1,1); //SPEED
    draw_sprite_ext(spr_levelupstatsdisplay,5,222,196,1,1,0,-1,1); //STACHE
    //Draw stats earned
    if hpamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,68,1,1,0,-1,0.8); //HP+
    if bpamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,92,1,1,0,-1,0.8); //BP+
    if powamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,116,1,1,0,-1,0.8); //POW+
    if defamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,140,1,1,0,-1,0.8); //DEF+
    if spdamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,164,1,1,0,-1,0.8); //SPEED+
    if stacheamount >= 0
        draw_sprite_ext(spr_mathmaticalsymbols,0,356,188,1,1,0,-1,0.8); //STACHE+
    //Draw gustavo's Stats
    //Draw gustavo's HP
    if global.maxGHP < 10
        scr_draw_numbers(328,66,global.maxGHP,1,0.85,0.85,0,c_yellow,0.8);
    else if global.maxGHP < 100
        scr_draw_numbers(314,66,global.maxGHP,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.maxGHP < 1000
        scr_draw_numbers(300,66,global.maxGHP,3,0.85,0.85,0,c_yellow,0.8);  
    if global.maxGHP >= 999
        global.maxGHP = 999;        
    //gustavo's HP earned
    if hpamount >= 0
        scr_draw_numbers(376,66,hpamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw gustavo's BP
    if global.maxGBP < 10
        scr_draw_numbers(328,90,global.maxGBP,1,0.85,0.85,0,c_yellow,0.8);
    else if global.maxGBP < 100
        scr_draw_numbers(314,90,global.maxGBP,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.maxGBP < 1000
        scr_draw_numbers(300,90,global.maxGBP,3,0.85,0.85,0,c_yellow,0.8);  
    if global.maxGBP >= 999
        global.maxGBP = 999;        
    //gustavo's BP earned
    if bpamount >= 0
        scr_draw_numbers(376,90,bpamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw gustavo's POW
    if global.Gpow < 10
        scr_draw_numbers(328,114,global.Gpow,1,0.85,0.85,0,c_yellow,0.8);
    else if global.Gpow < 100
        scr_draw_numbers(314,114,global.Gpow,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.Gpow < 1000
        scr_draw_numbers(300,114,global.Gpow,3,0.85,0.85,0,c_yellow,0.8);  
    if global.Gpow >= 999
        global.Gpow = 999;        
    //gustavo's POW earned
    if powamount >= 0
        scr_draw_numbers(376,114,powamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw gustavo's DEF
    if global.Gdef < 10
        scr_draw_numbers(328,138,global.Gdef,1,0.85,0.85,0,c_yellow,0.8);
    else if global.Gdef < 100
        scr_draw_numbers(314,138,global.Gdef,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.Gdef < 1000
        scr_draw_numbers(300,138,global.Gdef,3,0.85,0.85,0,c_yellow,0.8);  
    if global.Gdef >= 999
        global.Gdef = 999;        
    //gustavo's DEF earned
    if defamount >= 0
        scr_draw_numbers(376,138,defamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw gustavo's SPEED
    if global.Gspd < 10
        scr_draw_numbers(328,162,global.Gspd,1,0.85,0.85,0,c_yellow,0.8);
    else if global.Gspd < 100
        scr_draw_numbers(314,162,global.Gspd,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.Gspd < 1000
        scr_draw_numbers(300,162,global.Gspd,3,0.85,0.85,0,c_yellow,0.8);  
    if global.Gspd >= 999
        global.Gspd = 999;        
    //gustavo's SPEED earned
    if spdamount >= 0
        scr_draw_numbers(376,162,spdamount,1,0.85,0.85,0,c_yellow,0.8);
    //Draw gustavo's STACHE
    if global.Gstache < 10
        scr_draw_numbers(328,186,global.Gstache,1,0.85,0.85,0,c_yellow,0.8);
    else if global.Gstache < 100
        scr_draw_numbers(314,186,global.Gstache,2,0.85,0.85,0,c_yellow,0.8);     
    else if global.Gstache < 1000
        scr_draw_numbers(300,186,global.Gstache,3,0.85,0.85,0,c_yellow,0.8);  
    if global.Gstache >= 999
        global.Gstache = 999;        
    //gustavo's STACHE earned
    if stacheamount >= 0
        scr_draw_numbers(376,186,stacheamount,1,0.85,0.85,0,c_yellow,0.8);
}
if global.GameOver = true
{
    depth = -999;
    draw_sprite(spr_gameover,-1,room_width/2,room_height/2);
}
//Show Victory Stats
if global.turn = -1
{
    if global.Pdead = 0 && instance_exists(obj_pep_battle)
    {
        //Draw Win Display
        draw_sprite_ext(spr_mariowindisplay2,2,245,76,1,1,0,-1,0.8);
        draw_sprite_ext(spr_mariowindisplay,0,245,70,1,1,0,-1,1);
        //Show EXP
        draw_sprite_ext(spr_exp,0,158,50,1,1,0,-1,0.8);
        //Draw Mario's name
        draw_sprite_ext(spr_bronames,0,249,62,1,1,0,-1,0.8);
        //Draw EXP earned
        draw_sprite_ext(spr_mathmaticalsymbols,0,212,72,1,1,0,-1,0.8);
        if global.experience < 10
            scr_draw_numbers_empty(266,71,global.experience,1,0.75,0.75,0,c_yellow,0.8);
        else if global.experience < 100
            scr_draw_numbers_empty(256,71,global.experience,2,0.75,0.75,0,c_yellow,0.8);
        else if global.experience < 1000
            scr_draw_numbers_empty(244,71,global.experience,3,0.75,0.75,0,c_yellow,0.8);
        else if global.experience < 10000
            scr_draw_numbers_empty(232,71,global.experience,4,0.75,0.75,0,c_yellow,0.8);
        //Draw total EXP for Mario
        if global.Pexp < 10
            scr_draw_numbers_empty(240,91,global.Pexp,1,0.85,0.85,0,c_yellow,0.8);
        else if global.Pexp < 100
            scr_draw_numbers_empty(234,91,global.Pexp,2,0.85,0.85,0,c_yellow,0.8);
        else if global.Pexp < 1000
            scr_draw_numbers_empty(228,91,global.Pexp,3,0.85,0.85,0,c_yellow,0.8);
        else if global.Pexp < 10000
            scr_draw_numbers_empty(224,91,global.Pexp,4,0.85,0.85,0,c_yellow,0.8);
        else if global.Pexp < 100000
            scr_draw_numbers_empty(218,91,global.Pexp,5,0.85,0.85,0,c_yellow,0.8);
        else if global.Pexp < 1000000
            scr_draw_numbers_empty(210,91,global.Pexp,6,0.85,0.85,0,c_yellow,0.8);
        else if global.Pexp < 10000000
            scr_draw_numbers_empty(206,91,global.Pexp,7,0.85,0.85,0,c_yellow,0.8);
        if global.Pexp >= 9999999
            global.Pexp = 9999999;
    }
    if global.Pdead > 1 && instance_exists(obj_pep_battle)
    {
        //Draw Win Display
        draw_sprite_ext(spr_mariowindisplay2,2,245,76,1,1,0,-1,0.4);
        draw_sprite_ext(spr_mariowindisplay,0,245,70,1,1,0,-1,0.4);
    }
    if global.Gdead = 0 && instance_exists(obj_gustavob)
    {
        //Draw Win Display
        draw_sprite_ext(spr_luigiwindisplay2,2,245,146,1,1,0,-1,0.8);
        draw_sprite_ext(spr_luigiwindisplay,0,245,140,1,1,0,-1,1);
        //Show EXP
        draw_sprite_ext(spr_exp,0,158,120,1,1,0,-1,0.8);
        //Draw gustavo's name
        draw_sprite_ext(spr_bronames,1,249,132,1,1,0,-1,0.8);
        //Draw EXP earned
        draw_sprite_ext(spr_mathmaticalsymbols,0,212,141,1,1,0,-1,0.8);
        if global.experience < 10
            scr_draw_numbers_empty(266,141,global.experience,1,0.75,0.75,0,c_yellow,0.8);
        else if global.experience < 100
            scr_draw_numbers_empty(256,141,global.experience,2,0.75,0.75,0,c_yellow,0.8);
        else if global.experience < 1000
            scr_draw_numbers_empty(244,141,global.experience,3,0.75,0.75,0,c_yellow,0.8);
        else if global.experience < 10000
            scr_draw_numbers_empty(232,141,global.experience,4,0.75,0.75,0,c_yellow,0.8);
        //Draw total EXP for gustavo
        if global.Gexp < 10
            scr_draw_numbers_empty(240,161,global.Gexp,1,0.85,0.85,0,c_yellow,0.8);
        else if global.Gexp < 100
            scr_draw_numbers_empty(234,161,global.Gexp,2,0.85,0.85,0,c_yellow,0.8);
        else if global.Gexp < 1000
            scr_draw_numbers_empty(228,161,global.Gexp,3,0.85,0.85,0,c_yellow,0.8);
        else if global.Gexp < 10000
            scr_draw_numbers_empty(224,161,global.Gexp,4,0.85,0.85,0,c_yellow,0.8);
        else if global.Gexp < 100000
            scr_draw_numbers_empty(218,161,global.Gexp,5,0.85,0.85,0,c_yellow,0.8);
        else if global.Gexp < 1000000
            scr_draw_numbers_empty(210,161,global.Gexp,6,0.85,0.85,0,c_yellow,0.8);
        else if global.Gexp < 10000000
            scr_draw_numbers_empty(206,161,global.Gexp,7,0.85,0.85,0,c_yellow,0.8);
        if global.Gexp >= 9999999
            global.Gexp = 9999999;
    }
    if global.Gdead > 1 && instance_exists(obj_gustavob)
    {
        //Draw Win Display
        draw_sprite_ext(spr_luigiwindisplay2,2,245,146,1,1,0,-1,0.4);
        draw_sprite_ext(spr_luigiwindisplay,0,245,140,1,1,0,-1,0.4);
    }
    //Draw Coins Display
    draw_sprite_ext(spr_coinwindisplay2,0,245,198,1,1,0,-1,1);
    draw_sprite_ext(spr_coinwindisplay,0,245,202,1,1,0,-1,1);
    //Show Coin
    draw_sprite_ext(spr_coins,0,158,202,1,1,0,-1,0.8);
    //Draw Coins earned
    draw_sprite_ext(spr_mathmaticalsymbols,0,212,194,1,1,0,-1,0.8);    
    if global.coinsearned < 10
        scr_draw_numbers_empty(300,193,global.coinsearned,1,0.75,0.75,0,c_yellow,0.8);
    else if global.coinsearned < 100
        scr_draw_numbers_empty(294,193,global.coinsearned,2,0.75,0.75,0,c_yellow,0.8);
    else if global.coinsearned < 1000
        scr_draw_numbers_empty(288,193,global.coinsearned,3,0.75,0.75,0,c_yellow,0.8);
    else if global.coinsearned < 10000
        scr_draw_numbers_empty(284,193,global.coinsearned,4,0.75,0.75,0,c_yellow,0.8);
    //Draw total coins
    if global.coins < 10
        scr_draw_numbers_empty(240,213,global.coins,1,0.85,0.85,0,c_yellow,0.8);
    else if global.coins < 100
        scr_draw_numbers_empty(234,213,global.coins,2,0.85,0.85,0,c_yellow,0.8);
    else if global.coins < 1000
        scr_draw_numbers_empty(228,213,global.coins,3,0.85,0.85,0,c_yellow,0.8);
    else if global.coins < 10000
        scr_draw_numbers_empty(224,213,global.coins,4,0.85,0.85,0,c_yellow,0.8);
    else if global.coins < 100000
        scr_draw_numbers_empty(218,213,global.coins,5,0.85,0.85,0,c_yellow,0.8);
    else if global.coins < 1000000
        scr_draw_numbers_empty(210,213,global.coins,6,0.85,0.85,0,c_yellow,0.8);
    if global.coins >= 999999
        global.coins = 999999;
}

    //Show A button
    if global.turn = -1 && (obj_pep_battle.stance >= 8 && obj_pep_battle.stance <= 10) or (obj_gustavob.stance >= 8
    && obj_gustavob.stance <= 10) && global.experience = 0 && (obj_pep_battle.x = 108 or obj_gustavob.x = 107)
        draw_sprite_ext(spr_mariochoose,-1,room_width-16,room_height-8,1,1,0,-1,_alpha);