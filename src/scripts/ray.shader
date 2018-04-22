 
shader_type spatial;
render_mode blend_add;

uniform vec4 color: hint_color;

void fragment()
{
	ALBEDO = color.rgb;
	ALPHA = color.a;
} 
