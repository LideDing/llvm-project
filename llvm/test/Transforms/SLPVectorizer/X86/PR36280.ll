; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -slp-vectorizer -S < %s -mtriple=x86_64-unknown-linux-gnu -mcpu=bdver2 | FileCheck %s

define float @jacobi(float* %p, float %x, float %y, float %z) {
; CHECK-LABEL: @jacobi(
; CHECK-NEXT:    [[GEP1:%.*]] = getelementptr float, float* [[P:%.*]], i64 1
; CHECK-NEXT:    [[GEP2:%.*]] = getelementptr float, float* [[P]], i64 2
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast float* [[GEP1]] to <2 x float>*
; CHECK-NEXT:    [[TMP2:%.*]] = load <2 x float>, <2 x float>* [[TMP1]], align 4
; CHECK-NEXT:    [[TMP3:%.*]] = insertelement <2 x float> undef, float [[X:%.*]], i32 0
; CHECK-NEXT:    [[TMP4:%.*]] = insertelement <2 x float> [[TMP3]], float [[Y:%.*]], i32 1
; CHECK-NEXT:    [[TMP5:%.*]] = fmul <2 x float> [[TMP4]], [[TMP2]]
; CHECK-NEXT:    [[TMP6:%.*]] = extractelement <2 x float> [[TMP5]], i32 0
; CHECK-NEXT:    [[ADD1:%.*]] = fadd float [[TMP6]], [[Z:%.*]]
; CHECK-NEXT:    [[TMP7:%.*]] = extractelement <2 x float> [[TMP5]], i32 1
; CHECK-NEXT:    [[ADD2:%.*]] = fadd float [[TMP7]], [[ADD1]]
; CHECK-NEXT:    ret float [[ADD2]]
;
  %gep1 = getelementptr float, float* %p, i64 1
  %gep2 = getelementptr float, float* %p, i64 2
  %p1 = load float, float* %gep1
  %p2 = load float, float* %gep2
  %mul1 = fmul float %p1, %x
  %mul2 = fmul float %p2, %y
  %add1 = fadd float %mul1, %z
  %add2 = fadd float %mul2, %add1
  ret float %add2
}
