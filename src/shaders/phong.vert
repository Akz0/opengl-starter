#version 330

in vec3 vertex_position;
in vec3 vertex_normal;

out vec3 normal;
out vec3 lightDir;
out vec3 pos;

vec3 LightPosition = vec3 (7.0, 10.0, 20.0); // Light position in world coords.
vec3 Kd = vec3 (0.0, 0.0, 1.0); // blue diffuse surface reflectance
vec3 Ld = vec3 (1.0, 1.0, 1.0); // Light source intensity

uniform mat4 view;
uniform mat4 proj;
uniform mat4 model;


void main(){

	
	mat4 ModelViewMatrix = view * model;
	mat3 NormalMatrix =  mat3(ModelViewMatrix);

	vec4 vertPos4 = ModelViewMatrix * vec4(vertex_position, 1.0);
	pos = vec3(vertPos4) / vertPos4.w;

	lightDir = normalize(vec3(LightPosition - pos));

	normal = normalize( NormalMatrix * vertex_normal);

	gl_Position = proj * view * model * vec4(vertex_position,1.0);

}