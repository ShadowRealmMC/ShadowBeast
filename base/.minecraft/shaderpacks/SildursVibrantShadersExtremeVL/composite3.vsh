#version 120
/*
Sildur's vibrant shaders, before editing, remember the agreement you've accepted by downloading this shaderpack:
http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-mods/1291396-1-6-4-1-12-1-sildurs-shaders-pc-mac-intel

You are allowed to:
- Modify it for your own personal use only, so don't share it online.

You are not allowed to:
- Rename and/or modify this shaderpack and upload it with your own name on it.
- Provide mirrors by reuploading my shaderpack, if you want to link it, use the link to my thread found above.
- Copy and paste code or even whole files into your "own" shaderpack.
*/
varying vec2 texcoord;
varying float eyeAdapt;

uniform vec3 sunPosition;
uniform vec3 upPosition;

uniform ivec2 eyeBrightnessSmooth;
uniform int worldTime;
uniform float rainStrength;
uniform float frameTimeCounter;

const vec3 ToD[7] = vec3[7](  vec3(0.58597,0.16,0.025),
								vec3(0.58597,0.4,0.2),
								vec3(0.58597,0.52344,0.24680),
								vec3(0.58597,0.55422,0.34),
								vec3(0.58597,0.57954,0.38),
								vec3(0.58597,0.58,0.40),
								vec3(0.58597,0.58,0.40));
														
float luma(vec3 color) {
	return dot(color,vec3(0.299, 0.587, 0.114));
}

void main() {

	//Positioning
	gl_Position = ftransform();
	texcoord = (gl_MultiTexCoord0).xy;
	/*--------------------------------*/
	
	//Sun/Moon position
	vec3 sunVec = normalize(sunPosition);
	vec3 upVec = normalize(upPosition);
	
	float SdotU = dot(sunVec,upVec);
	float sunVisibility = pow(clamp(SdotU+0.15,0.0,0.15)/0.15,4.0);
	float moonVisibility = pow(clamp(-SdotU+0.15,0.0,0.15)/0.15,4.0);
	/*--------------------------------*/
	
	//reduced the sun color to a 7 array
	float hour = max(mod(worldTime/1000.0+2.0,24.0)-2.0,0.0);  //-0.1
	float cmpH = max(-abs(floor(hour)-6.0)+6.0,0.0); //12
	float cmpH1 = max(-abs(floor(hour)-5.0)+6.0,0.0); //1
	
	vec3 temp = ToD[int(cmpH)];
	vec3 temp2 = ToD[int(cmpH1)];
	
	vec3 sunlight  = mix(temp,temp2,fract(hour));
	/*--------------------------------*/
	
	//Lighting
	float eyebright = max(eyeBrightnessSmooth.y/255.0-0.5/16.0,0.0)*1.03225806452;
	float SkyL2 = mix(1.0,eyebright*eyebright,eyebright);	

	vec2 trCalc = min(abs(worldTime-vec2(23250.0,12700.0)),750.0);
	float tr = max(min(trCalc.x,trCalc.y)/375.0-1.0,0.0);
	
	vec4 bounced = vec4(0.5*SkyL2,0.66*SkyL2,0.7,0.3);

	vec3 sun_ambient = bounced.w * (vec3(0.25,0.62,1.32)-rainStrength*vec3(0.11,0.32,1.07)) + sunlight*(bounced.x + bounced.z);

	const vec3 moonlight = vec3(0.0035, 0.0063, 0.0098);
	
	vec3 avgAmbient =(sun_ambient*sunVisibility + moonlight*moonVisibility)*eyebright*eyebright*(0.05+tr*0.15)*4.7+0.0006;

	eyeAdapt = log(clamp(luma(avgAmbient),0.007,80.0))/log(2.6)*0.35;
	eyeAdapt = 1.0/pow(2.6,eyeAdapt)*1.75;
	/*--------------------------------*/
}
