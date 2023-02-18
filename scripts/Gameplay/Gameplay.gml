function CreateAsteroid() {
	// Get camera information
	var _cam = obj_camera.cameras[0];
	var _camX = camera_get_view_x(_cam);
	var _camY = camera_get_view_y(_cam);
	var _camW = camera_get_view_width(_cam);
	var _camH = camera_get_view_height(_cam);
	
	var _padding = 128;
	
	repeat(floor(global.difficulty)) {
		var _x = random_range(0, room_width);
		var _y = random_range(0, room_height);
	
		while (point_in_rectangle(_x, _y, _camX - _padding, _camY - _padding, _camX + _camW + _padding, _camY + _camH + _padding)) {
			_x = random_range(0, room_width);	
			_y = random_range(0, room_height);
		}
		
		var _asteroid = instance_create_layer(_x, _y, "Instances", obj_asteroid);
		_asteroid.speed = irandom_range(1, 3);
		_asteroid.direction = irandom_range(0, 359);
		_asteroid.image_angle = irandom_range(0, 359);
	}
}

function GameOver() {	
	// Update high score
	if (score > global.high_score) {
		global.high_score = score;	
	}
	
	// Stop music
	audio_stop_all();
	
	// Reset game
	global.difficulty = 0;	

	room_goto(rm_menu);
}