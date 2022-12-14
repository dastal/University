#version 330 core

/* TODO update your vertex shader so that...
 *      ...it gets a normalMatrix as input
 *      ...it has an additional texture layer
 *      ...it uses the normal texture as normal information for lighting
 */

in vec3 objectColor;
in vec3 vertexNormal;
in vec3 worldPos;
in vec2 texCoord;

uniform sampler2D cubetex;
uniform sampler2D cubetexSpec;

/* TODO declare normal texture samplers here */



// END TODO

uniform vec3 camPos;

out vec3 color;

uniform struct Light {
	vec3 position;
	vec3 ambient;
	vec3 diffuse;
	vec3 specular;
} light;

void main()
{
	vec3 colorMap = texture(cubetex, texCoord.xy).rgb;
	vec3 specularMap = texture(cubetexSpec, texCoord.xy).rgb;

    /* TODO modify the source code to use the normal texture as 
     * normal information for the phong lighting. 
	 *
     */
    vec3 normal = vertexNormal;
    




    // End TODO

	// ambient term
	float ambientFactor = 0.1f;
	vec3 ambientColor = (light.ambient.xyz * ambientFactor);
	// diffuse term
	vec3 lightDir = vec3(normalize(light.position - worldPos));
	float diffDot = max(dot(normal, lightDir), 0.0);
	vec3 diffuseColor = diffDot * light.diffuse;

	// specular term (phong version)
	vec3 viewDir = vec3(normalize(camPos - worldPos));
	vec3 reflectDir = reflect(-lightDir, normal);
	float specDot = max(dot(viewDir, reflectDir), 0.0);
	float spec = pow(specDot, 32);
	float specStrength = 1.0;
	//float specStrength = 0.5; // tweeking the specular strength a bit
	vec3 specularColor = specStrength * spec * light.specular;
	
	/* TODO remember that you can use the color output for debugging tangents, texture coordinates etc.    
	 */
	// uncomment for rendering with specular map
	color = (ambientColor + diffuseColor) * colorMap.rgb + (specularColor * specularMap), 1.0;
	// uncomment for rendering without specular map
	//color = (ambientColor + diffuseColor + specularColor) * colorMap.rgb, 1.0;
}