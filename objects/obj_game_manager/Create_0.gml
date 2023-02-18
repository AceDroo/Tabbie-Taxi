/// @desc Set up game manager

// Planet variables
min_distance = sprite_get_width(spr_planet) * 3.25;
max_distance = sprite_get_width(spr_planet) * 6.5;

total_planets = 8;
planets = ds_list_create();

// Randomise
randomize();

// Generate planets
GeneratePlanets();

// Create initial customer
CreateNewCustomer();

// Initialise particles
particles = part_system_create();

part_type_exhaust = part_type_create();
part_type_sprite(part_type_exhaust, spr_exhaust, false, false, false);
part_type_size(part_type_exhaust, 0.4, 0.4, 0.05, 0);
part_type_colour3(part_type_exhaust, c_white, c_aqua, c_blue);
part_type_alpha3(part_type_exhaust, 1, 1, 0);
part_type_life(part_type_exhaust, 20, 20);


// Gameplay variables
customer_timer = 0;
asteroid_timer = 0;

customers_lost = 0;

display_failure = false;

score = 0;

audio_play_sound(snd_music, 1, true);