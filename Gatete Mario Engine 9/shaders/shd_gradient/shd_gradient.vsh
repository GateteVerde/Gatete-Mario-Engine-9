attribute vec3 in_Position;  
attribute vec4 in_Colour; 
attribute vec2 in_TextureCoord;  
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 frag_position;
uniform vec2 center;  //position of center of circle

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    frag_position = in_Position.xy - center;
}