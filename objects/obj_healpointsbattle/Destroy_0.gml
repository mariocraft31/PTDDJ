if global.turn = 2
{
    global.hitrank = 0; //Reset type of rank hit
    global.takedamage = 0; //Reset who takes damage
    global.damage = 0; //Reset damage
    if instance_exists(obj_itemb)
        obj_itemb.amount = 0; //Reset heal amount
}
global.criticalhit = false;