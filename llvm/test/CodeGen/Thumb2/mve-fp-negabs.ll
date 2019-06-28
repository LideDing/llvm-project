; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main-arm-none-eabi -mattr=+mve,+fullfp16 -verify-machineinstrs %s -o - | FileCheck %s --check-prefix=CHECK --check-prefix=CHECK-MVE
; RUN: llc -mtriple=thumbv8.1m.main-arm-none-eabi -mattr=+mve.fp -verify-machineinstrs %s -o - | FileCheck %s --check-prefix=CHECK --check-prefix=CHECK-MVEFP

define arm_aapcs_vfpcc <8 x half> @fneg_float16_t(<8 x half> %src) {
; CHECK-MVE-LABEL: fneg_float16_t:
; CHECK-MVE:       @ %bb.0: @ %entry
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[0]
; CHECK-MVE-NEXT:    vmov.u16 r1, q0[1]
; CHECK-MVE-NEXT:    vmov s4, r0
; CHECK-MVE-NEXT:    movs r2, #0
; CHECK-MVE-NEXT:    vneg.f16 s4, s4
; CHECK-MVE-NEXT:    vmov r0, s4
; CHECK-MVE-NEXT:    vmov s4, r1
; CHECK-MVE-NEXT:    vneg.f16 s4, s4
; CHECK-MVE-NEXT:    vmov r1, s4
; CHECK-MVE-NEXT:    vdup.16 q1, r2
; CHECK-MVE-NEXT:    vmov.16 q1[0], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[2]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vmov.16 q1[1], r1
; CHECK-MVE-NEXT:    vneg.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[2], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[3]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vneg.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[3], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[4]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vneg.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[4], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[5]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vneg.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[5], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[6]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vneg.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[6], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[7]
; CHECK-MVE-NEXT:    vmov s0, r0
; CHECK-MVE-NEXT:    vneg.f16 s0, s0
; CHECK-MVE-NEXT:    vmov r0, s0
; CHECK-MVE-NEXT:    vmov.16 q1[7], r0
; CHECK-MVE-NEXT:    vmov q0, q1
; CHECK-MVE-NEXT:    bx lr
;
; CHECK-MVEFP-LABEL: fneg_float16_t:
; CHECK-MVEFP:       @ %bb.0: @ %entry
; CHECK-MVEFP-NEXT:    vneg.f16 q0, q0
; CHECK-MVEFP-NEXT:    bx lr
entry:
  %0 = fsub nnan ninf nsz <8 x half> <half 0.0e0, half 0.0e0, half 0.0e0, half 0.0e0, half 0.0e0, half 0.0e0, half 0.0e0, half 0.0e0>, %src
  ret <8 x half> %0
}

define arm_aapcs_vfpcc <4 x float> @fneg_float32_t(<4 x float> %src) {
; CHECK-MVE-LABEL: fneg_float32_t:
; CHECK-MVE:       @ %bb.0: @ %entry
; CHECK-MVE-NEXT:    vneg.f32 s4, s0
; CHECK-MVE-NEXT:    movs r0, #0
; CHECK-MVE-NEXT:    vneg.f32 s6, s1
; CHECK-MVE-NEXT:    vneg.f32 s8, s2
; CHECK-MVE-NEXT:    vneg.f32 s10, s3
; CHECK-MVE-NEXT:    vdup.32 q0, r0
; CHECK-MVE-NEXT:    vmov.f32 s0, s4
; CHECK-MVE-NEXT:    vmov.f32 s1, s6
; CHECK-MVE-NEXT:    vmov.f32 s2, s8
; CHECK-MVE-NEXT:    vmov.f32 s3, s10
; CHECK-MVE-NEXT:    bx lr
;
; CHECK-MVEFP-LABEL: fneg_float32_t:
; CHECK-MVEFP:       @ %bb.0: @ %entry
; CHECK-MVEFP-NEXT:    vneg.f32 q0, q0
; CHECK-MVEFP-NEXT:    bx lr
entry:
  %0 = fsub nnan ninf nsz <4 x float> <float 0.0e0, float 0.0e0, float 0.0e0, float 0.0e0>, %src
  ret <4 x float> %0
}

