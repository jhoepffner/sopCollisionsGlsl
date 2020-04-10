# sopCollisionsGlsl
une proposition de detection de collisions en GLSL

uniform vec4 uSpherePos; // position et rayon de la sphère

out vec4 fragColor;
void main()
{
	vec4 pos = texture(sTD2DInputs[0], vUV.st);// entrée position
	vec4 rot = texture(sTD2DInputs[1], vUV.st);// entrée rotation
	vec4 col = texture(sTD2DInputs[2], vUV.st);// entrée couleur
	vec4 dim = texture(sTD2DInputs[3], vUV.st);// entrée dimension
	float dist = distance (pos.xyz, uSpherePos.xyz);//calcul de la distance entre les centres
	float distMax = uSpherePos.w + dim.x/2*1.44;//distance de collision
	if (dist < distMax){
		col = vec4(1.0);//le cube se colore en blanc
	}
	fragColor = TDOutputSwizzle(col);
}
