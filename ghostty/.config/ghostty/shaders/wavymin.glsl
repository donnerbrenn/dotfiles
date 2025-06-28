float x(float x) {
    vec2 v = vec2(0), n = vec2(.86, .1), i = vec2(.955, .4), m = vec2(.99, 1), d = vec2(1, 0);
    return x < v.x ? v.y : x < n.x ? mix(v.y, n.y, (x - v.x) / (n.x - v.x)) : x < i.x ? mix(n.y, i.y, (x - n.x) / (i.x - n.x)) : x < m.x ? mix(i.y, m.y, (x - i.x) / (m.x - i.x)) : x < d.x ? mix(m.y, d.y, (x - m.x) / (d.x - m.x)) : d.y;
}float x(vec2 v, vec2 n, vec2 y, vec2 m) {
    return x(v.y / (.5 + sin((iTime * n.x + y.x + v.x) * m.x) * .06 + sin((iTime * n.y + y.y + v.x) * m.y) * .05)) * .27;
}float v(vec2 v) {
    return x(vec2(v.x, v.y - .25), vec2(.03, .06), vec2(0, .02), vec2(8, 3.7));
}float e(vec2 v) {
    return x(vec2(v.x, v.y - .25), vec2(.04, .07), vec2(.16, -.37), vec2(6.7, 2.89));
}float n(vec2 v) {
    return x(vec2(v.x, .75 - v.y), vec2(.035, .055), vec2(-.09, .27), vec2(7.4, 2.51));
}float s(vec2 v) {
    return x(vec2(v.x, .75 - v.y), vec2(.032, .09), vec2(.08, -.22), vec2(6.5, 3.89));
}void mainImage(out vec4 y, vec2 x) {
    vec4 i = texture(iChannel0, x.xy / iResolution.xy);
    y = vec4(mix(i.xyz, (mix(vec3(.05, .05, .3), vec3(.1, .65, .85), (x.x / iResolution.x + (1. - x.y / iResolution.y)) * .55) + vec3(1) * (v(x.xy / iResolution.xy) + e(x.xy / iResolution.xy) + n(x.xy / iResolution.xy) + s(x.xy / iResolution.xy))) * .2, 1 - step(.5, dot(i.xyz, vec3(1)))), i.w);
}

