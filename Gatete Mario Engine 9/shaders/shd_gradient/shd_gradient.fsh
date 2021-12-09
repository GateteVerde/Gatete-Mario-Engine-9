varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 frag_position;
uniform float radius;  //radius of circle

void main()
{
    float _fade = pow(length(frag_position) / radius, 3.0);
    gl_FragColor = mix( v_vColour * texture2D( gm_BaseTexture, v_vTexcoord) , vec4(0.0,0.0,0.0,1.0), _fade);
}