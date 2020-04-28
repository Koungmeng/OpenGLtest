$shader vertex
#version 330 core

layout(location = 0) in vec4 position;
layout(location = 1) in vec2 texCoord_IN;
uniform mat4 MVP;
out vec2 texCoord_Out;

void main()
{
	gl_Position = MVP* position;
	texCoord_Out = texCoord_IN;
} 

$shader fragment
#version 330 core

uniform vec4 u_Color;
uniform sampler2D sampler1;

in vec2 texCoord_Out;
out vec4 dacolor;

void main()
{
	//dacolor = u_Color;//shit code dont need vec4
	dacolor = texture2D(sampler1, texCoord_Out);
} 