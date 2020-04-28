$shader vertex
#version 330 core

layout(location = 0) in vec4 position;
layout(location = 1) in vec4 color;

uniform mat4  MVP;
out vec4 dacolor;
void main()
{
	gl_Position = MVP * position;
	dacolor = color;
}
$shader fragment
#version 330 core

in vec4 dacolor;
out vec4 thecolor;

void main()
{
	thecolor = dacolor;
}