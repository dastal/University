# Computer_Graphics
 Computer Graphics Course

This course was about the fundamental concepts of 3D image synthesis, with a focus on interactive rendering.

Topics
- real-time image formation as used in interactive 3D games
- virtual reality simulation
- scientific visualization applications

Exercise 1
- Set up OpenGL on the computer
- Compile and run a simple application
- Understanding how a typical OpenGL application works

Exercise 2
Understand how 3D objects are defined and how to create them
- Generate a mesh with the shape describing a cuboid bent along a specific function

Exercise 3
Understand transformations and how they are applied to objects. In addition, normals and experiments with them. 
- Apply rotation, translation and scalings for a shape object (see 'Additional Information' below)
- Let the torus and cube spin around one or multiple axis of your choice
- Show the normals for the torus as a MultiLine Object
- Show the torus with colors according to normals
- Calculate the normal matrix, apply it to the normals of the torus and compare the color output
- [optional] Apply the normal matrix of the torus also to manipulate the line object

Exercise 4
Lighting and how it is calculated in shaders.
- Apply the phong lighting model with ambient, diffuse and specular term to the cube objects and the torus. Take screenshots of every term separately and everything combined. The color of the light should correspond to the 6 first digits of your student id (e.g. 15-789-5XX).
- If you are done with phong illumination try to render your objects with Gourand Shading.

Additional Exercise
Closer look at normal mapping.
- Apply normal mapping to our demo objects.
- Combine the normal mapping with the previously implemented blinn-phong illumination model.
- Show the normals as Multiline object before and after normal mapping (take screenshots).
- [optional] Apply Blinn-Phong Illumination to your scene and make a screenshot in comparison to phong illuminations.

IDE: Visual Studio 2019 with:
- C++
- Desktop development with C++

Running the Projects:
- use CMake GUI
- path to source code: where CMakeLists.txt is
- path to build the binaries: same path + "/build"
- Hit "Configure"
- Hit "Generate"
- Go to VS, rightclick on "example.cpp" and make it the startup item
- Run the project
