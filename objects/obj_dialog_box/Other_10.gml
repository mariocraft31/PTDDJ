active = 1
xxx = ((19 * f) + __view_get((0), 0))
yyy = ((20 * f) + __view_get((1), 0))
xxx = round(xxx)
yyy = round(yyy)
if (side == 0)
{
    writer = instance_create_depth((xxx + (4 * f)), (yyy - (-2 * f)), -10000, obj_text)
    with (writer)
    {
        dialogue = 1
    }
}
else
{
    writer = instance_create_depth((xxx + (4 * f)), (yyy + (380 * f)), -10000, obj_text)
    writer.skippable = skippable
    with (writer)
    {
        dialogue = 1
    }
}
if (instance_exists(writer) && global.portrait != 0)
{
    with (writer)
    {
        dialogue = 1
        //if (originalcharline == 33)
        //   charline = 26
    }
}
zurasucon = 1
