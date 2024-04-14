//draw_sprite(mask_index,0,x,y)
//Draw shadow
if ground = 0
{
    if z < 10
        draw_sprite(spr_shadow1,image_index,x,y);
    if z >= 10 && z < 20
        draw_sprite(spr_shadow2,image_index,x,y);
    if z >= 20
        draw_sprite(spr_shadow3,image_index,x,y);
}
/*if ground = 1
    draw_sprite(spr_shadow2,image_index,x,y-2);*/

//Draw gustavo without moving his mask
draw_sprite_ext(sprite_index,image_index,x,y-z,1,1,image_angle,image_blend,1);

//Draws Battle Blocks
if global.turn = 1 && phase = 1 or phase = 2
{
    if battleblock = 0 //Solo Block
    {
        /*if global.runaway = 0
            draw_sprite_ext(spr_runblock2,0,x,y-83,0.75,0.75,0,-1,1);
        else
            draw_sprite_ext(spr_runblock,0,x,y-83,0.75,0.75,0,-1,1);*/
        if phase = 1 || phase = 2 || movechoose = 1 || movechoose = 2 || movechoose = 1
            draw_sprite(spr_battle_menu,0,x+24,y-96); //Solo
    }
    if battleblock = 1 //Bros Block
    {
        draw_sprite(spr_battle_menu,1,x+24,y-96); //Solo
    }
    if battleblock = 2 //Run Block
    {
         draw_sprite(spr_battle_menu,2,x+24,y-96); //Solo
    }
    if battleblock = 3 //Item Block
    {
        draw_sprite(spr_battle_menu,3,x+24,y-96); //Solo
    }
}

if global.turn = 1 && phase = 3
{
    if targetchoose = 0
        draw_sprite(spr_back1,0,0,8);
    if targetchoose < 0
        draw_sprite(spr_back2,0,0,8);
}

if global.turn = 0
    phase = 0;
if global.turn = 2
{
    if stance = 4
        phase = -2;
    else
        phase = -1;
}

//Create Thunderball
if sprite_index = spr_luigibhandstrikestart
    draw_sprite(spr_thunderballb,-1,x+20,y-20);

//Draws the B symbol
if phase = 1
    draw_sprite(spr_luigichoose,-1,x-12,y-32);

draw_set_font(global.extra_font);
draw_set_halign(fa_right);
draw_set_color(c_white);

