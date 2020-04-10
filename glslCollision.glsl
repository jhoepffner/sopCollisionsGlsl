uniform vec4 uSpherePos;

out vec4 fragColor;
void main()
{
	vec4 pos = texture(sTD2DInputs[0], vUV.st);
	vec4 rot = texture(sTD2DInputs[1], vUV.st);
	vec4 col = texture(sTD2DInputs[2], vUV.st);
	vec4 dim = texture(sTD2DInputs[3], vUV.st);
	float dist = distance (pos.xyz, uSpherePos.xyz);
	float distMax = uSpherePos.w + dim.x/2*1.44;
	if (dist < distMax){
		col = vec4(1.0);
	}
	fragColor = TDOutputSwizzle(col);
}
