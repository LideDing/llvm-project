; RUN: llc -O3 -disable-peephole -mtriple=x86_64-unknown-unknown -mattr=+avx512vp2intersect,+avx512vl < %s | FileCheck %s

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-unknown"

define void @stack_fold_vp2intersectd(<16 x i32>* %a, <16 x i32> %b, <16 x i1>* nocapture %m0, <16 x i1>* nocapture %m1) {
; CHECK-LABEL: stack_fold_vp2intersectd:
; CHECK:    vp2intersectd {{-?[0-9]*}}(%rsp), {{%zmm[0-9][0-9]*}}, {{%k[0-7]}} {{.*#+}} 64-byte Folded Reload
  %1 = tail call <2 x i64> asm sideeffect "nop", "=x,~{xmm1},~{xmm2},~{xmm3},~{xmm4},~{xmm5},~{xmm6},~{xmm7},~{xmm8},~{xmm9},~{xmm10},~{xmm11},~{xmm12},~{xmm13},~{xmm14},~{xmm15},~{xmm16},~{xmm17},~{xmm18},~{xmm19},~{xmm20},~{xmm21},~{xmm22},~{xmm23},~{xmm24},~{xmm25},~{xmm26},~{xmm27},~{xmm28},~{xmm29},~{xmm30},~{xmm31},~{flags}"()
  %2 = load <16 x i32>, <16 x i32>* %a
  %3 = tail call { <16 x i1>, <16 x i1> } @llvm.x86.avx512.vp2intersect.d.512(<16 x i32> %2, <16 x i32> %b)
  %4 = extractvalue { <16 x i1>, <16 x i1> } %3, 0
  store <16 x i1> %4, <16 x i1>* %m0
  %5 = extractvalue { <16 x i1>, <16 x i1> } %3, 1
  store <16 x i1> %5, <16 x i1>* %m1
  ret void
}
declare { <16 x i1>, <16 x i1> } @llvm.x86.avx512.vp2intersect.d.512(<16 x i32>, <16 x i32>)

define void @stack_fold_vp2intersectq(<8 x i64>* %a, <8 x i64> %b, <8 x i1>* nocapture %m0, <8 x i1>* nocapture %m1) {
; CHECK-LABEL: stack_fold_vp2intersectq:
; CHECK:    vp2intersectq {{-?[0-9]*}}(%rsp), {{%zmm[0-9][0-9]*}}, {{%k[0-7]}} {{.*#+}} 64-byte Folded Reload
  %1 = tail call <2 x i64> asm sideeffect "nop", "=x,~{xmm1},~{xmm2},~{xmm3},~{xmm4},~{xmm5},~{xmm6},~{xmm7},~{xmm8},~{xmm9},~{xmm10},~{xmm11},~{xmm12},~{xmm13},~{xmm14},~{xmm15},~{xmm16},~{xmm17},~{xmm18},~{xmm19},~{xmm20},~{xmm21},~{xmm22},~{xmm23},~{xmm24},~{xmm25},~{xmm26},~{xmm27},~{xmm28},~{xmm29},~{xmm30},~{xmm31},~{flags}"()
  %2 = load <8 x i64>, <8 x i64>* %a
  %3 = tail call { <8 x i1>, <8 x i1> } @llvm.x86.avx512.vp2intersect.q.512(<8 x i64> %2, <8 x i64> %b)
  %4 = extractvalue { <8 x i1>, <8 x i1> } %3, 0
  store <8 x i1> %4, <8 x i1>* %m0
  %5 = extractvalue { <8 x i1>, <8 x i1> } %3, 1
  store <8 x i1> %5, <8 x i1>* %m1
  ret void
}
declare { <8 x i1>, <8 x i1> } @llvm.x86.avx512.vp2intersect.q.512(<8 x i64>, <8 x i64>)

define void @stack_fold_vp2intersectd_256(<8 x i32>* %a, <8 x i32> %b, <8 x i1>* nocapture %m0, <8 x i1>* nocapture %m1) {
; CHECK-LABEL: stack_fold_vp2intersectd_256:
; CHECK:    vp2intersectd {{-?[0-9]*}}(%rsp), {{%ymm[0-9][0-9]*}}, {{%k[0-7]}} {{.*#+}} 32-byte Folded Reload
  %1 = tail call <2 x i64> asm sideeffect "nop", "=x,~{xmm1},~{xmm2},~{xmm3},~{xmm4},~{xmm5},~{xmm6},~{xmm7},~{xmm8},~{xmm9},~{xmm10},~{xmm11},~{xmm12},~{xmm13},~{xmm14},~{xmm15},~{xmm16},~{xmm17},~{xmm18},~{xmm19},~{xmm20},~{xmm21},~{xmm22},~{xmm23},~{xmm24},~{xmm25},~{xmm26},~{xmm27},~{xmm28},~{xmm29},~{xmm30},~{xmm31},~{flags}"()
  %2 = load <8 x i32>, <8 x i32>* %a
  %3 = tail call { <8 x i1>, <8 x i1> } @llvm.x86.avx512.vp2intersect.d.256(<8 x i32> %2, <8 x i32> %b)
  %4 = extractvalue { <8 x i1>, <8 x i1> } %3, 0
  store <8 x i1> %4, <8 x i1>* %m0
  %5 = extractvalue { <8 x i1>, <8 x i1> } %3, 1
  store <8 x i1> %5, <8 x i1>* %m1
  ret void
}
declare { <8 x i1>, <8 x i1> } @llvm.x86.avx512.vp2intersect.d.256(<8 x i32>, <8 x i32>)

define void @stack_fold_vp2intersectq_256(<4 x i64>* %a, <4 x i64> %b, <4 x i1>* nocapture %m0, <4 x i1>* nocapture %m1) {
; CHECK-LABEL: stack_fold_vp2intersectq_256:
; CHECK:    vp2intersectq {{-?[0-9]*}}(%rsp), {{%ymm[0-9][0-9]*}}, {{%k[0-7]}} {{.*#+}} 32-byte Folded Reload
  %1 = tail call <2 x i64> asm sideeffect "nop", "=x,~{xmm1},~{xmm2},~{xmm3},~{xmm4},~{xmm5},~{xmm6},~{xmm7},~{xmm8},~{xmm9},~{xmm10},~{xmm11},~{xmm12},~{xmm13},~{xmm14},~{xmm15},~{xmm16},~{xmm17},~{xmm18},~{xmm19},~{xmm20},~{xmm21},~{xmm22},~{xmm23},~{xmm24},~{xmm25},~{xmm26},~{xmm27},~{xmm28},~{xmm29},~{xmm30},~{xmm31},~{flags}"()
  %2 = load <4 x i64>, <4 x i64>* %a
  %3 = tail call { <4 x i1>, <4 x i1> } @llvm.x86.avx512.vp2intersect.q.256(<4 x i64> %2, <4 x i64> %b)
  %4 = extractvalue { <4 x i1>, <4 x i1> } %3, 0
  store <4 x i1> %4, <4 x i1>* %m0
  %5 = extractvalue { <4 x i1>, <4 x i1> } %3, 1
  store <4 x i1> %5, <4 x i1>* %m1
  ret void
}
declare { <4 x i1>, <4 x i1> } @llvm.x86.avx512.vp2intersect.q.256(<4 x i64>, <4 x i64>)

define void @stack_fold_vp2intersectd_128(<4 x i32>* %a, <4 x i32> %b, <4 x i1>* nocapture %m0, <4 x i1>* nocapture %m1) {
; CHECK-LABEL: stack_fold_vp2intersectd_128:
; CHECK:    vp2intersectd {{-?[0-9]*}}(%rsp), {{%xmm[0-9][0-9]*}}, {{%k[0-7]}} {{.*#+}} 16-byte Folded Reload
  %1 = tail call <2 x i64> asm sideeffect "nop", "=x,~{xmm1},~{xmm2},~{xmm3},~{xmm4},~{xmm5},~{xmm6},~{xmm7},~{xmm8},~{xmm9},~{xmm10},~{xmm11},~{xmm12},~{xmm13},~{xmm14},~{xmm15},~{xmm16},~{xmm17},~{xmm18},~{xmm19},~{xmm20},~{xmm21},~{xmm22},~{xmm23},~{xmm24},~{xmm25},~{xmm26},~{xmm27},~{xmm28},~{xmm29},~{xmm30},~{xmm31},~{flags}"()
  %2 = load <4 x i32>, <4 x i32>* %a
  %3 = tail call { <4 x i1>, <4 x i1> } @llvm.x86.avx512.vp2intersect.d.128(<4 x i32> %2, <4 x i32> %b)
  %4 = extractvalue { <4 x i1>, <4 x i1> } %3, 0
  store <4 x i1> %4, <4 x i1>* %m0
  %5 = extractvalue { <4 x i1>, <4 x i1> } %3, 1
  store <4 x i1> %5, <4 x i1>* %m1
  ret void
}
declare { <4 x i1>, <4 x i1> } @llvm.x86.avx512.vp2intersect.d.128(<4 x i32>, <4 x i32>)

define void @stack_fold_vp2intersectq_128(<2 x i64>* %a, <2 x i64> %b, <2 x i1>* nocapture %m0, <2 x i1>* nocapture %m1) {
; CHECK-LABEL: stack_fold_vp2intersectq_128:
; CHECK:    vp2intersectq {{-?[0-9]*}}(%rsp), {{%xmm[0-9][0-9]*}}, {{%k[0-7]}} {{.*#+}} 16-byte Folded Reload
  %1 = tail call <2 x i64> asm sideeffect "nop", "=x,~{xmm1},~{xmm2},~{xmm3},~{xmm4},~{xmm5},~{xmm6},~{xmm7},~{xmm8},~{xmm9},~{xmm10},~{xmm11},~{xmm12},~{xmm13},~{xmm14},~{xmm15},~{xmm16},~{xmm17},~{xmm18},~{xmm19},~{xmm20},~{xmm21},~{xmm22},~{xmm23},~{xmm24},~{xmm25},~{xmm26},~{xmm27},~{xmm28},~{xmm29},~{xmm30},~{xmm31},~{flags}"()
  %2 = load <2 x i64>, <2 x i64>* %a
  %3 = tail call { <2 x i1>, <2 x i1> } @llvm.x86.avx512.vp2intersect.q.128(<2 x i64> %2, <2 x i64> %b)
  %4 = extractvalue { <2 x i1>, <2 x i1> } %3, 0
  store <2 x i1> %4, <2 x i1>* %m0
  %5 = extractvalue { <2 x i1>, <2 x i1> } %3, 1
  store <2 x i1> %5, <2 x i1>* %m1
  ret void
}
declare { <2 x i1>, <2 x i1> } @llvm.x86.avx512.vp2intersect.q.128(<2 x i64>, <2 x i64>)
