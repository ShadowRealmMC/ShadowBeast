#version 120

/*- Motion Blur sample by Pensa_73 -*/

varying vec4 texture;

void main() {
	
	gl_Position = ftransform();
	
	texture = gl_MultiTexCoord0;
}