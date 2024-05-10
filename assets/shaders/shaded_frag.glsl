#version 140

out vec4 colour;    
in vec3 v_normal;
in vec3 v_position;

const vec3 ambient_color = vec3(0.2, 0.0, 0.0);
const vec3 diffuse_color = vec3(1.0, 0.5, 0.5);
const vec3 specular_color = vec3(1.0, 1.0, 1.0);

const vec3 u_light = vec3(1.0, 1.0, 0.0);
void main() {
    float diffuse = max(dot(normalize(v_normal), normalize(u_light)), 0.0);

    vec3 camera_dir = normalize(-v_position);
    vec3 half_direction = normalize(normalize(u_light) + camera_dir);
    float specular = pow(max(dot(half_direction, normalize(v_normal)), 0.0), 16.0);

    colour = vec4(ambient_color + diffuse * diffuse_color + specular * specular_color, 1.0);
}