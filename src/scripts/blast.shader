shader_type canvas_item;
render_mode unshaded;

uniform float scale: hint_range(0.0, 0.1);

void fragment()
{
	vec2 mid = vec2(0.5) - SCREEN_UV.xy;
	float radius = 1.0 - length(mid);
	
	
//	float angle = atan(toCenter.y,toCenter.x);
//    float radius = length(toCenter)*2.0;

    // Map the angle (-PI to PI) to the Hue (from 0 to 1)
    // and the Saturation to the radius	

	vec4 color = texture(SCREEN_TEXTURE, vec2(SCREEN_UV));
	vec4 shift = texture(SCREEN_TEXTURE, vec2(SCREEN_UV) * (1.0 - radius * scale * 0.01));
	COLOR = mix(color, shift, 0.5);
	
} 
