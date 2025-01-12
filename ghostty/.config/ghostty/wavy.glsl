float gradient(float p) {
    vec2 pt0 = vec2(0.);
    vec2 pt1 = vec2(.86, .1);
    vec2 pt2 = vec2(.955, .4);
    vec2 pt3 = vec2(.99, 1.);
    vec2 pt4 = vec2(1., .0);
    return p < pt0.x ? pt0.y :
    p < pt1.x ? mix(pt0.y, pt1.y, (p - pt0.x) / (pt1.x - pt0.x)) :
    p < pt2.x ? mix(pt1.y, pt2.y, (p - pt1.x) / (pt2.x - pt1.x)) :
    p < pt3.x ? mix(pt2.y, pt3.y, (p - pt2.x) / (pt3.x - pt2.x)) :
    p < pt4.x ? mix(pt3.y, pt4.y, (p - pt3.x) / (pt4.x - pt3.x)) :
    pt4.y;
}

float waveN(vec2 uv, vec2 s12, vec2 t12, vec2 f12, vec2 h12) {
    float i_x12x = sin((iTime * s12.x + t12.x + uv.x) * f12.x) * h12.x;
    float i_x12y = sin((iTime * s12.y + t12.y + uv.x) * f12.y) * h12.y;
    return gradient(uv.y / (0.5 + i_x12x + i_x12y)) * 0.27;
}

float wave1(vec2 uv) {
    return waveN(vec2(uv.x, uv.y - 0.25), vec2(0.03, 0.06), vec2(0.00, 0.02), vec2(8.0, 3.7), vec2(0.06, 0.05));
}

float wave2(vec2 uv) {
    return waveN(vec2(uv.x, uv.y - 0.25), vec2(0.04, 0.07), vec2(0.16, -0.37), vec2(6.7, 2.89), vec2(0.06, 0.05));
}

float wave3(vec2 uv) {
    return waveN(vec2(uv.x, 0.75 - uv.y), vec2(0.035, 0.055), vec2(-0.09, 0.27), vec2(7.4, 2.51), vec2(0.06, 0.05));
}

float wave4(vec2 uv) {
    return waveN(vec2(uv.x, 0.75 - uv.y), vec2(0.032, 0.09), vec2(0.08, -0.22), vec2(6.5, 3.89), vec2(0.06, 0.05));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 i_uv = fragCoord.xy / iResolution.xy;
    float i_waves = wave1(i_uv) + wave2(i_uv) + wave3(i_uv) + wave4(i_uv);
    float i_x = fragCoord.x / iResolution.x;
    float i_y = 1.0 - fragCoord.y / iResolution.y;
    vec3 i_bg = mix(vec3(0.05, 0.05, 0.3), vec3(0.1, 0.65, 0.85), (i_x + i_y) * 0.55);
    vec3 i_ac = i_bg + vec3(1.0, 1.0, 1.0) * i_waves;
    vec4 terminalColor = texture(iChannel0, i_uv);
    float i_mask = 1 - step(0.5, dot(terminalColor.rgb, vec3(1.0)));
    vec3 i_blendedColor = mix(terminalColor.rgb, i_ac * .2, i_mask);
    fragColor = vec4(i_blendedColor, terminalColor.a);
}
