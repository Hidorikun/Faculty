#include "Vector.hpp"

#ifndef RT_LINE_INCLUDED
#define RT_LINE_INCLUDED

namespace rt {

    class Line {
    private:
        Vector p1;
        Vector p2;
        Vector _direction;

    public:
        Line() {
            p1 = Vector(0.0, 0.0, 0.0);
            p2 = Vector(0.0, 0.0, 0.0);
        }

        // if you give parametric = true then the second vector is a point, else is a _direction
        Line(const Vector& x0, const Vector& x1, bool parametric) {
            p1 = Vector(x0);

            if (parametric) {
                p2 = Vector(x1);
                _direction = Vector(p2 - p1);
            }
            else {
                p2 = Vector(x1 - x0);
                _direction = Vector(x1);;
            }
            p2.normalize();
            _direction.normalize();
        }

        Line(const Line& line) {
            p1 = Vector(line.p1);
            p2 = Vector(line.p2);
        }

        inline Vector direction() const {
            return _direction;
        }

        inline Vector x1() const {
            return p1;
        }

        inline Vector x2() const {
            return p2;
        }

        inline Vector vec(float t) const {
            return Vector(_direction*t + p1);
        }
    };
}

#endif
