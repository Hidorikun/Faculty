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

float imageToViewPlane(int n, int imgSize, float viewPlaneSize) {
    float u = (float)n*viewPlaneSize / (float)imgSize;
    u -= viewPlaneSize / 2;
    return u;
}

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

float distance(Vector a, Vector b){
    return (float) sqrt(pow(a.x()-b.x(),2.0)+pow(a.y()-b.y(),2.0)+pow(a.z()-b.z(),2.0));
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

    Color BLACK(0, 0, 0);
    Color closestSphereColor;

    float dist = infinityf();

	for (int x = 0; x < imageWidth; x++) {
	    for (int y = 0; y < imageHeight; y++){
	        dist = infinityf();
            closestSphereColor = BLACK;

            Line line = Line(viewPoint, Vector(imageWidth/2 - x, imageHeight/2 - y, viewPlaneDist), false);

            for (int index = 0; index < geometryCount; index++){
                Intersection in = scene[index]->getIntersection(line, 0, viewPlaneDist);
                if (in.valid()) {
                    float d = distance(viewPoint, in.vec());
                    if (d < dist) {
                        dist = d;
                        closestSphereColor = scene[index]->color();
                    }
                }
            }

            image.setPixel(x, y, closestSphereColor);
	    }
	}


    image.store("scene.png");

    for (int i = 0; i < geometryCount; i++) {
        delete scene[i];
    }

    return 0;
}
