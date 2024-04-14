//Check for item which will heal gustavo
if global.turn = 1
{
    if obj_pep_battle.itemid = 0 //Mushroom
    {
        amount = 20;
        global.GHP += amount;
        global.mushrooms -= 1;
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 1 //Super Mushroom
    {
        amount = 40;
        global.GHP += amount;
        global.supermushrooms -= 1;
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 2 //Ultra Mushroom
    {
        amount = 80;
        global.GHP += amount;
        global.ultramushrooms -= 1;
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 3 //Max Mushroom
    {
        amount = global.maxGHP;
        global.GHP += amount;
        global.maxmushrooms -= 1;
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 4 //Nut
    {
        amount = 20;
        global.GHP += amount;
        global.GHP += amount;
        if global.GHP > global.maxGHP
            global.GHP = global.maxGHP;
        if global.GHP > global.maxGHP
            global.LLP = global.maxGHP;
        global.nuts -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 5 //Super Nut
    {
        amount = 40;
        global.GHP += amount;
        global.GHP += amount;
        if global.GHP > global.maxGHP
            global.GHP = global.maxGHP;
        if global.GHP > global.maxGHP
            global.LLP = global.maxGHP;
        global.supernuts -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 6 //Ultra Nut
    {
        amount = 80;
        global.GHP += amount;
        global.GHP += amount;
        if global.GHP > global.maxGHP
            global.GHP = global.maxGHP;
        if global.GHP > global.maxGHP
            global.LLP = global.maxGHP;
        global.ultranuts -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 7 //Max Nut
    {
        global.GHP += global.maxGHP;
        global.GHP += global.maxGHP;
        if global.GHP > global.maxGHP
            global.GHP = global.maxGHP;
        if global.GHP > global.maxGHP
            global.LLP = global.maxGHP;
        global.maxnuts -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 8 //Star Candies
    {
        global.GHP += global.maxGHP;
        global.GBP += global.maxGBP
        global.starcandies -= 1;
    }
    if obj_pep_battle.itemid = 9 //Syrup
    {
        amount = 20;
        global.GBP += amount;
        global.syrups -= 1;
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 10 //Super Syrup
    {
        amount = 40;
        global.GBP += amount;
        global.supersyrups -= 1;
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 11 //Ultra Syrup
    {
        amount = 80;
        global.GBP += amount;
        global.ultrasyrups -= 1;
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 12 //Max Syrup
    {
        amount = global.maxGBP;
        global.GBP += amount;
        global.maxsyrups -= 1;
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 13 //1-Up Mushroom
    {
        global.GHP += round(global.maxGHP/2);
        global.oneups -= 1;
    }
    if obj_pep_battle.itemid = 14 //1-Up Super
    {
        global.GHP += global.maxGHP;
        global.GBP += global.maxGBP;
        global.oneupsupers -= 1;
    }
    if obj_pep_battle.itemid = 15 //Refreshing Herb
    {
        //IF POISONED, THEN HEAL
        global.herbs -= 1;
    }
    if obj_pep_battle.itemid = 16 //Red Pepper
    {
        //global.Lpow *= 2;
        global.redpeppers -= 1;
    }
    if obj_pep_battle.itemid = 17 //Green Pepper
    {
        //global.Ldef *= 2;
        global.greenpeppers -= 1;
    }
    if obj_pep_battle.itemid = 18 //Boo Biscuit
    {
        //global.Linvincible = true;
        global.boobiscuits -= 1;
    }
}
//Check for item which will heal Mario
if global.turn = 0
{
    if obj_pep_battle.itemid = 0 //Mushroom
    {
        amount = 20;
        global.PHP += amount;
        global.mushrooms -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 1 //Super Mushroom
    {
        amount = 40;
        global.PHP += amount;
        global.supermushrooms -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 2 //Ultra Mushroom
    {
        amount = 80;
        global.PHP += amount;
        global.ultramushrooms -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 3 //Max Mushroom
    {
        amount = global.maxPHP;
        global.PHP += amount;
        global.maxmushrooms -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 4 //Nut
    {
        amount = 20;
        global.PHP += amount;
        global.PHP += amount;
        if global.PHP > global.maxPHP
            global.PHP = global.maxPHP;
        if global.PHP > global.maxPHP
            global.MLP = global.maxPHP;
        global.nuts -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 5 //Super Nut
    {
        amount = 40;
        global.PHP += amount;
        global.PHP += amount;
        if global.PHP > global.maxPHP
            global.PHP = global.maxPHP;
        if global.PHP > global.maxPHP
            global.MLP = global.maxPHP;
        global.supernuts -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 6 //Ultra Nut
    {
        amount = 80;
        global.PHP += amount;
        global.PHP += amount;
        if global.PHP > global.maxPHP
            global.PHP = global.maxPHP;
        if global.PHP > global.maxPHP
            global.MLP = global.maxPHP;
        global.ultranuts -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 7 //Max Nut
    {
        global.PHP += global.maxPHP;
        global.PHP += global.maxPHP;
        if global.PHP > global.maxPHP
            global.PHP = global.maxPHP;
        if global.PHP > global.maxPHP
            global.MLP = global.maxPHP;
        global.maxnuts -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
        instance_create(obj_gustavob.xstart,obj_gustavob.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 8 //Star Candies
    {
        global.PHP += global.maxPHP;
        global.PBP += global.maxPBP
        global.starcandies -= 1;
    }
    if obj_pep_battle.itemid = 9 //Syrup
    {
        amount = 20;
        global.PBP += amount;
        global.syrups -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 10 //Super Syrup
    {
        amount = 40;
        global.PBP += amount;
        global.supersyrups -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 11 //Ultra Syrup
    {
        amount = 80;
        global.PBP += amount;
        global.ultrasyrups -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 12 //Max Syrup
    {
        amount = global.maxPBP;
        global.PBP += amount;
        global.maxsyrups -= 1;
        instance_create(obj_pep_battle.xstart,obj_pep_battle.ystart,obj_healpointsbattle);
    }
    if obj_pep_battle.itemid = 13 //1-Up Mushroom
    {
        global.PHP += round(global.maxPHP/2);
        global.oneups -= 1;
    }
    if obj_pep_battle.itemid = 14 //1-Up Super
    {
        global.PHP += global.maxPHP;
        global.PBP += global.maxPBP;
        global.oneupsupers -= 1;
    }
    if obj_pep_battle.itemid = 15 //Refreshing Herb
    {
        //IF POISONED, THEN HEAL
        global.herbs -= 1;
    }
    if obj_pep_battle.itemid = 16 //Red Pepper
    {
        //global.Mpow *= 2;
        global.redpeppers -= 1;
    }
    if obj_pep_battle.itemid = 17 //Green Pepper
    {
        //global.Mdef *= 2;
        global.greenpeppers -= 1;
    }
    if obj_pep_battle.itemid = 18 //Boo Biscuit
    {
        //global.Minvincible = true;
        global.boobiscuits -= 1;
    }
}

