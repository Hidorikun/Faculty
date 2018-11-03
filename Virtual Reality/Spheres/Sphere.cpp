#include "Sphere.hpp"
#include <iostream>
#include <cmath>

using namespace std;
using namespace rt;

Intersection Sphere::getIntersection(const Line& line, float minDist, float maxDist) {
    Vector m = line.x0() -_center;
    float b = m* line.dx();
    float c = m* m - _radius * _radius;

    if (c > 0 && b > 0)
        return Intersection(false, this, &line, 0);

    float delta = b * b - c;

    if (delta < 0)
        return Intersection(false, this, &line, 0);

    float t = -b - sqrt(delta);

    if (t < 0.0f)
        t = 0.0f;

    return Intersection(true, this, &line, t);
}


const Vector Sphere::normal(const Vector& vec) const {
    Vector n = vec - _center;
    n.normalize();
    return n;
}
