shader_type canvas_item;

uniform float start_height = 0.0;
uniform float end_height = 1.0;
uniform sampler2D mask;
uniform sampler2D tile : repeat_enable, filter_nearest;
uniform int tile_pixels = 32;
uniform int mask_x = 68;
uniform float freqs[3];
uniform float amp = 1.0;
uniform float amps[3];

void fragment() {
	float mask_val = texture(mask, UV).a;
	float wave_offset = 0.0;
	for(int i=0; i<3; i+=1) {
		wave_offset += sin(UV.x * freqs[i] * 3.14159) * amps[i];
	}
	float min_height = 1.0-end_height + wave_offset * amp;
	float height_mask = float(UV.y >= min_height && UV.y <= 1.0-start_height);
	float alpha = mask_val * height_mask;
	float aspect = TEXTURE_PIXEL_SIZE.y / TEXTURE_PIXEL_SIZE.x;
	float tile_scale =  float(mask_x) / float(tile_pixels);
	vec2 tile_uv = tile_scale * vec2(UV.x, UV.y / aspect);
	COLOR = vec4(texture(tile, tile_uv).rgb, alpha);
	//COLOR = vec4(1.0, 1.0, 1.0, height_mask);
}