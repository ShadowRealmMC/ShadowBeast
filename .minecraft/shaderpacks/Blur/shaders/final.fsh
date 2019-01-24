#version 120

/*- Motion Blur sample by Pensa_73 -*/	

//- Uniforms And Sample Already Built-in For Testing Purposes -//

const float sunPathRotation = -40.0f;

varying vec4 texture;

uniform sampler2D gcolor;
uniform sampler2D gaux1;
uniform sampler2D depthtex0;

uniform mat4 gbufferProjection;
uniform mat4 gbufferProjectionInverse;
uniform mat4 gbufferPreviousProjection;
uniform mat4 gbufferModelViewInverse;
uniform mat4 gbufferPreviousModelView;

uniform vec3 cameraPosition;
uniform vec3 previousCameraPosition;

float mat = texture2D(gaux1, texture.st).g;

void main() {

	vec3 sum = texture2D(gcolor, texture.st).rgb;

	float hand = float(mat > 0.75 && mat < 0.85);

	float depth = texture2D(depthtex0, texture.st).x;
  
	vec4 currentPosition = vec4(texture.x * 2.0 - 1.0, texture.y * 2.0 - 1.0, 2.0 * depth - 1.0, 1.0);
	
	vec4 fragposition = gbufferProjectionInverse * currentPosition;
	fragposition = gbufferModelViewInverse * fragposition;
	fragposition /= fragposition.w;
	fragposition.xyz += cameraPosition;
	
	vec4 previousPosition = fragposition;
	previousPosition.xyz -= previousCameraPosition;
	previousPosition = gbufferPreviousModelView * previousPosition;
	previousPosition = gbufferPreviousProjection * previousPosition;
	previousPosition /= previousPosition.w;
	
	vec2 velocity = (currentPosition - previousPosition).st * 0.015;

	int samples = 1;
		
	vec2 coord = texture.st + velocity;

	if (hand < 0.9) {

	for (int i = 0; i < 12; ++i, coord += velocity) {
	if (coord.s > 1.0 || coord.t > 1.0 || coord.s < 0.0 || coord.t < 0.0) break;
	sum += texture2D(gcolor, coord).rgb;
	++samples;
	}	
	sum = sum/samples;

	}

	gl_FragColor = vec4(sum.rgb, 1.0);
}