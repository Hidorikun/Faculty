#include <cmath>
#include <iostream>
#include <string>

#include "Vector.hpp"
#include "Line.hpp"
#include "Geometry.hpp"
#include "Sphere.hpp"
#include "Image.hpp"
#include "Color.hpp"
#include "Intersection.hpp"
#include "Material.hpp"

#include "Scene.hpp"

using namespace std;
using namespace rt;

#define BLACK Color(0,0,0)

const Intersection findFirstIntersection(const Line& ray,
                                         float minDist, float maxDist) {
    Intersection intersection;

    for (int i = 0; i < geometryCount; i++) {
        Intersection in = scene[i]->getIntersection(ray, minDist, maxDist);
        if (in.valid()) {
            if (!intersection.valid()) {
                intersection = in;
            }
            else if (in.t() < intersection.t()) {
                intersection = in;
            }
        }
    }

    return intersection;
}

int main() {
    Vector viewPoint(0, 0, 0);
    Vector viewDirection(0, 0, 1);
    Vector viewUp(0, -1, 0);

    float frontPlaneDist = 0;
    float backPlaneDist = 1000;

    float viewPlaneDist = 512;
    float viewPlaneWidth = 1024;
    float viewPlaneHeight = 768;

    int imageWidth = 1024;
    int imageHeight = 768;

    Vector viewParallel = viewUp^viewDirection;

    viewDirection.normalize();
    viewUp.normalize();
    viewParallel.normalize();
    Image image(imageWidth, imageHeight);

    Vector L;
    Vector C = viewPoint;
    Vector V;
    Vector E;
    Vector N;
    Vector T;
    Vector R;

    for (int i = 0; i < imageWidth; i++) {
        for (int j = 0; j < imageHeight; j++) {
            Intersection inter = findFirstIntersection(
                    Line(viewPoint, Vector( (imageWidth / 2) - i, (imageHeight / 2) - j, viewPlaneDist), false),
                    frontPlaneDist,
                    backPlaneDist);

            if (inter.valid())
            {
                Color color = BLACK;
                for (Light * li : lights) {
                    Color c = BLACK;
                    L = li->position();
                    V = inter.vec();
                    E = C - V;
                    E.normalize();
                    N = inter.geometry()->normal(V);
                    T = L - V;
                    T.normalize();
                    R = N * (N*T) * 2 - T;
                    R.normalize();

                    c += inter.geometry()->material().ambient() * li->ambient();
                    if (N*T > 0)
                        c += inter.geometry()->material().diffuse() * li->diffuse() *(N*T);
                    if (E*R > 0)
                        c += inter.geometry()->material().specular() * li->specular() * pow(E*R,inter.geometry()->material().shininess());
                    color += c;
                }
                image.setPixel(i, j, color);
            }
            else
                image.setPixel(i, j, BLACK);
        }
    }

    image.store("scene.png");

    for (int i = 0; i < geometryCount; i++) {
        delete scene[i];
    }

    return 0;
}


