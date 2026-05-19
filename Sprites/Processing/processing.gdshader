shader_type canvas_item;

void fragment()
{
	vec4 texture_color = texture(TEXTURE, UV);
	COLOR = vec4(1.0, 1.0, 1.0, texture_color.a);
}