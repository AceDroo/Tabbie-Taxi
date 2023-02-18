/// @desc Manage game difficulty and events

// Increment game difficulty
// Difficulty increases 0.001 per frame. Therefore, each second the difficulty increases by 0.06
global.difficulty += 0.001;

// Spawn customers
customer_timer++;
if (customer_timer >= 900 / global.difficulty) {
	CreateNewCustomer();
	customer_timer = 0;	
}

// Spawn asteroids
if (global.difficulty >= 2) {
	asteroid_timer++;
	if (asteroid_timer >= 1200 / global.difficulty) {
		CreateAsteroid();		
		asteroid_timer = 0;
	}
}

// GAME OVER
if (!instance_exists(obj_player) || customers_lost >= 3) {
	GameOver();
}