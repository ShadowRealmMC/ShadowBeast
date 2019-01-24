#version 120

/*- Gbuffer Hand By Chocapic13, Modified By Pensa_73 -*/

const int GL_EXP = 2048;
const int GL_LINEAR = 9729;

varying vec4 color;
varying vec2 texcoord;
varying vec2 lmcoord;
varying vec3 normal;

uniform sampler2D texture;
uniform vec3 sunPosition;
uniform vec3 moonPosition;
uniform int fogMode;
uniform int worldTime;
uniform float wetness;

void main() {	
	
	vec2 adjustedTexCoord = texcoord.st;
	vec3 lightVector;
	vec3 albedo = texture2D(texture,adjustedTexCoord).rgb*color.rgb;
	
	vec4 frag2 = vec4(normal*0.5+0.5, 1.0f);
			
	float dirtest = 0.4;
	
	if (worldTime < 12700 || worldTime > 23250) {
		lightVector = normalize(sunPosition);
	} else {
		lightVector = normalize(moonPosition);
	}
	
	dirtest = 1.0-0.8*step(dot(frag2.xyz*2.0-1.0,lightVector),-0.02);

/* DRAWBUFFERS:024 */

	gl_FragData[0] = vec4(albedo,texture2D(texture,adjustedTexCoord).a*color.a);
	gl_FragData[1] = frag2;	
	gl_FragData[2] = vec4(lmcoord.t, 0.8, lmcoord.s, 1.0);

}