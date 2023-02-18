/// @desc Set up the camera

// Set resolution information
res = {
	width: 640,
	height: 360, 
	scale: 2
}

// Get total players
total_players = global.gamemode;

// Create players
var _xorigin = room_width div 2;
var _yorigin = room_width div 2;

for (var i = 0; i < total_players; i++) {
	var _offset = 64;
	if (i == 0) _offset *= -1;
	
	var p = instance_create_layer(_xorigin, _yorigin + _offset, "Instances", obj_player);
	p.player_number = i;
	p.sprite_index = (i == 0 ? spr_tabbie_taxi_one : spr_tabbie_taxi_two);
	
	players[i] = p;
}

// Enable views
view_enabled = true;

// Create cameras
for (var i = 0; i < total_players; i++) {
	// Make camera visible
	view_visible[i] = true;
	
	// Create camera
	var _w = res.width / total_players;
	cameras[i] = camera_create_view(0, 0, _w, res.height, 0, players[i], -1, -1, _w / 2, res.height / 2);
	view_set_camera(i, cameras[i]);
	
	// Set view position
	view_xport[i] = _w * i;
	view_wport[i] = _w;
}

surface_resize(application_surface, res.width * res.scale, res.height * res.scale);

window_set_size(res.width * res.scale, res.height * res.scale);

// Resize GUI
display_set_gui_size(res.width * res.scale, res.height * res.scale);

// Center window
var _displayW = display_get_width();
var _displayH = display_get_height();

window_set_position(_displayW / 2 - res.width * res.scale / 2, _displayH / 2 - res.height * res.scale / 2);