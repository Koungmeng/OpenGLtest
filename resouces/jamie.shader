$shader vertex
#version 430 core
in layout(location = 0) vec4 position;
in layout(location = 1) vec3 vertexColor;
in layout(location = 2) vec3 normal;

uniform mat4 MVP;
uniform mat4 Model;

out vec3 theNormal;
out vec3 thePosition;

void main()
{
	gl_Position = MVP * position;
	theNormal = vec3(Model* vec4(normal, 0.0f));
	thePosition = vec3(Model * position );
}
$shader fragment
#version 430 core


out vec4 daColor;
in vec3 theNormal;
in vec3 thePosition;

uniform vec3 LightPOS;
uniform vec3 eyePosition;
uniform vec3 AmbientLight;

void main()
{
	vec3 lightVector = normalize(LightPOS - thePosition);
	float brightness = dot(lightVector, normalize(theNormal));//diffuse
	//specular
	vec3 reflectedlight = reflect(-lightVector, theNormal);
	vec3 eyeVector = normalize(eyePosition - thePosition);
	float specularity = pow(dot(eyeVector, reflectedlight), 50);

	daColor = clamp(vec4(brightness, brightness, brightness, 1.0),0 ,1) + vec4(AmbientLight, 1.0f)+ 
		clamp(vec4(specularity, specularity, specularity,1),0,1);
}
