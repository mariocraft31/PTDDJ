//Bros Attacks Selection
if battleblock = 1
{
    //Subtract BP
    if movechoose = 1 //or Green Shells
        global.GBP -= 4;
    if movechoose = 2 //or Fire Flower
        global.GBP -= 6;
    if movechoose = 3 //or Jump Helmet
        global.GBP -= 10;
    if movechoose = 4 //or Broken Heart
        global.GBP -= 14;
    //Take out Bros Attack Item
    moveto = 5;
    phase = 5;
    image_index = 0;
    sprite_index = spr_lonegustavo_idle;
    ID = instance_create(x+50,y,obj_brosattack);
	instance_create(x+50,y-44,obj_genericpoofeffect)
    with ID attacknum = attacknum;
}
else
{
    //Item Index 
    if pagenext = 1
        itemid = 0;
    else if pagenext = 2
        itemid = 1;
    else if pagenext = 3
        itemid = 2;
    else if pagenext = 4
        itemid = 3;
    else if pagenext = 5
        itemid = 4;
    else if pagenext = 6
        itemid = 5;
    else if pagenext = 7
        itemid = 6;
    else if pagenext = 8
        itemid = 7;
    else if pagenext = 9
        itemid = 8;
    else if pagenext = 10
        itemid = 9;
    else if pagenext = 11
        itemid = 10;
    else if pagenext = 12
        itemid = 11;
    else if pagenext = 13
        itemid = 12;
    else if pagenext = 14
        itemid = 13;
    else if pagenext = 15
        itemid = 14;
    else if pagenext = 16
        itemid = 15;
    else if pagenext = 17
        itemid = 16;
    else if pagenext = 18
        itemid = 17;
    else if pagenext = 19
        itemid = 18;
    else if pagenext = 20
        itemid = 19;
    //Item Selection
    moveto = 6;
    phase = 5;
    image_index = 0;
    sprite_index = spr_lonegustavo_idle;
    instance_create(x+20,y-32,obj_itemb);
}