define arm_aapcs_vfpcc <8 x half> @fabs_float16_t(<8 x half> %src) {
; CHECK-MVE-LABEL: fabs_float16_t:
; CHECK-MVE:       @ %bb.0: @ %entry
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[0]
; CHECK-MVE-NEXT:    vmov.u16 r1, q0[1]
; CHECK-MVE-NEXT:    vmov s4, r0
; CHECK-MVE-NEXT:    movs r2, #0
; CHECK-MVE-NEXT:    vabs.f16 s4, s4
; CHECK-MVE-NEXT:    vmov r0, s4
; CHECK-MVE-NEXT:    vmov s4, r1
; CHECK-MVE-NEXT:    vabs.f16 s4, s4
; CHECK-MVE-NEXT:    vmov r1, s4
; CHECK-MVE-NEXT:    vdup.16 q1, r2
; CHECK-MVE-NEXT:    vmov.16 q1[0], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[2]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vmov.16 q1[1], r1
; CHECK-MVE-NEXT:    vabs.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[2], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[3]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vabs.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[3], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[4]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vabs.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[4], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[5]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vabs.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[5], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[6]
; CHECK-MVE-NEXT:    vmov s8, r0
; CHECK-MVE-NEXT:    vabs.f16 s8, s8
; CHECK-MVE-NEXT:    vmov r0, s8
; CHECK-MVE-NEXT:    vmov.16 q1[6], r0
; CHECK-MVE-NEXT:    vmov.u16 r0, q0[7]
; CHECK-MVE-NEXT:    vmov s0, r0
; CHECK-MVE-NEXT:    vabs.f16 s0, s0
; CHECK-MVE-NEXT:    vmov r0, s0
; CHECK-MVE-NEXT:    vmov.16 q1[7], r0
; CHECK-MVE-NEXT:    vmov q0, q1
; CHECK-MVE-NEXT:    bx lr
;
; CHECK-MVEFP-LABEL: fabs_float16_t:
; CHECK-MVEFP:       @ %bb.0: @ %entry
; CHECK-MVEFP-NEXT:    vabs.f16 q0, q0
; CHECK-MVEFP-NEXT:    bx lr
entry:
  %0 = call nnan ninf nsz <8 x half> @llvm.fabs.v8f16(<8 x half> %src)
  ret <8 x half> %0
}

define arm_aapcs_vfpcc <4 x float> @fabs_float32_t(<4 x float> %src) {
; CHECK-MVE-LABEL: fabs_float32_t:
; CHECK-MVE:       @ %bb.0: @ %entry
; CHECK-MVE-NEXT:    vabs.f32 s4, s0
; CHECK-MVE-NEXT:    movs r0, #0
; CHECK-MVE-NEXT:    vabs.f32 s6, s1
; CHECK-MVE-NEXT:    vabs.f32 s8, s2
; CHECK-MVE-NEXT:    vabs.f32 s10, s3
; CHECK-MVE-NEXT:    vdup.32 q0, r0
; CHECK-MVE-NEXT:    vmov.f32 s0, s4
; CHECK-MVE-NEXT:    vmov.f32 s1, s6
; CHECK-MVE-NEXT:    vmov.f32 s2, s8
; CHECK-MVE-NEXT:    vmov.f32 s3, s10
; CHECK-MVE-NEXT:    bx lr
;
; CHECK-MVEFP-LABEL: fabs_float32_t:
; CHECK-MVEFP:       @ %bb.0: @ %entry
; CHECK-MVEFP-NEXT:    vabs.f32 q0, q0
; CHECK-MVEFP-NEXT:    bx lr
entry:
  %0 = call nnan ninf nsz <4 x float> @llvm.fabs.v4f32(<4 x float> %src)
  ret <4 x float> %0
}

declare <4 x float> @llvm.fabs.v4f32(<4 x float>)
declare <8 x half> @llvm.fabs.v8f16(<8 x half>)