if phase = 2
{
    //if someone has an easier way to do this, then change it and send me the file via email
    drawat = 0;
    itemnum = 0;
    //Solo
    if battleblock = 0
    {
        draw_sprite(spr_text_box_2,0,x+64,y-40);
        draw_sprite(spr_luigichoose2,-1,x+64,y-56+(16*movechoose));
        drawat = solonum;
        if solonum > 0
            draw_sprite(spr_jumpcommand,0,x+112,y-30);
        if solonum > 1
            draw_sprite(spr_hammercommand,0,x+112,y-16);
        if solonum > 2
            draw_sprite(spr_handcommand,0,x+112,y);
    }
    //Bros
    if battleblock = 1
    {
        draw_sprite(spr_text_box_4,0,x+64,y-44-24); //Bros Attacks HUD
        //draw_sprite(spr_button_help,0,x+68,y+66-12); //Bros Attacks HELP Button
        //draw_sprite(spr_button_practice,0,x+168,y+66-12); //Bros Attacks PRACTICE Button
        draw_sprite(spr_luigichoose2,-1,x+64,y-64-24+(23*movechoose)); //Selector
        
        draw_set_font(global.extra_font);
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        
        drawat = brositemdifmax;
        if brositemdifmax > 0 //Green Shells
        {
            if global.GBP >= 4
            {
                draw_text_transformed(x+72,y-40-24+(23*0),string_hash_to_newline("Kick the rat"),1,1,0);
                //draw_sprite_ext(spr_brositems,0,x+64,y-44-24,0.75,0.75,0,-1,1);
                scr_draw_numbers_empty_blue(x+212,y-40-24,4,2,0.75,0.75,0,c_white,1); //Cost of 4 BP
            }
            else
            {
                draw_text_transformed_colour(x+72,y-40-24+(23*0),string_hash_to_newline("Kick the rat"),1,1,0,c_gray,c_gray,c_gray,c_gray,1);
                //draw_sprite_ext(spr_brositems,0,x+64,y-44-24,0.75,0.75,0,c_gray,1);
                scr_draw_numbers_empty_blue(x+212,y-40-24,4,2,0.75,0.75,0,c_gray,1); //Not enough BP
            }
        }
        if brositemdifmax > 1 //Fire Flowers
        {
            if global.GBP >= 6
            {
                draw_text_transformed(x+92,y-40-24+(23*1),string_hash_to_newline("Fire Flower"),0.75,0.75,0);
                draw_sprite_ext(spr_brositems,1,x+64,y-22-24,0.75,0.75,0,-1,1);
                scr_draw_numbers_empty_blue(x+212,y-18-24,6,2,1,1,0,c_white,1); //Cost of 6 BP
            }
            else
            {
                draw_text_transformed_colour(x+92,y-40-24+(23*1),string_hash_to_newline("Fire Flower"),0.75,0.75,0,c_gray,c_gray,c_gray,c_gray,1);
                draw_sprite_ext(spr_brositems,1,x+64,y-22-24,0.75,0.75,0,c_gray,1);
                scr_draw_numbers_empty_blue(x+212,y-18-24,6,2,1,1,0,c_gray,1); //Not enough BP
            }
        }
        if brositemdifmax > 2 //Jump Helmets
        {
            if global.GBP >= 10
            {
                draw_text_transformed(x+92,y-40-24+(23*2),string_hash_to_newline("Jump Helmet"),0.75,0.75,0);
                draw_sprite_ext(spr_brositems,2,x+64,y+2-24,0.75,0.75,0,-1,1);
                scr_draw_numbers_empty_blue(x+212,y+4-24,10,2,1,1,0,c_white,1); //Cost of 10 BP
            }
            else
            {
                draw_text_transformed_colour(x+92,y-40-24+(23*2),string_hash_to_newline("Fire Flower"),0.75,0.75,0,c_gray,c_gray,c_gray,c_gray,1);
                draw_sprite_ext(spr_brositems,2,x+64,y+2-24,0.75,0.75,0,c_gray,1);
                scr_draw_numbers_empty_blue(x+212,y+4-24,10,2,1,1,0,c_gray,1); //Not enough BP
            }
        }
        if brositemdifmax > 3 //Broken Hearts
        {
            if global.GBP >= 14
            {
                draw_text_transformed(x+92,y-40-24+(23*3),string_hash_to_newline("Broken Heart"),0.75,0.75,0);
                draw_sprite_ext(spr_brositems,3,x+64,y+24-24,0.75,0.75,0,-1,1);
                scr_draw_numbers_empty_blue(x+212,y+26-24,14,2,0.75,0.75,0,c_white,1); //Cost of 14 BP
            }
            else
            {
                draw_text_transformed_colour(x+92,y-40-24+(23*3),string_hash_to_newline("Broken Heart"),0.75,0.75,0,c_gray,c_gray,c_gray,c_gray,1);
                draw_sprite_ext(spr_brositems,3,x+64,y+24-24,0.75,0.75,0,c_gray,1);
                scr_draw_numbers_empty_blue(x+212,y+26-24,14,2,0.75,0.75,0,c_gray,1); //Not enough BP
            }
        }        
        if brositemdifmax > 4
        {
            //draw_sprite(spr_uparrow,-1,200,88);
            //draw_sprite(spr_downarrow,-1,304,y+180);
        }
        //For the Help Menu
        //draw_sprite_ext(spr_text_box_5,0,112,48,1,1,0,-1,1);  //Placed in the center of the screen, its x = 112 and y = 48 
    }
    //Run
    if battleblock = 2
    {
        drawat = 2;
        draw_sprite(spr_text_box_2,0,x+64,y-40);
        draw_sprite(spr_luigichoose2,-1,x+64,y-56+(16*movechoose));
        draw_sprite(spr_runawaycommand,0,x+102,y-30);
        draw_sprite(spr_idlecommand,0,x+102,y-16);
    }
    //Items
    if battleblock = 3
        event_user(3);
}

if phase = 3 && battleblock < 2 && battleblock <> 3 //Choose enemy
{
    if targetchoose != 0
    {
        if instance_exists(obj_battlecontrol.enemyid[targetchoose])
            draw_sprite(spr_luigichoose3,-1,targetidaboutto.x,targetidaboutto.y-targetidaboutto.headz);
    }
    if targetchoose = 0
        draw_sprite(spr_luigichoose,-1,x-12,y-32);
}
if phase = 3 && battleblock = 3 //Choose brother
{
    if targetchoose != 0
    {
        if instance_exists(obj_battlecontrol.broid[targetchoose])
            draw_sprite(spr_luigichoose3,-1,targetidaboutto.x,targetidaboutto.y-targetidaboutto.z-24);
    }
    if targetchoose = 0
        draw_sprite(spr_luigichoose,-1,x-12,y-32);
}

