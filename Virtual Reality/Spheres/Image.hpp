#include <iostream>
#include <fstream>
#include "Color.hpp"
#include <string>
#include "lodepng.hpp"

#ifndef RT_IMAGE_INCLUDED
#define RT_IMAGE_INCLUDED

namespace rt {

    class Image {
    private:
        int _width;
        int _height;
        unsigned char *buffer;

    public:
        Image(int width, int height) {
            _width = width;
            _height = height;

            buffer = new unsigned char[4 * _width*_height];
            for (int i = 0; i < 4 * _width*_height; i++) {
                buffer[i] = 0;
            }
        }

        void setPixel(int x, int y, const Color& c) {
            float p;
            int k = 4 * (y*_width + x);

            p = ceil(c.red() * 255);
            if (p > 255) {
                p = 255;
            }
            buffer[k] = (unsigned char)p;

            p = ceil(c.green() * 255);
            if (p > 255) {
                p = 255;
            }
            buffer[k + 1] = (unsigned char)p;

            p = ceil(c.blue() * 255);
            if (p > 255) {
                p = 255;
            }
            buffer[k + 2] = (unsigned char)p;
            buffer[k + 3] = 255;
        }

        void store(std::string fn) {
            unsigned error;
            unsigned char* png;
            size_t pngsize;
            LodePNGState state;

            lodepng_state_init(&state);

            error = lodepng_encode(&png, &pngsize, buffer, _width, _height, &state);
            if (!error) {
                lodepng_save_file(png, pngsize, fn.c_str());
            }
            if (error) {
                fprintf(stderr, "ERROR: %u: %s\n", error, lodepng_error_text(error));
            }
            lodepng_state_cleanup(&state);
            delete png;
        }
    };
}

#endif
