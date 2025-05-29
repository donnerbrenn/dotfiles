
void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec4 texel = texture(iChannel0, uv);
    // Output to screen
    fragColor -= texel * .1;
}
