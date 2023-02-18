function GeneratePlanets() {
	// Create starting planet
	var _xorigin = room_width div 2;
	var _yorigin = room_width div 2;
	
	CreatePlanet(_xorigin, _yorigin, 0);
	
	// Create surrounding planets
	var _dir = 0;
	
	for (var i = 0; i < total_planets; i++) {
		var planet_created = false;
		while (planet_created == false) {
			var _dis = (i % 2 == 0 ? max_distance : min_distance);
			_dir += (360 / total_planets);
		
			var _x = _xorigin + lengthdir_x(_dis, _dir);
			var _y = _yorigin + lengthdir_y(_dis, _dir);
			
			_x = clamp(_x, 128, room_width - 128);
			_y = clamp(_y, 128, room_height - 128);
		
			var _planet = CreatePlanet(_x, _y, i);
			
			with (_planet) {
				if (!instance_place(x, y, obj_planet)) {
					var _station = instance_create_layer(x, y, "Stations", obj_station);
					_planet.station = _station;
					_station.planet = _planet;
					planet_created = true;
				} else {
					instance_destroy();	
				}
			}
		}
	}
}

function CreatePlanet(_x, _y, _id) {
	var _planet = instance_create_layer(_x, _y, "Planets", obj_planet);
	planets[| _id] = _planet;
	return _planet;
}

function GetRandomPlanet() {
	var _num = irandom(ds_list_size(planets) - 1);
	//ds_list_shuffle(planets);
	return ds_list_find_value(planets, _num);
}