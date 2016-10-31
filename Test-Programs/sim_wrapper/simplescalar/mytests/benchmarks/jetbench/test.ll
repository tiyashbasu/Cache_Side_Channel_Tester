; ModuleID = 'test.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i486-linux-gnu"

define void @f(i32 %y) {
entry:
  %y_addr = alloca i32                            ; <i32*> [#uses=2]
  %z = alloca i32                                 ; <i32*> [#uses=1]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %y, i32* %y_addr
  %tmp = load i32* %y_addr, align 4               ; <i32> [#uses=1]
  %tmp1 = add i32 %tmp, 12                        ; <i32> [#uses=1]
  store i32 %tmp1, i32* %z, align 4
  br label %return

return:                                           ; preds = %entry
  ret void
}

define i32 @main() {
entry:
  %retval = alloca i32                            ; <i32*> [#uses=1]
  %z = alloca i32                                 ; <i32*> [#uses=0]
  %x = alloca i32                                 ; <i32*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  %tmp = load i32* %x, align 4                    ; <i32> [#uses=1]
  call void @f(i32 %tmp) nounwind
  %tmp1 = load i32* %x, align 4                   ; <i32> [#uses=1]
  %tmp2 = add i32 %tmp1, 12                       ; <i32> [#uses=1]
  store i32 %tmp2, i32* %x, align 4
  br label %return

return:                                           ; preds = %entry
  %retval3 = load i32* %retval                    ; <i32> [#uses=1]
  ret i32 %retval3
}
