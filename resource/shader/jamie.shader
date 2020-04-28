$shader vertex
#version 330 core

layout(location = 0) in vec3 position;
layout(location = 1) in vec3 color;
layout(location = 2) in vec3 normal;

uniform mat4  MVP;
uniform vec3 AmbientLight;
out vec3 dacolor;
void main()
{
	vec4 v = vec4(position, 1.0f);
	gl_Position = MVP * v;
	dacolor = color * AmbientLight;
}
$shader fragment
#version 330 core

in vec3 dacolor;
out vec3 thecolor;

void main()
{
	thecolor = dacolor;
}