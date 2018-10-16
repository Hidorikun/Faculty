#include <cmath>

//#include <w32api/evntprov.h>
#include "Sphere.hpp"

using namespace rt;

Intersection Sphere::getIntersection(const Line& line, float minDist, float maxDist) {
	Intersection in;

	float a = line.direction() * line.direction();
    float b = 2 * (line.direction() * (line.x1() + this->center()));
    float c = (line.x1() - this->center()) * (line.x1() - this->center()) - this->radius() * this->radius();

    float delta = b*b - 4*a*c;
    float t1, t2, t;

    if (delta < 0) {
        return in;
    }else {
        t1 = static_cast<float>((-b + std::sqrt(delta) ) / (2 * a));
        t2 = static_cast<float>((-b - std::sqrt(delta) ) / (2 * a));

        t = std::min(t1, t2);
    }

    in = Intersection(true, this, &line, t);

    return in;
}


const Vector Sphere::normal(const Vector& vec) const {
    Vector n = vec - _center;
    n.normalize();
    return n;
}
