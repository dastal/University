#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#ifdef __MINGW32__
#include <windows.h>
#endif
#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

int iters;

void drawsquare(double x, double y, double l) {
  // todo
}

void display() {
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  glBegin(GL_QUADS);
  
  // call your Sierpinski function here
  
  
  // make a drawsquare function
  //drawsquare(-1.0,-1.0,1);
  // figure out what glVertex2f does
  glVertex2f(-0.25f, 0.25f); // vertex 1
  glVertex2f(-0.5f, -0.25f); // vertex 2
  glVertex2f(0.5f, -0.25f); // vertex 3
  glVertex2f(0.25f, 0.25f); // vertex 4
  
  glEnd();
  glFlush(); //forces execution of GL commands in finite time
}

void main(int argc, char *argv[]) {
  printf("Type iteration: ");
  scanf("%d", &iters);  

  glutInit(&argc, argv); // Declare initial window
  glutCreateWindow("Sierpinski Carpet"); // Open window with the title "Sierpinski Carpet".
  glutDisplayFunc(display); /* use the function "display" to determine what
                               will be shown in the window you created */
  glutMainLoop(); // Enter main loop and process events.
}
// Linux: gcc task8b.c -o task8b -lm -lglut -lGL; ./task8b
// Mac-OS: gcc task8b.c -o task8b -lm -framework OpenGL -framework GLUT; ./task8b
// Windows: gcc task8b.c -o  task8b -lm -lfreeglut -lopengl32; task8b
