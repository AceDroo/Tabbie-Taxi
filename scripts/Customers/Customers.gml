function CreateNewCustomer() {
	// Select a random departure and destination for the customer
	var _departurePlanet = noone;
	var _destinationPlanet = noone;
	
	while (_departurePlanet == _destinationPlanet) {
		_departurePlanet = GetRandomPlanet();
		_destinationPlanet = GetRandomPlanet();
	}
	
	// Create a customer at the departure platform
	var _station = _departurePlanet.station;
	
	var _customer = instance_create_layer(_station.x, _station.y, "Instances", obj_customer);
	_customer.destination_planet = _destinationPlanet;
	_customer.image_blend = _destinationPlanet.image_blend;
}