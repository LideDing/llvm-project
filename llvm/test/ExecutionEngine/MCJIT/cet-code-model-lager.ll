; RUN: %lli -code-model=large %s > /dev/null
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local local_unnamed_addr global i32 1, align 4

; Function Attrs: nofree noinline norecurse nounwind uwtable writeonly
define dso_local void @ext() local_unnamed_addr #0 {
entry:
  store i32 0, i32* @a, align 4
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  tail call fastcc void @foo()
  %0 = load i32, i32* @a, align 4
  ret i32 %0
}

; Function Attrs: nofree noinline norecurse nounwind uwtable writeonly
define internal fastcc void @foo() unnamed_addr #0 {
entry:
  tail call void @ext()
  ret void
}

!llvm.module.flags = !{!0, !1, !2, !3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 4, !"cf-protection-return", i32 1}
!2 = !{i32 4, !"cf-protection-branch", i32 1}
!3 = !{i32 1, !"Code Model", i32 4}
