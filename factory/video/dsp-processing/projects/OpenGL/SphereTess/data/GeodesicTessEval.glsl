#version 410

layout(triangles, equal_spacing, ccw) in;
in vec3 tcPosition[];
out vec3 tePosition;
out vec3 tePatchDistance;
uniform mat4 transform;

void main() {
  vec3 p0 = gl_TessCoord.x * tcPosition[0];
  vec3 p1 = gl_TessCoord.y * tcPosition[1];
  vec3 p2 = gl_TessCoord.z * tcPosition[2];
  tePatchDistance = gl_TessCoord;
  tePosition = normalize(p0 + p1 + p2);
  gl_Position = transform * vec4(tePosition, 1);
}