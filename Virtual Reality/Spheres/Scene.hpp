#include "Geometry.hpp"
#include "Sphere.hpp"
#include "Light.hpp"

using namespace rt;

int geometryCount = 7;
Geometry* scene[] = {
	new Sphere(-50,  -25,  175,  30,  0.7, 0.0, 0.0),
	new Sphere(-10,    0,  100,  10,  0.7, 0.7, 0.0),
	new Sphere(0,      0,  200,  40,  0.0, 0.7, 0.0),
	new Sphere(0,    -50,  200,  10,  0.7, 0.7, 0.7),
	new Sphere(10,     0,   20,   5,  0.0, 0.7, 0.7),
	new Sphere(-70,    0,  100,  10,  0.7, 0.0, 0.7),
	new Sphere(50,    25,   75,  50,  0.0, 0.0, 0.7)
};

int lightCount = 2;
Light* lights[] = {
    new Light(-50, 0, 0, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 1),
    new Light(20, 20, 0, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 1)
};
