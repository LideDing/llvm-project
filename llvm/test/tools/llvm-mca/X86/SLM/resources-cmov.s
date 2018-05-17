# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=slm -instruction-tables < %s | FileCheck %s

cmovow    %si, %di
cmovnow   %si, %di
cmovbw    %si, %di
cmovaew   %si, %di
cmovew    %si, %di
cmovnew   %si, %di
cmovbew   %si, %di
cmovaw    %si, %di
cmovsw    %si, %di
cmovnsw   %si, %di
cmovpw    %si, %di
cmovnpw   %si, %di
cmovlw    %si, %di
cmovgew   %si, %di
cmovlew   %si, %di
cmovgw    %si, %di

cmovow    (%rax), %di
cmovnow   (%rax), %di
cmovbw    (%rax), %di
cmovaew   (%rax), %di
cmovew    (%rax), %di
cmovnew   (%rax), %di
cmovbew   (%rax), %di
cmovaw    (%rax), %di
cmovsw    (%rax), %di
cmovnsw   (%rax), %di
cmovpw    (%rax), %di
cmovnpw   (%rax), %di
cmovlw    (%rax), %di
cmovgew   (%rax), %di
cmovlew   (%rax), %di
cmovgw    (%rax), %di

cmovol    %esi, %edi
cmovnol   %esi, %edi
cmovbl    %esi, %edi
cmovael   %esi, %edi
cmovel    %esi, %edi
cmovnel   %esi, %edi
cmovbel   %esi, %edi
cmoval    %esi, %edi
cmovsl    %esi, %edi
cmovnsl   %esi, %edi
cmovpl    %esi, %edi
cmovnpl   %esi, %edi
cmovll    %esi, %edi
cmovgel   %esi, %edi
cmovlel   %esi, %edi
cmovgl    %esi, %edi

cmovol    (%rax), %edi
cmovnol   (%rax), %edi
cmovbl    (%rax), %edi
cmovael   (%rax), %edi
cmovel    (%rax), %edi
cmovnel   (%rax), %edi
cmovbel   (%rax), %edi
cmoval    (%rax), %edi
cmovsl    (%rax), %edi
cmovnsl   (%rax), %edi
cmovpl    (%rax), %edi
cmovnpl   (%rax), %edi
cmovll    (%rax), %edi
cmovgel   (%rax), %edi
cmovlel   (%rax), %edi
cmovgl    (%rax), %edi

cmovoq    %rsi, %rdi
cmovnoq   %rsi, %rdi
cmovbq    %rsi, %rdi
cmovaeq   %rsi, %rdi
cmoveq    %rsi, %rdi
cmovneq   %rsi, %rdi
cmovbeq   %rsi, %rdi
cmovaq    %rsi, %rdi
cmovsq    %rsi, %rdi
cmovnsq   %rsi, %rdi
cmovpq    %rsi, %rdi
cmovnpq   %rsi, %rdi
cmovlq    %rsi, %rdi
cmovgeq   %rsi, %rdi
cmovleq   %rsi, %rdi
cmovgq    %rsi, %rdi

cmovoq    (%rax), %rdi
cmovnoq   (%rax), %rdi
cmovbq    (%rax), %rdi
cmovaeq   (%rax), %rdi
cmoveq    (%rax), %rdi
cmovneq   (%rax), %rdi
cmovbeq   (%rax), %rdi
cmovaq    (%rax), %rdi
cmovsq    (%rax), %rdi
cmovnsq   (%rax), %rdi
cmovpq    (%rax), %rdi
cmovnpq   (%rax), %rdi
cmovlq    (%rax), %rdi
cmovgeq   (%rax), %rdi
cmovleq   (%rax), %rdi
cmovgq    (%rax), %rdi

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      2     1.00                        cmovow	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovnow	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovbw	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovaew	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovew	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovnew	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovbew	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovaw	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovsw	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovnsw	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovpw	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovnpw	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovlw	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovgew	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovlew	%si, %di
# CHECK-NEXT:  1      2     1.00                        cmovgw	%si, %di
# CHECK-NEXT:  1      5     1.00    *                   cmovow	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovnow	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovbw	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovaew	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovew	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovnew	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovbew	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovaw	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovsw	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovnsw	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovpw	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovnpw	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovlw	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovgew	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovlew	(%rax), %di
# CHECK-NEXT:  1      5     1.00    *                   cmovgw	(%rax), %di
# CHECK-NEXT:  1      2     1.00                        cmovol	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovnol	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovbl	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovael	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovel	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovnel	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovbel	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmoval	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovsl	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovnsl	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovpl	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovnpl	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovll	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovgel	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovlel	%esi, %edi
# CHECK-NEXT:  1      2     1.00                        cmovgl	%esi, %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovol	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovnol	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovbl	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovael	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovel	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovnel	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovbel	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmoval	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovsl	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovnsl	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovpl	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovnpl	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovll	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovgel	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovlel	(%rax), %edi
# CHECK-NEXT:  1      5     1.00    *                   cmovgl	(%rax), %edi
# CHECK-NEXT:  1      2     1.00                        cmovoq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovnoq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovbq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovaeq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmoveq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovneq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovbeq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovaq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovsq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovnsq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovpq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovnpq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovlq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovgeq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovleq	%rsi, %rdi
# CHECK-NEXT:  1      2     1.00                        cmovgq	%rsi, %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovoq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovnoq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovbq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovaeq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmoveq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovneq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovbeq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovaq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovsq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovnsq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovpq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovnpq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovlq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovgeq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovleq	(%rax), %rdi
# CHECK-NEXT:  1      5     1.00    *                   cmovgq	(%rax), %rdi

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SLMDivider
# CHECK-NEXT: [1]   - SLMFPDivider
# CHECK-NEXT: [2]   - SLMFPMultiplier
# CHECK-NEXT: [3]   - SLM_FPC_RSV0
# CHECK-NEXT: [4]   - SLM_FPC_RSV1
# CHECK-NEXT: [5]   - SLM_IEC_RSV0
# CHECK-NEXT: [6]   - SLM_IEC_RSV1
# CHECK-NEXT: [7]   - SLM_MEC_RSV

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]
# CHECK-NEXT:  -      -      -      -      -     96.00  96.00  48.00

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    Instructions:
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovow	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnow	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovbw	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovaew	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovew	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnew	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovbew	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovaw	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovsw	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnsw	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovpw	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnpw	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovlw	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovgew	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovlew	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovgw	%si, %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovow	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnow	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovbw	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovaew	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovew	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnew	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovbew	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovaw	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovsw	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnsw	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovpw	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnpw	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovlw	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovgew	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovlew	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovgw	(%rax), %di
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovol	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnol	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovbl	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovael	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovel	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnel	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovbel	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmoval	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovsl	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnsl	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovpl	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnpl	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovll	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovgel	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovlel	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovgl	%esi, %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovol	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnol	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovbl	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovael	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovel	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnel	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovbel	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmoval	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovsl	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnsl	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovpl	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnpl	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovll	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovgel	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovlel	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovgl	(%rax), %edi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovoq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnoq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovbq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovaeq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmoveq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovneq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovbeq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovaq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovsq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnsq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovpq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovnpq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovlq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovgeq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovleq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -     cmovgq	%rsi, %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovoq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnoq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovbq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovaeq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmoveq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovneq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovbeq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovaq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovsq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnsq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovpq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovnpq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovlq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovgeq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovleq	(%rax), %rdi
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00   1.00   cmovgq	(%rax), %rdi

