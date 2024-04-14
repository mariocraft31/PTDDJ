if (zurasu == 1 && zurasucon > 0)
{
    if (zurasucon == 1)
    {
        if instance_exists(writer)
        {
            remwriterx = (writer.writingx - camerax())
            remwritery = (writer.writingy - cameray())
        }
        zurasucon = 2
    }
    if (zurasucon == 2)
    {
        if instance_exists(writer)
        {
            writer.writingx = (remwriterx + camerax())
            writer.writingy = (remwritery + cameray())
        }
    }
}
