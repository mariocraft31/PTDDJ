//Bros Attacks
if movechoose = 1 && instance_exists(obj_brosattack) //Green Shells
    obj_brosattack.attacknum = 0;
if movechoose = 2 && instance_exists(obj_brosattack) //Fire Flower
    obj_brosattack.attacknum = 1;
if movechoose = 3 && instance_exists(obj_brosattack) //Jump Helmet
    obj_brosattack.attacknum = 2;
if movechoose = 4 && instance_exists(obj_brosattack) //Broken Heart
{
    obj_brosattack.attacknum = 3;
    /*mp_linear_step(targetx-171,targety,10,0) //Depending on what enemy you choose, Mario will stand in front of it
    if x = targetx-171 && y = targety && sprite_index = spr_mariobwalking
        sprite_index = spr_fluddstand;*/
}

/* */
/*  */