//Show Display
if phase = -3 or phase = 3 or phase = 4 or phase = 0.25 or phase = 0.5 or phase = 0.75
or phase = 5 or obj_pep_battle.phase = -3 or obj_pep_battle.phase = 3 or obj_pep_battle.phase = 4
or obj_pep_battle.phase = 0.25 or obj_pep_battle.phase = 0.5 or obj_pep_battle.phase = 0.75
or obj_pep_battle.phase = 5 or stance = 7 or obj_pep_battle.stance = 7 or stance = 8
or obj_pep_battle.stance = 8
{
    if global.takedamage = 1
    {
        if global.turn = 1 //If it is gustavo's turn
        {
            //draw_sprite(spr_luigidisplay,0,16,214); //Full Display
            //Show BP
            if global.GBP <= global.maxGBP*0.10 && global.turn = 1 //Show this when BP is less than 10%
                scr_draw_numbers_empty(26,222,global.GBP,3,1,1,0,c_red,1);
            else if global.turn = 1
                scr_draw_numbers_empty(26,222,global.GBP,3,1,1,0,c_aqua,1);
            //Show HP
            if global.GHP <= global.maxGHP*0.10 //Show this when HP is less than 10%
                scr_draw_numbers_empty(22,222-16,global.GHP,3,1,1,0,c_red,1);
            else
                scr_draw_numbers_empty(22,222-16,global.GHP,3,1,1,0,c_white,1);
            //draw_sprite(spr_hpdisplay,-1,8,224-16);
            //draw_sprite(spr_bpdisplay,-1,8,224);
        }
        else
        {
            //draw_sprite(spr_luigidisplay,0,16,214+16); //Half Display
            //Show HP
            if global.GHP <= global.maxGHP*0.10 //Show this when HP is less than 10%
                scr_draw_numbers_empty(26,222,global.GHP,3,1,1,0,c_red,1);
            else
                scr_draw_numbers_empty(26,222,global.GHP,3,1,1,0,c_white,1);
            draw_sprite(spr_hpdisplay,-1,8,224);
        }
    }
}
else
{
    if global.turn = 1 //If it is gustavo's turn
    {
        //draw_sprite(spr_luigidisplay,0,16,214); //Full Display
        //Show BP
        if global.GBP <= global.maxGBP*0.10 && global.turn = 1 //Show this when BP is less than 10%
            scr_draw_numbers_empty(26,222,global.GBP,3,1,1,0,c_red,1);
        else if global.turn = 1
            scr_draw_numbers_empty(26,222,global.GBP,3,1,1,0,c_aqua,1);
        //Show HP
        if global.GHP <= global.maxGHP*0.10 //Show this when HP is less than 10%
            scr_draw_numbers_empty(22,222-16,global.GHP,3,1,1,0,c_red,1);
        else
            scr_draw_numbers_empty(22,222-16,global.GHP,3,1,1,0,c_white,1);
        //draw_sprite(spr_hpdisplay,-1,8,224-16);
        //draw_sprite(spr_bpdisplay,-1,8,224);
    }
    else
    {
        //draw_sprite(spr_luigidisplay,0,16,214+16); //Half Display
        //Show HP
        if global.GHP <= global.maxGHP*0.10 //Show this when HP is less than 10%
            scr_draw_numbers_empty(26,222,global.GHP,3,1,1,0,c_red,1);
        else
            scr_draw_numbers_empty(26,222,global.GHP,3,1,1,0,c_white,1);
        //draw_sprite(spr_hpdisplay,-1,8,224);
    }
}
//Show Enemy Bar Display
if phase = 3 && control = 1 && targetchoose > 0 && battleblock <> 2
{
    draw_sprite(spr_enemyhud,0,400,23);
    draw_set_font(global.extra_font);
    draw_set_color(c_white);
    if battleblock <> 3
        draw_text(400,12,string_hash_to_newline(obj_battlecontrol.enemyid[targetchoose].name));
    else if battleblock = 3
        draw_text(400,12,string_hash_to_newline(obj_battlecontrol.broid[targetchoose].name));
}

/* */
/*  */
