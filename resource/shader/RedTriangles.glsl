$shader vertex
#version 330 core

layout(location=0) in vec4 position;
layout(location=1) in vec3 color_in;
out vec4 O_color;
void main()
{
	gl_Position = position;
	O_color = vec4(color_in,1);
}

$shader fragment
#version 330 core
in vec4 O_color;
out vec4 dacolor;

void main()
{
	dacolor = O_color;
}