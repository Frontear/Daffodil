#include <GL/glew.h>
#include <GLFW/glfw3.h>

#include <iostream>

int main(void) {
    if (!glfwInit()) {
        std::cerr << "Failed to initialize glfw" << std::endl;

        return -1;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    // glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);

    GLFWwindow *window = glfwCreateWindow(640, 360, "Daffodil", nullptr, nullptr);
    if (!window) {
        std::cerr << "Failed to create glfw window" << std::endl;
        glfwTerminate();

        return -1;
    }

    glfwMakeContextCurrent(window);

    glewExperimental = true;
    if (!glewInit()) {
        std::cerr << "Failed to initialize glew" << std::endl;
        glfwTerminate();

        return -1;
    }

    glViewport(0, 0, 640, 360);

    while (!glfwWindowShouldClose(window)) {
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glfwTerminate();

    return 0;
}
