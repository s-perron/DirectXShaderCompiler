// RUN: %dxc -T ps_6_0 -E main -fcgl -fspv-target-env=vulkan1.3 %s -spirv | FileCheck %s

// CHECK: OpCapability Shader
// sCHECK: OpCapability MeshShadingEXT
// sCHECK: OpExtension "SPV_EXT_mesh_shader"

struct S0 {
  float s0_0 : FPA;
  float s0_1 : FPB;
};

struct S1 {
  float s1_0 : FPC;
  float s1_1 : FPD;
};

struct S2 {
  float s2_0 : FPE;
  [[vk::perprimitive]] float s2_1 : FPF;
};

float4 main(S0 s0,
            [[vk::perprimitive]] S1 s1,
            S2 s2,
            float f0 : FPG,
            [[vk::perprimitive]] float f1 : FPH ) : SV_Target {
  return 1.0;
}
