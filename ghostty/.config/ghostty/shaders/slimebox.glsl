float detail = 10000.;
vec2 uv;
vec3 color;

struct RR
{
    vec3 col;
    vec3 pos;
    bool hit;
};

vec3 rotate(vec3 p, vec3 t)
{
    float c = cos(t.x), s = sin(t.x);
    mat3 m = mat3(vec3(1, 0, 0), vec3(0, c, -s), vec3(0, s, c));

    c = cos(t.y);
    s = sin(t.y);
    m *= mat3(vec3(c, 0, s), vec3(0, 1, 0), vec3(-s, 0, c));

    c = cos(t.z);
    s = sin(t.z);
    m *= mat3(vec3(c, -s, 0), vec3(s, c, 0), vec3(0, 0, 1));

    return m * p;
}

vec4 _min(vec4 a, vec4 b)
{
    return a.w < b.w ? a : b;
}

vec4 _max(vec4 a, vec4 b, bool cut)
{
    b.w *= cut ? -1. : 1.;
    return a.w < b.w ? b : a;
}

vec4 softmin(vec4 f1, vec4 f2, float val)
{
    if (val == .0)
        return _min(f1, f2);
    vec4 res;
    float e = max(val - abs(f1.w - f2.w), 0.0);
    res = _min(f1, f2);

    res.w -= e * e * 0.25 / val;
    res.xyz = mix(f1.xyz, f2.xyz, clamp(abs(f1.w - res.w) / abs(f1.w - f2.w), 0., 1.));
    return res;
}

vec4 sdSphere(vec3 p, float r, vec3 color)
{
    return vec4(color, length(p) - r);
}

vec4 sdRoundBox(vec3 p, vec3 b, float r, vec3 color)
{
    vec3 q = abs(p) - b;
    return vec4(color, length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0) - r);
}

vec4 sdCross(vec3 p, vec2 s, float r, vec3 color)
{
    return _min(_min(sdRoundBox(p, s.xyy, r, color), sdRoundBox(p, s.yxy, r, color)), sdRoundBox(p, s.yyx, r, color));
}

vec4 map(vec3 p)
{
    vec4 ground = sdRoundBox(rotate(p + vec3(0, 2.5, 0), vec3(1., 0., 0.)), vec3(40, 40, .1), .0, vec3(.2, .2, .2));
    p = rotate(p, vec3(iTime * .5, iTime * .5, .5));
    vec4 final = sdCross(p, vec2(4.5, .89), .21, vec3(.1, .1, .75));
    vec4 box = sdRoundBox(p, vec3(1.), .25, vec3(.1, .75, .1));
    final = _max(box, final, true);
    final = _min(final, sdRoundBox(p, vec3(.0), .4, vec3(.7, .0, .0)));
    final = mix(box, final, sin(iTime) * .5 + .5);
    return _min(final, ground);
}

vec3 normal(vec3 p)
{
    vec2 eps = vec2(.005, 0.);
    return normalize(vec3(map(p + eps.xyy).w - map(p - eps.xyy).w,
            map(p + eps.yxy).w - map(p - eps.yxy).w,
            map(p + eps.yyx).w - map(p - eps.yyx).w));
}

float lightRender(vec3 n, vec3 l, vec3 v, float strength)
{
    return ((dot(n, normalize(l)) * .5 + .5) + pow(max(dot(v, reflect(normalize(l), n)), 0.), 128.)) * strength;
}

RR march(vec3 ro, vec3 rd, float maxl, float aprox)
{
    rd = normalize(rd);
    RR res;
    res.pos = ro;
    res.hit = false;
    vec4 d;
    for (float l = .0; l < maxl; )
    {
        d = map(res.pos);
        if (d.w < aprox)
        {
            res.hit = true;
            res.col = d.xyz;
            break;
        }
        res.pos += rd * d.w;
        l += d.w;
    }
    return res;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    uv = gl_FragCoord.xy / vec2(iResolution.x) - vec2(.5, .3);
    vec3 ro = vec3(.0, .0, -10.5);
    vec3 n;
    vec3 rd = normalize(vec3(uv, 1.));
    float light = .0;

    vec3 l1 = vec3(-2.8, 5., -3.0);
    vec3 l2 = vec3(-.3, 2.15, -2.25);
    vec3 l3 = vec3(-4.2, 1.5, -2.25);

    RR res = march(ro, rd, 40., 10. / detail);

    if (res.hit == true)
    {
        n = normal(res.pos);
        light = lightRender(n, l1, rd, .4);
        light += lightRender(n, l2, rd, .350);
        light += lightRender(n, l3, rd, .125);

        color = res.col * light;
        if (res.hit)
        {
            res.pos -= rd * .01;
            vec3 nrd = reflect(rd, n);
            RR reflection = march(res.pos, nrd, 20., 3. / detail);
            n = normal(reflection.pos);
            light = lightRender(n, l1, nrd, .4);
            light += lightRender(n, l2, nrd, .350);
            light += lightRender(n, l3, nrd, .125);
            reflection.col *= light;

            color = mix(color, reflection.col, .125);

            RR shadow = march(res.pos, l1 - res.pos, 20., 1. / detail);
            if (shadow.hit)
                color *= .5;
        }
    }
    color *= color;
    color = pow(color, vec3(1.0 / 2.2)); // gamma correction
    color = clamp(color, 0, 1) * .5;

    vec2 uv2 = fragCoord / iResolution.xy;
    vec4 terminalColor = texture(iChannel0, uv2);
    float mask = 1 - step(0.5, dot(terminalColor.rgb, vec3(1.0)));
    vec3 blendedColor = mix(terminalColor.rgb, color, mask);
    fragColor = vec4(blendedColor, terminalColor.a);
}
