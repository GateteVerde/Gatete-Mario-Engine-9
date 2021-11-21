varying vec2 v_texcoord;

uniform float time;
uniform vec2 resolution;
uniform float fade;

void main()
{ 
    float gray = dot(texture2D(gm_BaseTexture,v_texcoord).rgb, vec3(0.21, 0.71, 0.07));

    gl_FragColor = vec4(mix(texture2D(gm_BaseTexture,v_texcoord).rgb,vec3(gray),fade), texture2D(gm_BaseTexture,v_texcoord).a);
}
