#include "Cuboid.h"
#include <iostream>
#include <cmath>    //new
#include <stdio.h>  //new
// this define and include will enable M_PI from math.h.  
#define _USE_MATH_DEFINES
#include <math.h>

namespace cgCourse
{
	// function: legi Number % 3 = 72% 3 = 0 -> y = x ^ 2 + x

	 int face_min = 0;
	 int face_max = 72;
	 int col_min = 0;
	 int col_max = 20;
	 float pos_min = -2.0;
	 float pos_max = 2.0;

	 float f(float x) {
		 float newX = pow(x, 2.0) + x;
		 return newX;
	 };

	 float f_deviation(float x) {
		 float newX = 2 * x + 1;
		 return newX;
	 };

	 Cuboid::Cuboid() : Shape()
	 {	
		 /* TODO: add you code here*/

		 //computing the positions

		 // interval [-2,2]
		 std::vector<glm::vec3> pos;

		 for (float i = pos_min; i <= pos_max; i += 0.2) {
			 pos.push_back({ i, f(i), 0.0f });
			 pos.push_back({ i + 1.0, f(i), 0.0f });
			 pos.push_back({ i + 1.0, f(i), 2.0f });
			 pos.push_back({ i, f(i), 2.0f });
		 };

		 this->positions = pos;


		 //computing the colors

		 std::vector<glm::vec3> col;

		 for (int i = col_min; i <= col_max; i += 1) {
			 col.push_back({ 0.0f, 1.0f, 0.0f });
			 col.push_back({ 1.0f, 0.0f, 0.0f });
			 col.push_back({ 0.0f, 0.0f, 0.0f });
			 col.push_back({ 0.0f, 0.0f, 1.0f });
		 };

		 this->colors = col;

		 //computing the faces

		 std::vector<glm::uvec3> face;

		 for (int i = face_min; i <= face_max; i += 1) {
			 //top
			 face.push_back({ i,i + 1.0,i + 2.0 });
			 face.push_back({ i,i + 2.0,i + 3.0 });
			 //front
			 face.push_back({ i,i + 1.0,i + 4.0 });
			 face.push_back({ i + 1.0,i + 4.0,i + 5.0 });
			 //back
			 face.push_back({ i + 2.0,i + 3.0,i + 6.0 });
			 face.push_back({ i + 3.0,i + 6.0,i + 7.0 });
			 //left
			 face.push_back({ i + 1.0,i + 2.0,i + 6.0 });
			 face.push_back({ i + 1.0,i + 5.0,i + 6.0 });
			 //right
			 face.push_back({ i,i + 3.0,i + 4.0 });
			 face.push_back({ i + 3.0,i + 4.0,i + 7.0 });
		 };

		 this->faces = face;

        // for the moment we don't add normals here that is why we will not set the normals or face normals.
	}
 

}
