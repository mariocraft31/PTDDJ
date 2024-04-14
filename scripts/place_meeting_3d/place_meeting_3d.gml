function place_meeting_3d(){

/// @function place_meeting_3d
/// @arg x
/// @arg y
/// @arg z
/// @arg obj

var _x = argument[0];
var _y = argument[1];
var _z = argument[2];
var _obj = argument[3];

var _height = z;

var xyMeeting = instance_place(_x, _y, _obj);

var zMeeting = false;

if xyMeeting
{
	zMeeting = rectangle_in_rectangle(0, xyMeeting.z, 1, xyMeeting.z - xyMeeting.height, 0, _z, 1, _z - z)
}

return xyMeeting && zMeeting;

}