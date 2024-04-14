if (intro == 0)
{
	currentFrame++
	x = -EaseOutCirc(currentFrame,-1096,288,maxFrame)
}

y = view_yport[0]+view_hport[0]

if global.talker = 0
	active = true
else
	active = false

if (active)
	mouthmove = true
else
	mouthmove = false
if (mouthmove == true)
	{
		sprite_index = sprite_t
		image_speed = 0.25
	}
else
	{
		sprite_index = sprite_i
		image_speed = 0
		image_index = 0
	}
	
if global.interact == 0
	instance_destroy()