#include "Vector.hpp"
#include "Line.hpp"
#include "Color.hpp"
#include "Intersection.hpp"

#ifndef RT_MATERIAL_INCLUDED
#define RT_MATERIAL_INCLUDED

namespace rt {

    class Material {
    private:
        Color _ambient;
        Color _diffuse;
        Color _specular;
        int _shininess;

    public:
        Material() {
            _shininess = 0;
        }

        Material(const Color& ambient, const Color& diffuse, const Color& specular, int shininess) {
            _ambient = Color(ambient);
            _diffuse = Color(diffuse);
            _specular = Color(specular);

            _shininess = shininess;
        }

        Material(float ar, float ag, float ab,
            float dr, float dg, float db,
            float sr, float sg, float sb,
            int shininess) {
            _ambient = Color(ar, ag, ab);
            _diffuse = Color(dr, dg, db);
            _specular = Color(sr, sg, sb);

            _shininess = shininess;
        }

        Material(const Material& mat) {
            _ambient = Color(mat.ambient());
            _diffuse = Color(mat.diffuse());
            _specular = Color(mat.specular());

            _shininess = mat.shininess();
        }

        inline const Color& ambient() const {
            return _ambient;
        }

        inline const Color& diffuse() const {
            return _diffuse;
        }

        inline const Color& specular() const {
            return _specular;
        }

        inline int shininess() const {
            return _shininess;
        }
    };
}

#endif
