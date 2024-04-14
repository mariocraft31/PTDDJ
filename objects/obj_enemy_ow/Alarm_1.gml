if global.outcome = 0.5 //Enemy becomes active again
{
    global.outcome = 0;
    active = true;
    visible = true;
    encounter = false;
}
else if global.outcome = 1 //Enemy defeated and unactive
{
    global.outcome = 0;
    active = true;
    visible = true;
    instance_destroy();
}