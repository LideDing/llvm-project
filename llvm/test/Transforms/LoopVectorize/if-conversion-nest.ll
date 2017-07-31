; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s  -loop-vectorize -force-vector-interleave=1 -force-vector-width=4 -enable-if-conversion -dce -instcombine -S | FileCheck %s

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"

define i32 @foo(i32* nocapture %A, i32* nocapture %B, i32 %n) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP26:%.*]] = icmp sgt i32 [[N:%.*]], 0
; CHECK-NEXT:    br i1 [[CMP26]], label [[FOR_BODY_PREHEADER:%.*]], label [[FOR_END:%.*]]
; CHECK:       for.body.preheader:
; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[N]], -1
; CHECK-NEXT:    [[TMP1:%.*]] = zext i32 [[TMP0]] to i64
; CHECK-NEXT:    [[TMP2:%.*]] = add nuw nsw i64 [[TMP1]], 1
; CHECK-NEXT:    [[MIN_ITERS_CHECK:%.*]] = icmp ult i64 [[TMP2]], 4
; CHECK-NEXT:    br i1 [[MIN_ITERS_CHECK]], label [[SCALAR_PH:%.*]], label [[VECTOR_MEMCHECK:%.*]]
; CHECK:       vector.memcheck:
; CHECK-NEXT:    [[TMP3:%.*]] = add i32 [[N]], -1
; CHECK-NEXT:    [[TMP4:%.*]] = zext i32 [[TMP3]] to i64
; CHECK-NEXT:    [[TMP5:%.*]] = add nuw nsw i64 [[TMP4]], 1
; CHECK-NEXT:    [[SCEVGEP:%.*]] = getelementptr i32, i32* [[A:%.*]], i64 [[TMP5]]
; CHECK-NEXT:    [[SCEVGEP4:%.*]] = getelementptr i32, i32* [[B:%.*]], i64 [[TMP5]]
; CHECK-NEXT:    [[BOUND0:%.*]] = icmp ugt i32* [[SCEVGEP4]], [[A]]
; CHECK-NEXT:    [[BOUND1:%.*]] = icmp ugt i32* [[SCEVGEP]], [[B]]
; CHECK-NEXT:    [[MEMCHECK_CONFLICT:%.*]] = and i1 [[BOUND0]], [[BOUND1]]
; CHECK-NEXT:    br i1 [[MEMCHECK_CONFLICT]], label [[SCALAR_PH]], label [[VECTOR_PH:%.*]]
; CHECK:       vector.ph:
; CHECK-NEXT:    [[TMP6:%.*]] = and i32 [[N]], 3
; CHECK-NEXT:    [[N_MOD_VF:%.*]] = zext i32 [[TMP6]] to i64
; CHECK-NEXT:    [[N_VEC:%.*]] = sub nsw i64 [[TMP2]], [[N_MOD_VF]]
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, [[VECTOR_PH]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP7:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDEX]]
; CHECK-NEXT:    [[TMP8:%.*]] = bitcast i32* [[TMP7]] to <4 x i32>*
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <4 x i32>, <4 x i32>* [[TMP8]], align 4, !alias.scope !0, !noalias !3
; CHECK-NEXT:    [[TMP9:%.*]] = getelementptr inbounds i32, i32* [[B]], i64 [[INDEX]]
; CHECK-NEXT:    [[TMP10:%.*]] = bitcast i32* [[TMP9]] to <4 x i32>*
; CHECK-NEXT:    [[WIDE_LOAD6:%.*]] = load <4 x i32>, <4 x i32>* [[TMP10]], align 4, !alias.scope !3
; CHECK-NEXT:    [[TMP11:%.*]] = icmp sgt <4 x i32> [[WIDE_LOAD]], [[WIDE_LOAD6]]
; CHECK-NEXT:    [[TMP12:%.*]] = icmp sgt <4 x i32> [[WIDE_LOAD]], <i32 19, i32 19, i32 19, i32 19>
; CHECK-NEXT:    [[TMP13:%.*]] = icmp slt <4 x i32> [[WIDE_LOAD6]], <i32 4, i32 4, i32 4, i32 4>
; CHECK-NEXT:    [[TMP14:%.*]] = select <4 x i1> [[TMP13]], <4 x i32> <i32 4, i32 4, i32 4, i32 4>, <4 x i32> <i32 5, i32 5, i32 5, i32 5>
; CHECK-NEXT:    [[TMP15:%.*]] = and <4 x i1> [[TMP12]], [[TMP11]]
; CHECK-NEXT:    [[PREDPHI:%.*]] = select <4 x i1> [[TMP15]], <4 x i32> <i32 3, i32 3, i32 3, i32 3>, <4 x i32> <i32 9, i32 9, i32 9, i32 9>
; CHECK-NEXT:    [[TMP16:%.*]] = xor <4 x i1> [[TMP12]], <i1 true, i1 true, i1 true, i1 true>
; CHECK-NEXT:    [[TMP17:%.*]] = and <4 x i1> [[TMP11]], [[TMP16]]
; CHECK-NEXT:    [[PREDPHI7:%.*]] = select <4 x i1> [[TMP17]], <4 x i32> [[TMP14]], <4 x i32> [[PREDPHI]]
; CHECK-NEXT:    [[TMP18:%.*]] = bitcast i32* [[TMP7]] to <4 x i32>*
; CHECK-NEXT:    store <4 x i32> [[PREDPHI7]], <4 x i32>* [[TMP18]], align 4, !alias.scope !0, !noalias !3
; CHECK-NEXT:    [[INDEX_NEXT]] = add i64 [[INDEX]], 4
; CHECK-NEXT:    [[TMP19:%.*]] = icmp eq i64 [[INDEX_NEXT]], [[N_VEC]]
; CHECK-NEXT:    br i1 [[TMP19]], label [[MIDDLE_BLOCK:%.*]], label [[VECTOR_BODY]], !llvm.loop !5
; CHECK:       middle.block:
; CHECK-NEXT:    [[CMP_N:%.*]] = icmp eq i32 [[TMP6]], 0
; CHECK-NEXT:    br i1 [[CMP_N]], label [[FOR_END_LOOPEXIT:%.*]], label [[SCALAR_PH]]
; CHECK:       scalar.ph:
; CHECK-NEXT:    [[BC_RESUME_VAL:%.*]] = phi i64 [ [[N_VEC]], [[MIDDLE_BLOCK]] ], [ 0, [[FOR_BODY_PREHEADER]] ], [ 0, [[VECTOR_MEMCHECK]] ]
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[INDVARS_IV:%.*]] = phi i64 [ [[INDVARS_IV_NEXT:%.*]], [[IF_END14:%.*]] ], [ [[BC_RESUME_VAL]], [[SCALAR_PH]] ]
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDVARS_IV]]
; CHECK-NEXT:    [[TMP20:%.*]] = load i32, i32* [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds i32, i32* [[B]], i64 [[INDVARS_IV]]
; CHECK-NEXT:    [[TMP21:%.*]] = load i32, i32* [[ARRAYIDX2]], align 4
; CHECK-NEXT:    [[CMP3:%.*]] = icmp sgt i32 [[TMP20]], [[TMP21]]
; CHECK-NEXT:    br i1 [[CMP3]], label [[IF_THEN:%.*]], label [[IF_END14]]
; CHECK:       if.then:
; CHECK-NEXT:    [[CMP6:%.*]] = icmp sgt i32 [[TMP20]], 19
; CHECK-NEXT:    br i1 [[CMP6]], label [[IF_END14]], label [[IF_ELSE:%.*]]
; CHECK:       if.else:
; CHECK-NEXT:    [[CMP10:%.*]] = icmp slt i32 [[TMP21]], 4
; CHECK-NEXT:    [[DOT:%.*]] = select i1 [[CMP10]], i32 4, i32 5
; CHECK-NEXT:    br label [[IF_END14]]
; CHECK:       if.end14:
; CHECK-NEXT:    [[X_0:%.*]] = phi i32 [ 9, [[FOR_BODY]] ], [ 3, [[IF_THEN]] ], [ [[DOT]], [[IF_ELSE]] ]
; CHECK-NEXT:    store i32 [[X_0]], i32* [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[INDVARS_IV_NEXT]] = add i64 [[INDVARS_IV]], 1
; CHECK-NEXT:    [[LFTR_WIDEIV:%.*]] = trunc i64 [[INDVARS_IV_NEXT]] to i32
; CHECK-NEXT:    [[EXITCOND:%.*]] = icmp eq i32 [[LFTR_WIDEIV]], [[N]]
; CHECK-NEXT:    br i1 [[EXITCOND]], label [[FOR_END_LOOPEXIT]], label [[FOR_BODY]], !llvm.loop !8
; CHECK:       for.end.loopexit:
; CHECK-NEXT:    br label [[FOR_END]]
; CHECK:       for.end:
; CHECK-NEXT:    ret i32 undef
;
entry:
  %cmp26 = icmp sgt i32 %n, 0
  br i1 %cmp26, label %for.body, label %for.end

for.body:
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end14 ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i32, i32* %A, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %B, i64 %indvars.iv
  %1 = load i32, i32* %arrayidx2, align 4
  %cmp3 = icmp sgt i32 %0, %1
  br i1 %cmp3, label %if.then, label %if.end14

if.then:
  %cmp6 = icmp sgt i32 %0, 19
  br i1 %cmp6, label %if.end14, label %if.else

if.else:
  %cmp10 = icmp slt i32 %1, 4
  %. = select i1 %cmp10, i32 4, i32 5
  br label %if.end14

if.end14:
  %x.0 = phi i32 [ 9, %for.body ], [ 3, %if.then ], [ %., %if.else ]  ; <------------- A PHI with 3 entries that we can still vectorize.
  store i32 %x.0, i32* %arrayidx, align 4
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret i32 undef
}

