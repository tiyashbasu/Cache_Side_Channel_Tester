; ModuleID = 'jetbench_m.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i486-linux-gnu"

%struct.input_data = type { double, double, double, double }

@inp = global [35 x %struct.input_data] [%struct.input_data { double 0.000000e+00, double 0.000000e+00, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.000000e+02, double 0.000000e+00, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.000000e+02, double 1.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 2.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 3.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 4.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 5.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 6.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 7.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 8.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 9.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.500000e+02, double 1.000000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.500000e+02, double 1.500000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 4.000000e+02, double 2.000000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 4.500000e+02, double 2.500000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 5.000000e+02, double 3.000000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 3.000000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 3.000000e+04, double 6.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 2.500000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 2.000000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 1.500000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 5.000000e+02, double 1.500000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 4.000000e+02, double 1.500000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 4.000000e+02, double 1.000000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 1.000000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.850000e+02, double 9.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.700000e+02, double 8.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.550000e+02, double 7.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.400000e+02, double 6.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.250000e+02, double 5.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.100000e+02, double 4.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.950000e+02, double 3.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.800000e+02, double 2.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.650000e+02, double 1.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.500000e+02, double 0.000000e+00, double 5.000000e+01, double 5.000000e-02 }], align 32 ; <[35 x %struct.input_data]*> [#uses=3]
@u0d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@.str = internal constant [4 x i8] c"u0d\00"      ; <[4 x i8]*> [#uses=1]
@engine.b = internal global i1 false              ; <i1*> [#uses=2]
@altd = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@throtl = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@tref = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@g0d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@g0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@gama = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@trat = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=8]
@tt = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=11]
@prat = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=9]
@pt = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=12]
@eta = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=6]
@tt4d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@tt4 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@tt7d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@tt7 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@p3p2d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@p3fp2d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@byprat = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@fhv = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@acore = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@a2 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@a8rat = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@a8 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@afan = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@a4 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@a8max = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@dfan = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@dcomp = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@dburner = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@dturbin = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@dnozl = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@Rgas = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@alt = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@ts0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@ps0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=6]
@a0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@u0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@fsmach = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@q0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@cpair = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@gam = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=8]
@cp = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=8]
@epr = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@etr = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@ues = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@eair = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@m2 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@npr = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@uexit = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@pexit = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@fgros = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@dram = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@fnet = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@fnlb = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@fa = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@sfc = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@flflo = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@lcomp = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@lburn = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@lturb = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@lnoz = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@ncomp = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@nturb = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@sblade = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@hblade = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@tblade = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@xcomp = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@ncompd = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %tmp5 = tail call i32 (...)* @klee_make_symbolic(double* @u0d, i32 8, i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  tail call void @defaultParam() nounwind
  store i1 true, i1* @engine.b
  br label %bb22.preheader.us

bb22.preheader.us:                                ; preds = %bb22.bb27_crit_edge.us, %entry
  %lid.07.us = phi i32 [ 0, %entry ], [ %tmp117.us, %bb22.bb27_crit_edge.us ] ; <i32> [#uses=4]
  %sum.16.us = phi double [ undef, %entry ], [ %tmp19.us, %bb22.bb27_crit_edge.us ] ; <double> [#uses=1]
  %tmp76.us = getelementptr [35 x %struct.input_data]* @inp, i32 0, i32 %lid.07.us, i32 2 ; <double*> [#uses=1]
  %tmp60.us = getelementptr [35 x %struct.input_data]* @inp, i32 0, i32 %lid.07.us, i32 1 ; <double*> [#uses=1]
  %tmp44.us = getelementptr [35 x %struct.input_data]* @inp, i32 0, i32 %lid.07.us, i32 0 ; <double*> [#uses=1]
  br label %bb6.us

bb6.us:                                           ; preds = %bb6.us, %bb22.preheader.us
  %0 = phi i32 [ 0, %bb22.preheader.us ], [ %tmp21.us, %bb6.us ] ; <i32> [#uses=2]
  %sum.02.us = phi double [ %sum.16.us, %bb22.preheader.us ], [ %tmp19.us, %bb6.us ] ; <double> [#uses=1]
  %tmp78.us = sitofp i32 %0 to double             ; <double> [#uses=1]
  %tmp9.us = fadd double %tmp78.us, 5.000000e-01  ; <double> [#uses=1]
  %tmp11.us = fmul double %tmp9.us, 1.000000e-06  ; <double> [#uses=2]
  %tmp15.us = fmul double %tmp11.us, %tmp11.us    ; <double> [#uses=1]
  %tmp16.us = fadd double %tmp15.us, 1.000000e+00 ; <double> [#uses=1]
  %tmp17.us = fdiv double 4.000000e+00, %tmp16.us ; <double> [#uses=1]
  %tmp19.us = fadd double %tmp17.us, %sum.02.us   ; <double> [#uses=3]
  %tmp21.us = add i32 %0, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %tmp21.us, 1000000      ; <i1> [#uses=1]
  br i1 %exitcond, label %bb22.bb27_crit_edge.us, label %bb6.us

bb22.bb27_crit_edge.us:                           ; preds = %bb6.us
  %tmp30.us = fmul double %tmp19.us, 1.000000e-06 ; <double> [#uses=2]
  %tmp45.us = load double* %tmp44.us, align 32    ; <double> [#uses=1]
  store double %tmp45.us, double* @u0d, align 8
  %tmp61.us = load double* %tmp60.us, align 8     ; <double> [#uses=1]
  store double %tmp61.us, double* @altd, align 8
  %tmp77.us = load double* %tmp76.us, align 16    ; <double> [#uses=1]
  %tmp2.i.us = fdiv double %tmp77.us, 1.800000e+02 ; <double> [#uses=1]
  %tmp4.i.us = fmul double %tmp2.i.us, %tmp30.us  ; <double> [#uses=1]
  %tmp81.us = fmul double %tmp4.i.us, 1.000000e+02 ; <double> [#uses=1]
  %tmp82.us = fmul double %tmp81.us, 2.000000e+00 ; <double> [#uses=1]
  %tmp84.us = fdiv double %tmp82.us, %tmp30.us    ; <double> [#uses=1]
  store double %tmp84.us, double* @throtl, align 8
  tail call void @deduceInputs() nounwind
  tail call void @getThermo() nounwind
  tail call void @getGeo() nounwind
  tail call void @calcPerf() nounwind
  %tmp117.us = add i32 %lid.07.us, 1              ; <i32> [#uses=2]
  %exitcond11 = icmp eq i32 %tmp117.us, 35        ; <i1> [#uses=1]
  br i1 %exitcond11, label %bb123, label %bb22.preheader.us

bb123:                                            ; preds = %bb22.bb27_crit_edge.us
  ret i32 0
}

declare i32 @klee_make_symbolic(...)

define double @deg2rad(double %deg, double %pi) nounwind readnone {
entry:
  %tmp2 = fdiv double %deg, 1.800000e+02          ; <double> [#uses=1]
  %tmp4 = fmul double %tmp2, %pi                  ; <double> [#uses=1]
  ret double %tmp4
}

define double @getGama(double %temp) nounwind readnone {
entry:
  %tmp3 = fmul double %temp, 0xBD6B1260BD3B5F28   ; <double> [#uses=1]
  %tmp5 = fmul double %tmp3, %temp                ; <double> [#uses=1]
  %tmp7 = fmul double %tmp5, %temp                ; <double> [#uses=1]
  %tmp10 = fmul double %temp, 0x3E4D8F33D1342F7D  ; <double> [#uses=1]
  %tmp12 = fmul double %tmp10, %temp              ; <double> [#uses=1]
  %tmp13 = fadd double %tmp7, %tmp12              ; <double> [#uses=1]
  %tmp16 = fmul double %temp, 0xBF147EF440AF8646  ; <double> [#uses=1]
  %tmp17 = fadd double %tmp13, %tmp16             ; <double> [#uses=1]
  %tmp19 = fadd double %tmp17, 1.436914e+00       ; <double> [#uses=1]
  ret double %tmp19
}

define double @getCp(double %temp) nounwind readnone {
entry:
  %tmp3 = fmul double %temp, -4.470213e-13        ; <double> [#uses=1]
  %tmp5 = fmul double %tmp3, %temp                ; <double> [#uses=1]
  %tmp7 = fmul double %tmp5, %temp                ; <double> [#uses=1]
  %tmp10 = fmul double %temp, 0xBE019F35A06F41FC  ; <double> [#uses=1]
  %tmp12 = fmul double %tmp10, %temp              ; <double> [#uses=1]
  %tmp13 = fadd double %tmp7, %tmp12              ; <double> [#uses=1]
  %tmp16 = fmul double %temp, 0x3EFDB2FC7C597DC0  ; <double> [#uses=1]
  %tmp17 = fadd double %tmp13, %tmp16             ; <double> [#uses=1]
  %tmp19 = fadd double %tmp17, 2.245283e-01       ; <double> [#uses=1]
  ret double %tmp19
}

define double @getMach(i32 %sub, double %corair, double %gama1) nounwind readnone {
entry:
  %tmp2.i = fadd double %gama1, 1.000000e+00      ; <double> [#uses=3]
  %tmp4.i = fadd double %gama1, -1.000000e+00     ; <double> [#uses=2]
  %tmp5.i = fmul double %tmp4.i, 2.000000e+00     ; <double> [#uses=1]
  %tmp6.i = fdiv double %tmp2.i, %tmp5.i          ; <double> [#uses=3]
  %tmp9.i = fmul double %tmp4.i, 5.000000e-01     ; <double> [#uses=3]
  %tmp14.i = fadd double %tmp9.i, 1.000000e+00    ; <double> [#uses=1]
  %tmp16.i = tail call double @fpow(double %tmp14.i, double %tmp6.i) nounwind ; <double> [#uses=1]
  %tmp2.i.i = fcmp olt double %gama1, 0.000000e+00 ; <i1> [#uses=2]
  br i1 %tmp2.i.i, label %getAir.exit, label %bb4.i.i

bb4.i.i:                                          ; preds = %entry
  %tmp7.i.i = fdiv double %tmp2.i, 2.000000e+00   ; <double> [#uses=1]
  br label %bb8.i.i

bb8.i.i:                                          ; preds = %bb8.i.i, %bb4.i.i
  %x.02.i.i = phi double [ %tmp7.i.i, %bb4.i.i ], [ %tmp15.i.i, %bb8.i.i ] ; <double> [#uses=4]
  %tmp12.i.i = fdiv double %gama1, %x.02.i.i      ; <double> [#uses=1]
  %tmp14.i.i = fadd double %tmp12.i.i, %x.02.i.i  ; <double> [#uses=1]
  %tmp15.i.i = fmul double %tmp14.i.i, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i.i = fsub double %tmp15.i.i, %x.02.i.i  ; <double> [#uses=1]
  %tmp20.i.i = fdiv double %tmp18.i.i, %x.02.i.i  ; <double> [#uses=2]
  %tmp24.i.i = fcmp ogt double %tmp20.i.i, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i.i = fcmp olt double %tmp20.i.i, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i.i = or i1 %tmp24.i.i, %tmp29.i.i     ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %bb8.i.i, label %sqroot.exit.loopexit.i

sqroot.exit.loopexit.i:                           ; preds = %bb8.i.i
  %phitmp.i = fmul double %tmp15.i.i, 5.016100e-01 ; <double> [#uses=1]
  br label %getAir.exit

getAir.exit:                                      ; preds = %sqroot.exit.loopexit.i, %entry
  %tmp.0.i.i = phi double [ %phitmp.i, %sqroot.exit.loopexit.i ], [ 0.000000e+00, %entry ] ; <double> [#uses=1]
  %tmp23.i = fdiv double %tmp.0.i.i, %tmp16.i     ; <double> [#uses=1]
  %tmp5 = fcmp olt double %tmp23.i, %corair       ; <i1> [#uses=1]
  br i1 %tmp5, label %bb63, label %bb8

bb8:                                              ; preds = %getAir.exit
  switch i32 %sub, label %bb20 [
    i32 1, label %bb63
    i32 2, label %bb21
  ]

bb20:                                             ; preds = %bb8
  br label %bb21

bb21:                                             ; preds = %bb20, %bb8
  %macho.1 = phi double [ 5.000000e-01, %bb20 ], [ 1.703000e+00, %bb8 ] ; <double> [#uses=3]
  %tmp23 = fadd double %macho.1, -2.000000e-01    ; <double> [#uses=2]
  %tmp7.i.i16 = fdiv double %tmp2.i, 2.000000e+00 ; <double> [#uses=1]
  br i1 %tmp2.i.i, label %bb46.us, label %bb46

bb46.us:                                          ; preds = %bb24.us, %bb21
  %indvar = phi i32 [ %phitmp, %bb24.us ], [ 1, %bb21 ] ; <i32> [#uses=2]
  %airo.0.us = phi double [ %tmp23.i32.us, %bb24.us ], [ 2.561800e-01, %bb21 ] ; <double> [#uses=2]
  %macho.2.us = phi double [ %machn.0.us, %bb24.us ], [ %macho.1, %bb21 ] ; <double> [#uses=2]
  %machn.0.us = phi double [ %tmp43.us, %bb24.us ], [ %tmp23, %bb21 ] ; <double> [#uses=6]
  %tmp49.us = fsub double %corair, %airo.0.us     ; <double> [#uses=3]
  %tmp2.i3.us = fcmp olt double %tmp49.us, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i3.us, label %bb.i.us, label %fabs.exit.us

bb24.us:                                          ; preds = %fabs.exit.us
  %tmp11.i11.us = fmul double %tmp9.i, %machn.0.us ; <double> [#uses=1]
  %tmp13.i12.us = fmul double %tmp11.i11.us, %machn.0.us ; <double> [#uses=1]
  %tmp14.i13.us = fadd double %tmp13.i12.us, 1.000000e+00 ; <double> [#uses=1]
  %tmp16.i14.us = tail call double @fpow(double %tmp14.i13.us, double %tmp6.i) nounwind ; <double> [#uses=1]
  %tmp21.i31.us = fmul double %machn.0.us, 0.000000e+00 ; <double> [#uses=1]
  %tmp23.i32.us = fdiv double %tmp21.i31.us, %tmp16.i14.us ; <double> [#uses=3]
  %tmp30.us = fsub double %tmp23.i32.us, %airo.0.us ; <double> [#uses=1]
  %tmp33.us = fsub double %machn.0.us, %macho.2.us ; <double> [#uses=1]
  %tmp34.us = fdiv double %tmp30.us, %tmp33.us    ; <double> [#uses=1]
  %tmp39.us = fsub double %corair, %tmp23.i32.us  ; <double> [#uses=1]
  %tmp41.us = fdiv double %tmp39.us, %tmp34.us    ; <double> [#uses=1]
  %tmp43.us = fadd double %tmp41.us, %machn.0.us  ; <double> [#uses=1]
  %phitmp = add i32 %indvar, 1                    ; <i32> [#uses=1]
  br label %bb46.us

fabs.exit.us:                                     ; preds = %bb.i.us, %bb46.us
  %tmp505.us = phi double [ %tmp5.i4.us, %bb.i.us ], [ %tmp49.us, %bb46.us ] ; <double> [#uses=1]
  %tmp51.not.us = fcmp ogt double %tmp505.us, 1.000000e-04 ; <i1> [#uses=1]
  %tmp57.us = icmp slt i32 %indvar, 20            ; <i1> [#uses=1]
  %or.cond.us = and i1 %tmp51.not.us, %tmp57.us   ; <i1> [#uses=1]
  br i1 %or.cond.us, label %bb24.us, label %bb63

bb.i.us:                                          ; preds = %bb46.us
  %tmp5.i4.us = fsub double -0.000000e+00, %tmp49.us ; <double> [#uses=1]
  br label %fabs.exit.us

bb24:                                             ; preds = %fabs.exit
  %tmp11.i11 = fmul double %tmp9.i, %machn.0      ; <double> [#uses=1]
  %tmp13.i12 = fmul double %tmp11.i11, %machn.0   ; <double> [#uses=1]
  %tmp14.i13 = fadd double %tmp13.i12, 1.000000e+00 ; <double> [#uses=1]
  %tmp16.i14 = tail call double @fpow(double %tmp14.i13, double %tmp6.i) nounwind ; <double> [#uses=1]
  br label %bb8.i.i27

bb8.i.i27:                                        ; preds = %bb8.i.i27, %bb24
  %x.02.i.i18 = phi double [ %tmp7.i.i16, %bb24 ], [ %tmp15.i.i21, %bb8.i.i27 ] ; <double> [#uses=4]
  %tmp12.i.i19 = fdiv double %gama1, %x.02.i.i18  ; <double> [#uses=1]
  %tmp14.i.i20 = fadd double %tmp12.i.i19, %x.02.i.i18 ; <double> [#uses=1]
  %tmp15.i.i21 = fmul double %tmp14.i.i20, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i.i22 = fsub double %tmp15.i.i21, %x.02.i.i18 ; <double> [#uses=1]
  %tmp20.i.i23 = fdiv double %tmp18.i.i22, %x.02.i.i18 ; <double> [#uses=2]
  %tmp24.i.i24 = fcmp ogt double %tmp20.i.i23, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i.i25 = fcmp olt double %tmp20.i.i23, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i.i26 = or i1 %tmp24.i.i24, %tmp29.i.i25 ; <i1> [#uses=1]
  br i1 %or.cond.i.i26, label %bb8.i.i27, label %sqroot.exit.loopexit.i29

sqroot.exit.loopexit.i29:                         ; preds = %bb8.i.i27
  %phitmp.i28 = fmul double %tmp15.i.i21, 5.016100e-01 ; <double> [#uses=1]
  %tmp21.i31 = fmul double %phitmp.i28, %machn.0  ; <double> [#uses=1]
  %tmp23.i32 = fdiv double %tmp21.i31, %tmp16.i14 ; <double> [#uses=3]
  %tmp30 = fsub double %tmp23.i32, %airo.0        ; <double> [#uses=1]
  %tmp33 = fsub double %machn.0, %macho.2         ; <double> [#uses=1]
  %tmp34 = fdiv double %tmp30, %tmp33             ; <double> [#uses=1]
  %tmp39 = fsub double %corair, %tmp23.i32        ; <double> [#uses=1]
  %tmp41 = fdiv double %tmp39, %tmp34             ; <double> [#uses=1]
  %tmp43 = fadd double %tmp41, %machn.0           ; <double> [#uses=1]
  %phitmp36 = add i32 %indvar34, 1                ; <i32> [#uses=1]
  br label %bb46

bb46:                                             ; preds = %sqroot.exit.loopexit.i29, %bb21
  %indvar34 = phi i32 [ %phitmp36, %sqroot.exit.loopexit.i29 ], [ 1, %bb21 ] ; <i32> [#uses=2]
  %airo.0 = phi double [ %tmp23.i32, %sqroot.exit.loopexit.i29 ], [ 2.561800e-01, %bb21 ] ; <double> [#uses=2]
  %macho.2 = phi double [ %machn.0, %sqroot.exit.loopexit.i29 ], [ %macho.1, %bb21 ] ; <double> [#uses=2]
  %machn.0 = phi double [ %tmp43, %sqroot.exit.loopexit.i29 ], [ %tmp23, %bb21 ] ; <double> [#uses=6]
  %tmp49 = fsub double %corair, %airo.0           ; <double> [#uses=3]
  %tmp2.i3 = fcmp olt double %tmp49, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i3, label %bb.i, label %fabs.exit

bb.i:                                             ; preds = %bb46
  %tmp5.i4 = fsub double -0.000000e+00, %tmp49    ; <double> [#uses=1]
  br label %fabs.exit

fabs.exit:                                        ; preds = %bb.i, %bb46
  %tmp505 = phi double [ %tmp5.i4, %bb.i ], [ %tmp49, %bb46 ] ; <double> [#uses=1]
  %tmp51.not = fcmp ogt double %tmp505, 1.000000e-04 ; <i1> [#uses=1]
  %tmp57 = icmp slt i32 %indvar34, 20             ; <i1> [#uses=1]
  %or.cond = and i1 %tmp51.not, %tmp57            ; <i1> [#uses=1]
  br i1 %or.cond, label %bb24, label %bb63

bb63:                                             ; preds = %fabs.exit, %fabs.exit.us, %bb8, %getAir.exit
  %tmp.0 = phi double [ 1.000000e+00, %getAir.exit ], [ 1.000000e+00, %bb8 ], [ %macho.2.us, %fabs.exit.us ], [ %macho.2, %fabs.exit ] ; <double> [#uses=1]
  ret double %tmp.0
}

define double @getAir(double %mach, double %gama2) nounwind readnone {
entry:
  %tmp2 = fadd double %gama2, 1.000000e+00        ; <double> [#uses=2]
  %tmp4 = fadd double %gama2, -1.000000e+00       ; <double> [#uses=2]
  %tmp5 = fmul double %tmp4, 2.000000e+00         ; <double> [#uses=1]
  %tmp6 = fdiv double %tmp2, %tmp5                ; <double> [#uses=1]
  %tmp9 = fmul double %tmp4, 5.000000e-01         ; <double> [#uses=1]
  %tmp11 = fmul double %tmp9, %mach               ; <double> [#uses=1]
  %tmp13 = fmul double %tmp11, %mach              ; <double> [#uses=1]
  %tmp14 = fadd double %tmp13, 1.000000e+00       ; <double> [#uses=1]
  %tmp16 = tail call double @fpow(double %tmp14, double %tmp6) nounwind ; <double> [#uses=1]
  %tmp2.i = fcmp olt double %gama2, 0.000000e+00  ; <i1> [#uses=1]
  br i1 %tmp2.i, label %sqroot.exit, label %bb4.i

bb4.i:                                            ; preds = %entry
  %tmp7.i = fdiv double %tmp2, 2.000000e+00       ; <double> [#uses=1]
  br label %bb8.i

bb8.i:                                            ; preds = %bb8.i, %bb4.i
  %x.02.i = phi double [ %tmp7.i, %bb4.i ], [ %tmp15.i, %bb8.i ] ; <double> [#uses=4]
  %tmp12.i = fdiv double %gama2, %x.02.i          ; <double> [#uses=1]
  %tmp14.i = fadd double %tmp12.i, %x.02.i        ; <double> [#uses=1]
  %tmp15.i = fmul double %tmp14.i, 5.000000e-01   ; <double> [#uses=3]
  %tmp18.i = fsub double %tmp15.i, %x.02.i        ; <double> [#uses=1]
  %tmp20.i = fdiv double %tmp18.i, %x.02.i        ; <double> [#uses=2]
  %tmp24.i = fcmp ogt double %tmp20.i, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i = fcmp olt double %tmp20.i, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i = or i1 %tmp24.i, %tmp29.i           ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb8.i, label %sqroot.exit.loopexit

sqroot.exit.loopexit:                             ; preds = %bb8.i
  %phitmp = fmul double %tmp15.i, 5.016100e-01    ; <double> [#uses=1]
  br label %sqroot.exit

sqroot.exit:                                      ; preds = %sqroot.exit.loopexit, %entry
  %tmp.0.i = phi double [ %phitmp, %sqroot.exit.loopexit ], [ 0.000000e+00, %entry ] ; <double> [#uses=1]
  %tmp21 = fmul double %tmp.0.i, %mach            ; <double> [#uses=1]
  %tmp23 = fdiv double %tmp21, %tmp16             ; <double> [#uses=1]
  ret double %tmp23
}

define double @getRayleighLoss(double %mach1, double %ttrat, double %tlow) nounwind readnone {
entry:
  %tmp3.i = fmul double %tlow, 0xBD6B1260BD3B5F28 ; <double> [#uses=1]
  %tmp5.i = fmul double %tmp3.i, %tlow            ; <double> [#uses=1]
  %tmp7.i = fmul double %tmp5.i, %tlow            ; <double> [#uses=1]
  %tmp10.i = fmul double %tlow, 0x3E4D8F33D1342F7D ; <double> [#uses=1]
  %tmp12.i = fmul double %tmp10.i, %tlow          ; <double> [#uses=1]
  %tmp13.i = fadd double %tmp7.i, %tmp12.i        ; <double> [#uses=1]
  %tmp16.i = fmul double %tlow, 0xBF147EF440AF8646 ; <double> [#uses=1]
  %tmp17.i = fadd double %tmp13.i, %tmp16.i       ; <double> [#uses=1]
  %tmp19.i = fadd double %tmp17.i, 1.436914e+00   ; <double> [#uses=6]
  %tmp4 = fadd double %tmp19.i, -1.000000e+00     ; <double> [#uses=3]
  %tmp2.i3 = fadd double %tmp19.i, 1.000000e+00   ; <double> [#uses=2]
  %tmp5.i4 = fmul double %tmp4, 2.000000e+00      ; <double> [#uses=1]
  %tmp6.i = fdiv double %tmp2.i3, %tmp5.i4        ; <double> [#uses=1]
  %tmp9.i = fmul double %tmp4, 5.000000e-01       ; <double> [#uses=1]
  %tmp11.i = fmul double %tmp9.i, %mach1          ; <double> [#uses=1]
  %tmp13.i5 = fmul double %tmp11.i, %mach1        ; <double> [#uses=1]
  %tmp14.i = fadd double %tmp13.i5, 1.000000e+00  ; <double> [#uses=3]
  %tmp16.i6 = tail call double @fpow(double %tmp14.i, double %tmp6.i) nounwind ; <double> [#uses=1]
  %tmp2.i.i = fcmp olt double %tmp19.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i, label %getAir.exit, label %bb4.i.i

bb4.i.i:                                          ; preds = %entry
  %tmp7.i.i = fdiv double %tmp2.i3, 2.000000e+00  ; <double> [#uses=1]
  br label %bb8.i.i

bb8.i.i:                                          ; preds = %bb8.i.i, %bb4.i.i
  %x.02.i.i = phi double [ %tmp7.i.i, %bb4.i.i ], [ %tmp15.i.i, %bb8.i.i ] ; <double> [#uses=4]
  %tmp12.i.i = fdiv double %tmp19.i, %x.02.i.i    ; <double> [#uses=1]
  %tmp14.i.i = fadd double %tmp12.i.i, %x.02.i.i  ; <double> [#uses=1]
  %tmp15.i.i = fmul double %tmp14.i.i, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i.i = fsub double %tmp15.i.i, %x.02.i.i  ; <double> [#uses=1]
  %tmp20.i.i = fdiv double %tmp18.i.i, %x.02.i.i  ; <double> [#uses=2]
  %tmp24.i.i = fcmp ogt double %tmp20.i.i, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i.i = fcmp olt double %tmp20.i.i, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i.i = or i1 %tmp24.i.i, %tmp29.i.i     ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %bb8.i.i, label %sqroot.exit.loopexit.i

sqroot.exit.loopexit.i:                           ; preds = %bb8.i.i
  %phitmp.i = fmul double %tmp15.i.i, 5.016100e-01 ; <double> [#uses=1]
  br label %getAir.exit

getAir.exit:                                      ; preds = %sqroot.exit.loopexit.i, %entry
  %tmp.0.i.i = phi double [ %phitmp.i, %sqroot.exit.loopexit.i ], [ 0.000000e+00, %entry ] ; <double> [#uses=1]
  %tmp21.i = fmul double %tmp.0.i.i, %mach1       ; <double> [#uses=1]
  %tmp23.i = fdiv double %tmp21.i, %tmp16.i6      ; <double> [#uses=2]
  %tmp10 = fmul double %tlow, %ttrat              ; <double> [#uses=6]
  %tmp3.i13 = fmul double %tmp10, 0xBD6B1260BD3B5F28 ; <double> [#uses=1]
  %tmp5.i14 = fmul double %tmp3.i13, %tmp10       ; <double> [#uses=1]
  %tmp7.i15 = fmul double %tmp5.i14, %tmp10       ; <double> [#uses=1]
  %tmp10.i16 = fmul double %tmp10, 0x3E4D8F33D1342F7D ; <double> [#uses=1]
  %tmp12.i17 = fmul double %tmp10.i16, %tmp10     ; <double> [#uses=1]
  %tmp13.i18 = fadd double %tmp7.i15, %tmp12.i17  ; <double> [#uses=1]
  %tmp16.i19 = fmul double %tmp10, 0xBF147EF440AF8646 ; <double> [#uses=1]
  %tmp17.i20 = fadd double %tmp13.i18, %tmp16.i19 ; <double> [#uses=1]
  %tmp19.i21 = fadd double %tmp17.i20, 1.436914e+00 ; <double> [#uses=6]
  %tmp13 = fadd double %tmp19.i21, -1.000000e+00  ; <double> [#uses=2]
  %tmp17 = fmul double %tmp19.i, %mach1           ; <double> [#uses=1]
  %tmp19 = fmul double %tmp17, %mach1             ; <double> [#uses=1]
  %tmp20 = fadd double %tmp19, 1.000000e+00       ; <double> [#uses=2]
  %tmp29 = fdiv double %tmp19.i, %tmp4            ; <double> [#uses=2]
  %tmp40 = fdiv double %tmp19.i21, %tmp13         ; <double> [#uses=2]
  %tmp42 = fmul double %tmp13, 5.000000e-01       ; <double> [#uses=2]
  %tmp2.i7 = fcmp olt double %ttrat, 0.000000e+00 ; <i1> [#uses=1]
  %tmp6.i8 = fadd double %ttrat, 1.000000e+00     ; <double> [#uses=1]
  %tmp7.i9 = fdiv double %tmp6.i8, 2.000000e+00   ; <double> [#uses=1]
  br i1 %tmp2.i7, label %bb65.us, label %bb65

bb65.us:                                          ; preds = %bb.us, %getAir.exit
  %mach2.0.us = phi double [ %tmp64.us, %bb.us ], [ 5.000000e-01, %getAir.exit ] ; <double> [#uses=6]
  %mgueso.0.us = phi double [ %mach2.0.us, %bb.us ], [ 4.000000e-01, %getAir.exit ] ; <double> [#uses=1]
  %number.0.us = phi double [ %tmp55.us, %bb.us ], [ 9.500000e-01, %getAir.exit ] ; <double> [#uses=1]
  %tmp68.us = fsub double %mach2.0.us, %mgueso.0.us ; <double> [#uses=3]
  %tmp2.i.us = fcmp olt double %tmp68.us, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.us, label %bb.i.us, label %fabs.exit.us

bb.us:                                            ; preds = %fabs.exit.us
  %tmp23.us = fmul double %tmp19.i21, %mach2.0.us ; <double> [#uses=1]
  %tmp25.us = fmul double %tmp23.us, %mach2.0.us  ; <double> [#uses=1]
  %tmp26.us = fadd double %tmp25.us, 1.000000e+00 ; <double> [#uses=1]
  %tmp37.us = tail call double @fpow(double %tmp14.i, double %tmp29) nounwind ; <double> [#uses=1]
  %tmp44.us = fmul double %tmp42, %mach2.0.us     ; <double> [#uses=1]
  %tmp46.us = fmul double %tmp44.us, %mach2.0.us  ; <double> [#uses=1]
  %tmp47.us = fadd double %tmp46.us, 1.000000e+00 ; <double> [#uses=1]
  %tmp48.us = tail call double @fpow(double %tmp47.us, double %tmp40) nounwind ; <double> [#uses=1]
  %tmp51.us = fmul double %tmp20, %tmp48.us       ; <double> [#uses=1]
  %tmp53.us = fdiv double %tmp51.us, %tmp26.us    ; <double> [#uses=1]
  %tmp55.us = fdiv double %tmp53.us, %tmp37.us    ; <double> [#uses=2]
  %tmp59.us = fmul double %tmp23.i, 0.000000e+00  ; <double> [#uses=1]
  %tmp61.us = fdiv double %tmp59.us, %tmp55.us    ; <double> [#uses=1]
  %tmp64.us = tail call double @getMach(i32 0, double %tmp61.us, double %tmp19.i21) nounwind ; <double> [#uses=1]
  br label %bb65.us

fabs.exit.us:                                     ; preds = %bb.i.us, %bb65.us
  %tmp692.us = phi double [ %tmp5.i1.us, %bb.i.us ], [ %tmp68.us, %bb65.us ] ; <double> [#uses=1]
  %tmp70.us = fcmp ogt double %tmp692.us, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp70.us, label %bb.us, label %bb72.split

bb.i.us:                                          ; preds = %bb65.us
  %tmp5.i1.us = fsub double -0.000000e+00, %tmp68.us ; <double> [#uses=1]
  br label %fabs.exit.us

bb:                                               ; preds = %fabs.exit
  %tmp23 = fmul double %tmp19.i21, %mach2.0       ; <double> [#uses=1]
  %tmp25 = fmul double %tmp23, %mach2.0           ; <double> [#uses=1]
  %tmp26 = fadd double %tmp25, 1.000000e+00       ; <double> [#uses=1]
  %tmp37 = tail call double @fpow(double %tmp14.i, double %tmp29) nounwind ; <double> [#uses=1]
  %tmp44 = fmul double %tmp42, %mach2.0           ; <double> [#uses=1]
  %tmp46 = fmul double %tmp44, %mach2.0           ; <double> [#uses=1]
  %tmp47 = fadd double %tmp46, 1.000000e+00       ; <double> [#uses=1]
  %tmp48 = tail call double @fpow(double %tmp47, double %tmp40) nounwind ; <double> [#uses=1]
  %tmp51 = fmul double %tmp20, %tmp48             ; <double> [#uses=1]
  %tmp53 = fdiv double %tmp51, %tmp26             ; <double> [#uses=1]
  %tmp55 = fdiv double %tmp53, %tmp37             ; <double> [#uses=2]
  br label %bb8.i12

bb8.i12:                                          ; preds = %bb8.i12, %bb
  %x.02.i = phi double [ %tmp7.i9, %bb ], [ %tmp15.i, %bb8.i12 ] ; <double> [#uses=4]
  %tmp12.i10 = fdiv double %ttrat, %x.02.i        ; <double> [#uses=1]
  %tmp14.i11 = fadd double %tmp12.i10, %x.02.i    ; <double> [#uses=1]
  %tmp15.i = fmul double %tmp14.i11, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i = fsub double %tmp15.i, %x.02.i        ; <double> [#uses=1]
  %tmp20.i = fdiv double %tmp18.i, %x.02.i        ; <double> [#uses=2]
  %tmp24.i = fcmp ogt double %tmp20.i, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i = fcmp olt double %tmp20.i, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i = or i1 %tmp24.i, %tmp29.i           ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb8.i12, label %sqroot.exit

sqroot.exit:                                      ; preds = %bb8.i12
  %tmp59 = fmul double %tmp15.i, %tmp23.i         ; <double> [#uses=1]
  %tmp61 = fdiv double %tmp59, %tmp55             ; <double> [#uses=1]
  %tmp64 = tail call double @getMach(i32 0, double %tmp61, double %tmp19.i21) nounwind ; <double> [#uses=1]
  br label %bb65

bb65:                                             ; preds = %sqroot.exit, %getAir.exit
  %mach2.0 = phi double [ %tmp64, %sqroot.exit ], [ 5.000000e-01, %getAir.exit ] ; <double> [#uses=6]
  %mgueso.0 = phi double [ %mach2.0, %sqroot.exit ], [ 4.000000e-01, %getAir.exit ] ; <double> [#uses=1]
  %number.0 = phi double [ %tmp55, %sqroot.exit ], [ 9.500000e-01, %getAir.exit ] ; <double> [#uses=1]
  %tmp68 = fsub double %mach2.0, %mgueso.0        ; <double> [#uses=3]
  %tmp2.i = fcmp olt double %tmp68, 0.000000e+00  ; <i1> [#uses=1]
  br i1 %tmp2.i, label %bb.i, label %fabs.exit

bb.i:                                             ; preds = %bb65
  %tmp5.i1 = fsub double -0.000000e+00, %tmp68    ; <double> [#uses=1]
  br label %fabs.exit

fabs.exit:                                        ; preds = %bb.i, %bb65
  %tmp692 = phi double [ %tmp5.i1, %bb.i ], [ %tmp68, %bb65 ] ; <double> [#uses=1]
  %tmp70 = fcmp ogt double %tmp692, 1.000000e-04  ; <i1> [#uses=1]
  br i1 %tmp70, label %bb, label %bb72.split

bb72.split:                                       ; preds = %fabs.exit, %fabs.exit.us
  %number.0.lcssa.us-lcssa = phi double [ %number.0.us, %fabs.exit.us ], [ %number.0, %fabs.exit ] ; <double> [#uses=1]
  ret double %number.0.lcssa.us-lcssa
}

define void @defaultParam() nounwind {
entry:
  store double 4.596000e+02, double* @tref, align 8
  store double 3.220000e+01, double* @g0d, align 8
  store double 3.220000e+01, double* @g0, align 8
  store double 1.400000e+00, double* @gama, align 8
  br label %bb

bb:                                               ; preds = %bb, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %tmp12, %bb ]  ; <i32> [#uses=6]
  %tmp2 = getelementptr [20 x double]* @trat, i32 0, i32 %i.01 ; <double*> [#uses=1]
  %tmp4 = getelementptr [20 x double]* @tt, i32 0, i32 %i.01 ; <double*> [#uses=1]
  %tmp6 = getelementptr [20 x double]* @prat, i32 0, i32 %i.01 ; <double*> [#uses=1]
  %tmp8 = getelementptr [20 x double]* @pt, i32 0, i32 %i.01 ; <double*> [#uses=1]
  %tmp10 = getelementptr [20 x double]* @eta, i32 0, i32 %i.01 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp2, align 8
  store double 5.186000e+02, double* %tmp4, align 8
  store double 1.000000e+00, double* %tmp6, align 8
  store double 1.470000e+01, double* %tmp8, align 8
  store double 1.000000e+00, double* %tmp10, align 8
  %tmp12 = add i32 %i.01, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %tmp12, 20              ; <i1> [#uses=1]
  br i1 %exitcond, label %bb17, label %bb

bb17:                                             ; preds = %bb
  store double 2.500000e+03, double* @tt4d, align 8
  store double 2.500000e+03, double* @tt4, align 8
  store double 2.500000e+03, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 4), align 8
  store double 2.500000e+03, double* @tt7d, align 8
  store double 2.500000e+03, double* @tt7, align 8
  store double 2.500000e+03, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 7), align 8
  store double 8.000000e+00, double* @p3p2d, align 8
  store double 8.000000e+00, double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 3), align 8
  store double 2.000000e+00, double* @p3fp2d, align 8
  store double 2.000000e+00, double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 13), align 8
  store double 1.000000e+00, double* @byprat, align 8
  store double 1.860000e+04, double* @fhv, align 8
  store double 2.000000e+00, double* @acore, align 8
  store double 2.000000e+00, double* @a2, align 8
  store double 3.500000e-01, double* @a8rat, align 8
  store double 7.000000e-01, double* @a8, align 8
  store double 2.000000e+00, double* @afan, align 8
  store double 4.180000e-01, double* @a4, align 8
  store double 4.000000e-01, double* @a8max, align 8
  store double 2.930200e+02, double* @dfan, align 8
  store double 2.930200e+02, double* @dcomp, align 8
  store double 5.152000e+02, double* @dburner, align 8
  store double 5.152000e+02, double* @dturbin, align 8
  store double 5.152000e+02, double* @dnozl, align 8
  ret void
}

define void @deduceInputs() nounwind {
entry:
  store double 1.718000e+03, double* @Rgas, align 8
  %tmp = load double* @altd, align 8              ; <double> [#uses=8]
  store double %tmp, double* @alt, align 8
  %tmp2 = fcmp olt double %tmp, 3.615200e+04      ; <i1> [#uses=1]
  br i1 %tmp2, label %bb, label %bb12

bb:                                               ; preds = %entry
  %tmp5 = fmul double %tmp, 3.560000e+00          ; <double> [#uses=1]
  %tmp6 = fdiv double %tmp5, -1.000000e+03        ; <double> [#uses=1]
  %tmp7 = fadd double %tmp6, 5.186000e+02         ; <double> [#uses=2]
  store double %tmp7, double* @ts0, align 8
  %tmp9 = fdiv double %tmp7, 5.186000e+02         ; <double> [#uses=8]
  %tmp4.i = fcmp uge double %tmp9, 0.000000e+00   ; <i1> [#uses=1]
  br i1 %tmp4.i, label %bb13.i, label %fpow.exit

bb13.i:                                           ; preds = %bb
  %tmp13.i.i.1 = fmul double %tmp9, %tmp9         ; <double> [#uses=1]
  %tmp13.i.i.2 = fmul double %tmp13.i.i.1, %tmp9  ; <double> [#uses=1]
  %tmp13.i.i.3 = fmul double %tmp13.i.i.2, %tmp9  ; <double> [#uses=1]
  %tmp13.i.i.4 = fmul double %tmp13.i.i.3, %tmp9  ; <double> [#uses=2]
  %tmp15.i = fcmp olt double %tmp9, 0.000000e+00  ; <i1> [#uses=1]
  br i1 %tmp15.i, label %fpow.exit, label %bb22.i

bb22.i:                                           ; preds = %bb13.i
  %tmp31.i = tail call double @log(double %tmp9) nounwind ; <double> [#uses=1]
  %tmp32.i = fmul double %tmp31.i, 0x3FD0624DD2F1AA00 ; <double> [#uses=2]
  %tmp2.i2.i = fcmp ogt double %tmp32.i, 0x40862E42FEFA39EF ; <i1> [#uses=1]
  br i1 %tmp2.i2.i, label %bb18.i.i.i, label %bb18.i.i

bb6.i.i.i:                                        ; preds = %fabs.exit.i.i.i
  %tmp78.i.i.i = sitofp i32 %indvar83 to double   ; <double> [#uses=1]
  %tmp10.i.i.i = fdiv double 7.097800e+02, %tmp78.i.i.i ; <double> [#uses=1]
  %tmp12.i.i.i = fmul double %tmp10.i.i.i, %coeff.0.i.i.i ; <double> [#uses=2]
  %tmp15.i.i3.i = fadd double %number.0.i.i.i, %tmp12.i.i.i ; <double> [#uses=1]
  %phitmp = add i32 %indvar83, 1                  ; <i32> [#uses=1]
  br label %bb18.i.i.i

bb18.i.i.i:                                       ; preds = %bb6.i.i.i, %bb22.i
  %indvar83 = phi i32 [ %phitmp, %bb6.i.i.i ], [ 1, %bb22.i ] ; <i32> [#uses=2]
  %coeff.0.i.i.i = phi double [ %tmp12.i.i.i, %bb6.i.i.i ], [ 1.000000e+00, %bb22.i ] ; <double> [#uses=4]
  %number.0.i.i.i = phi double [ %tmp15.i.i3.i, %bb6.i.i.i ], [ 1.000000e+00, %bb22.i ] ; <double> [#uses=2]
  %tmp2.i.i.i.i = fcmp olt double %coeff.0.i.i.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i.i.i, label %bb.i.i.i.i, label %fabs.exit.i.i.i

bb.i.i.i.i:                                       ; preds = %bb18.i.i.i
  %tmp5.i.i.i.i = fsub double -0.000000e+00, %coeff.0.i.i.i ; <double> [#uses=1]
  br label %fabs.exit.i.i.i

fabs.exit.i.i.i:                                  ; preds = %bb.i.i.i.i, %bb18.i.i.i
  %tmp201.i.i.i = phi double [ %tmp5.i.i.i.i, %bb.i.i.i.i ], [ %coeff.0.i.i.i, %bb18.i.i.i ] ; <double> [#uses=1]
  %tmp21.i.i.i = fcmp ogt double %tmp201.i.i.i, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i.i.i, label %bb6.i.i.i, label %expo.exit.i

bb6.i.i:                                          ; preds = %fabs.exit.i.i
  %tmp78.i.i = sitofp i32 %indvar to double       ; <double> [#uses=1]
  %tmp10.i.i = fdiv double %tmp32.i, %tmp78.i.i   ; <double> [#uses=1]
  %tmp12.i.i = fmul double %tmp10.i.i, %coeff.0.i.i ; <double> [#uses=2]
  %tmp15.i4.i = fadd double %number.0.i.i, %tmp12.i.i ; <double> [#uses=1]
  %phitmp146 = add i32 %indvar, 1                 ; <i32> [#uses=1]
  br label %bb18.i.i

bb18.i.i:                                         ; preds = %bb6.i.i, %bb22.i
  %indvar = phi i32 [ %phitmp146, %bb6.i.i ], [ 1, %bb22.i ] ; <i32> [#uses=2]
  %coeff.0.i.i = phi double [ %tmp12.i.i, %bb6.i.i ], [ 1.000000e+00, %bb22.i ] ; <double> [#uses=4]
  %number.0.i.i = phi double [ %tmp15.i4.i, %bb6.i.i ], [ 1.000000e+00, %bb22.i ] ; <double> [#uses=2]
  %tmp2.i.i5.i = fcmp olt double %coeff.0.i.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i5.i, label %bb.i.i6.i, label %fabs.exit.i.i

bb.i.i6.i:                                        ; preds = %bb18.i.i
  %tmp5.i.i.i = fsub double -0.000000e+00, %coeff.0.i.i ; <double> [#uses=1]
  br label %fabs.exit.i.i

fabs.exit.i.i:                                    ; preds = %bb.i.i6.i, %bb18.i.i
  %tmp201.i.i = phi double [ %tmp5.i.i.i, %bb.i.i6.i ], [ %coeff.0.i.i, %bb18.i.i ] ; <double> [#uses=1]
  %tmp21.i.i = fcmp ogt double %tmp201.i.i, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i.i, label %bb6.i.i, label %expo.exit.i

expo.exit.i:                                      ; preds = %fabs.exit.i.i, %fabs.exit.i.i.i
  %tmp337.i = phi double [ %number.0.i.i.i, %fabs.exit.i.i.i ], [ %number.0.i.i, %fabs.exit.i.i ] ; <double> [#uses=1]
  %tmp34.i = fmul double %tmp13.i.i.4, %tmp337.i  ; <double> [#uses=1]
  br label %fpow.exit

fpow.exit:                                        ; preds = %expo.exit.i, %bb13.i, %bb
  %tmp102 = phi double [ %tmp34.i, %expo.exit.i ], [ 0.000000e+00, %bb ], [ %tmp13.i.i.4, %bb13.i ] ; <double> [#uses=1]
  %tmp11 = fmul double %tmp102, 2.116000e+03      ; <double> [#uses=1]
  store double %tmp11, double* @ps0, align 8
  br label %bb12

bb12:                                             ; preds = %fpow.exit, %entry
  %tmp14 = fcmp ult double %tmp, 3.615200e+04     ; <i1> [#uses=1]
  %tmp19 = fcmp ugt double %tmp, 8.234500e+04     ; <i1> [#uses=1]
  %or.cond = or i1 %tmp14, %tmp19                 ; <i1> [#uses=1]
  br i1 %or.cond, label %bb29, label %bb22

bb22:                                             ; preds = %bb12
  store double 3.899800e+02, double* @ts0, align 8
  %tmp25 = fsub double 3.600000e+04, %tmp         ; <double> [#uses=1]
  %tmp26 = fdiv double %tmp25, 0x40D4515BB645A1CB ; <double> [#uses=2]
  %tmp2.i = fcmp ogt double %tmp26, 0x40862E42FEFA39EF ; <i1> [#uses=1]
  br i1 %tmp2.i, label %bb18.i.i11, label %bb18.i

bb6.i.i8:                                         ; preds = %fabs.exit.i.i15
  %tmp78.i.i3 = sitofp i32 %indvar93 to double    ; <double> [#uses=1]
  %tmp10.i.i4 = fdiv double 7.097800e+02, %tmp78.i.i3 ; <double> [#uses=1]
  %tmp12.i.i5 = fmul double %tmp10.i.i4, %coeff.0.i.i9 ; <double> [#uses=2]
  %tmp15.i.i6 = fadd double %number.0.i.i10, %tmp12.i.i5 ; <double> [#uses=1]
  %phitmp147 = add i32 %indvar93, 1               ; <i32> [#uses=1]
  br label %bb18.i.i11

bb18.i.i11:                                       ; preds = %bb6.i.i8, %bb22
  %indvar93 = phi i32 [ %phitmp147, %bb6.i.i8 ], [ 1, %bb22 ] ; <i32> [#uses=2]
  %coeff.0.i.i9 = phi double [ %tmp12.i.i5, %bb6.i.i8 ], [ 1.000000e+00, %bb22 ] ; <double> [#uses=4]
  %number.0.i.i10 = phi double [ %tmp15.i.i6, %bb6.i.i8 ], [ 1.000000e+00, %bb22 ] ; <double> [#uses=2]
  %tmp2.i.i.i = fcmp olt double %coeff.0.i.i9, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i.i, label %bb.i.i.i, label %fabs.exit.i.i15

bb.i.i.i:                                         ; preds = %bb18.i.i11
  %tmp5.i.i.i12 = fsub double -0.000000e+00, %coeff.0.i.i9 ; <double> [#uses=1]
  br label %fabs.exit.i.i15

fabs.exit.i.i15:                                  ; preds = %bb.i.i.i, %bb18.i.i11
  %tmp201.i.i13 = phi double [ %tmp5.i.i.i12, %bb.i.i.i ], [ %coeff.0.i.i9, %bb18.i.i11 ] ; <double> [#uses=1]
  %tmp21.i.i14 = fcmp ogt double %tmp201.i.i13, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i.i14, label %bb6.i.i8, label %expo.exit

bb6.i:                                            ; preds = %fabs.exit.i
  %tmp78.i = sitofp i32 %indvar88 to double       ; <double> [#uses=1]
  %tmp10.i17 = fdiv double %tmp26, %tmp78.i       ; <double> [#uses=1]
  %tmp12.i18 = fmul double %tmp10.i17, %coeff.0.i ; <double> [#uses=2]
  %tmp15.i19 = fadd double %number.0.i, %tmp12.i18 ; <double> [#uses=1]
  %phitmp150 = add i32 %indvar88, 1               ; <i32> [#uses=1]
  br label %bb18.i

bb18.i:                                           ; preds = %bb6.i, %bb22
  %indvar88 = phi i32 [ %phitmp150, %bb6.i ], [ 1, %bb22 ] ; <i32> [#uses=2]
  %coeff.0.i = phi double [ %tmp12.i18, %bb6.i ], [ 1.000000e+00, %bb22 ] ; <double> [#uses=4]
  %number.0.i = phi double [ %tmp15.i19, %bb6.i ], [ 1.000000e+00, %bb22 ] ; <double> [#uses=2]
  %tmp2.i.i = fcmp olt double %coeff.0.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i, label %bb.i.i, label %fabs.exit.i

bb.i.i:                                           ; preds = %bb18.i
  %tmp5.i.i = fsub double -0.000000e+00, %coeff.0.i ; <double> [#uses=1]
  br label %fabs.exit.i

fabs.exit.i:                                      ; preds = %bb.i.i, %bb18.i
  %tmp201.i = phi double [ %tmp5.i.i, %bb.i.i ], [ %coeff.0.i, %bb18.i ] ; <double> [#uses=1]
  %tmp21.i = fcmp ogt double %tmp201.i, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i, label %bb6.i, label %expo.exit

expo.exit:                                        ; preds = %fabs.exit.i, %fabs.exit.i.i15
  %tmp2721 = phi double [ %number.0.i.i10, %fabs.exit.i.i15 ], [ %number.0.i, %fabs.exit.i ] ; <double> [#uses=1]
  %tmp28 = fmul double %tmp2721, 0x407D92339C0EBEDF ; <double> [#uses=1]
  store double %tmp28, double* @ps0, align 8
  br label %bb29

bb29:                                             ; preds = %expo.exit, %bb12
  %tmp31 = fcmp ult double %tmp, 8.234500e+04     ; <i1> [#uses=1]
  br i1 %tmp31, label %bb44, label %bb34

bb34:                                             ; preds = %bb29
  %tmp36 = fadd double %tmp, -8.234500e+04        ; <double> [#uses=1]
  %tmp37 = fmul double %tmp36, 1.645000e+00       ; <double> [#uses=1]
  %tmp38 = fdiv double %tmp37, 1.000000e+03       ; <double> [#uses=1]
  %tmp39 = fadd double %tmp38, 3.899800e+02       ; <double> [#uses=2]
  store double %tmp39, double* @ts0, align 8
  %tmp41 = fdiv double %tmp39, 3.899800e+02       ; <double> [#uses=14]
  %tmp4.i27 = fcmp uge double %tmp41, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp4.i27, label %bb13.i30, label %fpow.exit75

bb13.i30:                                         ; preds = %bb34
  %tmp13.i.i.i.1 = fmul double %tmp41, %tmp41     ; <double> [#uses=1]
  %tmp13.i.i.i.2 = fmul double %tmp13.i.i.i.1, %tmp41 ; <double> [#uses=1]
  %tmp13.i.i.i.3 = fmul double %tmp13.i.i.i.2, %tmp41 ; <double> [#uses=1]
  %tmp13.i.i.i.4 = fmul double %tmp13.i.i.i.3, %tmp41 ; <double> [#uses=1]
  %tmp13.i.i.i.5 = fmul double %tmp13.i.i.i.4, %tmp41 ; <double> [#uses=1]
  %tmp13.i.i.i.6 = fmul double %tmp13.i.i.i.5, %tmp41 ; <double> [#uses=1]
  %tmp13.i.i.i.7 = fmul double %tmp13.i.i.i.6, %tmp41 ; <double> [#uses=1]
  %tmp13.i.i.i.8 = fmul double %tmp13.i.i.i.7, %tmp41 ; <double> [#uses=1]
  %tmp13.i.i.i.9 = fmul double %tmp13.i.i.i.8, %tmp41 ; <double> [#uses=1]
  %tmp13.i.i.i.10 = fmul double %tmp13.i.i.i.9, %tmp41 ; <double> [#uses=1]
  %tmp15.i29 = fcmp olt double %tmp41, 0.000000e+00 ; <i1> [#uses=1]
  %tmp8.i.i = fdiv double 1.000000e+00, %tmp13.i.i.i.10 ; <double> [#uses=2]
  br i1 %tmp15.i29, label %fpow.exit75, label %bb22.i37

bb22.i37:                                         ; preds = %bb13.i30
  %tmp31.i34 = tail call double @log(double %tmp41) nounwind ; <double> [#uses=1]
  %tmp32.i35 = fmul double %tmp31.i34, 0xBFD8D4FDF3B645A0 ; <double> [#uses=2]
  %tmp2.i2.i36 = fcmp ogt double %tmp32.i35, 0x40862E42FEFA39EF ; <i1> [#uses=1]
  br i1 %tmp2.i2.i36, label %bb18.i.i.i48, label %bb18.i.i64

bb6.i.i.i43:                                      ; preds = %fabs.exit.i.i.i53
  %tmp78.i.i.i38 = sitofp i32 %indvar106 to double ; <double> [#uses=1]
  %tmp10.i.i.i39 = fdiv double 7.097800e+02, %tmp78.i.i.i38 ; <double> [#uses=1]
  %tmp12.i.i.i40 = fmul double %tmp10.i.i.i39, %coeff.0.i.i.i45 ; <double> [#uses=2]
  %tmp15.i.i3.i41 = fadd double %number.0.i.i.i46, %tmp12.i.i.i40 ; <double> [#uses=1]
  %phitmp148 = add i32 %indvar106, 1              ; <i32> [#uses=1]
  br label %bb18.i.i.i48

bb18.i.i.i48:                                     ; preds = %bb6.i.i.i43, %bb22.i37
  %indvar106 = phi i32 [ %phitmp148, %bb6.i.i.i43 ], [ 1, %bb22.i37 ] ; <i32> [#uses=2]
  %coeff.0.i.i.i45 = phi double [ %tmp12.i.i.i40, %bb6.i.i.i43 ], [ 1.000000e+00, %bb22.i37 ] ; <double> [#uses=4]
  %number.0.i.i.i46 = phi double [ %tmp15.i.i3.i41, %bb6.i.i.i43 ], [ 1.000000e+00, %bb22.i37 ] ; <double> [#uses=2]
  %tmp2.i.i.i.i47 = fcmp olt double %coeff.0.i.i.i45, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i.i.i47, label %bb.i.i.i.i50, label %fabs.exit.i.i.i53

bb.i.i.i.i50:                                     ; preds = %bb18.i.i.i48
  %tmp5.i.i.i.i49 = fsub double -0.000000e+00, %coeff.0.i.i.i45 ; <double> [#uses=1]
  br label %fabs.exit.i.i.i53

fabs.exit.i.i.i53:                                ; preds = %bb.i.i.i.i50, %bb18.i.i.i48
  %tmp201.i.i.i51 = phi double [ %tmp5.i.i.i.i49, %bb.i.i.i.i50 ], [ %coeff.0.i.i.i45, %bb18.i.i.i48 ] ; <double> [#uses=1]
  %tmp21.i.i.i52 = fcmp ogt double %tmp201.i.i.i51, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i.i.i52, label %bb6.i.i.i43, label %expo.exit.i72

bb6.i.i59:                                        ; preds = %fabs.exit.i.i69
  %tmp78.i.i54 = sitofp i32 %indvar100 to double  ; <double> [#uses=1]
  %tmp10.i.i55 = fdiv double %tmp32.i35, %tmp78.i.i54 ; <double> [#uses=1]
  %tmp12.i.i56 = fmul double %tmp10.i.i55, %coeff.0.i.i61 ; <double> [#uses=2]
  %tmp15.i4.i57 = fadd double %number.0.i.i62, %tmp12.i.i56 ; <double> [#uses=1]
  %phitmp149 = add i32 %indvar100, 1              ; <i32> [#uses=1]
  br label %bb18.i.i64

bb18.i.i64:                                       ; preds = %bb6.i.i59, %bb22.i37
  %indvar100 = phi i32 [ %phitmp149, %bb6.i.i59 ], [ 1, %bb22.i37 ] ; <i32> [#uses=2]
  %coeff.0.i.i61 = phi double [ %tmp12.i.i56, %bb6.i.i59 ], [ 1.000000e+00, %bb22.i37 ] ; <double> [#uses=4]
  %number.0.i.i62 = phi double [ %tmp15.i4.i57, %bb6.i.i59 ], [ 1.000000e+00, %bb22.i37 ] ; <double> [#uses=2]
  %tmp2.i.i5.i63 = fcmp olt double %coeff.0.i.i61, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i5.i63, label %bb.i.i6.i66, label %fabs.exit.i.i69

bb.i.i6.i66:                                      ; preds = %bb18.i.i64
  %tmp5.i.i.i65 = fsub double -0.000000e+00, %coeff.0.i.i61 ; <double> [#uses=1]
  br label %fabs.exit.i.i69

fabs.exit.i.i69:                                  ; preds = %bb.i.i6.i66, %bb18.i.i64
  %tmp201.i.i67 = phi double [ %tmp5.i.i.i65, %bb.i.i6.i66 ], [ %coeff.0.i.i61, %bb18.i.i64 ] ; <double> [#uses=1]
  %tmp21.i.i68 = fcmp ogt double %tmp201.i.i67, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i.i68, label %bb6.i.i59, label %expo.exit.i72

expo.exit.i72:                                    ; preds = %fabs.exit.i.i69, %fabs.exit.i.i.i53
  %tmp337.i70 = phi double [ %number.0.i.i.i46, %fabs.exit.i.i.i53 ], [ %number.0.i.i62, %fabs.exit.i.i69 ] ; <double> [#uses=1]
  %tmp34.i71 = fmul double %tmp8.i.i, %tmp337.i70 ; <double> [#uses=1]
  br label %fpow.exit75

fpow.exit75:                                      ; preds = %expo.exit.i72, %bb13.i30, %bb34
  %tmp4276 = phi double [ %tmp34.i71, %expo.exit.i72 ], [ 0.000000e+00, %bb34 ], [ %tmp8.i.i, %bb13.i30 ] ; <double> [#uses=1]
  %tmp43 = fmul double %tmp4276, 0x4049FC06E19B90EA ; <double> [#uses=1]
  store double %tmp43, double* @ps0, align 8
  br label %bb44

bb44:                                             ; preds = %fpow.exit75, %bb29
  %tmp45 = load double* @gama, align 8            ; <double> [#uses=4]
  %tmp47 = fmul double %tmp45, 1.718000e+03       ; <double> [#uses=1]
  %tmp48 = load double* @ts0, align 8             ; <double> [#uses=3]
  %tmp49 = fmul double %tmp47, %tmp48             ; <double> [#uses=3]
  %tmp2.i22 = fcmp olt double %tmp49, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i22, label %sqroot.exit, label %bb4.i

bb4.i:                                            ; preds = %bb44
  %tmp6.i = fadd double %tmp49, 1.000000e+00      ; <double> [#uses=1]
  %tmp7.i23 = fdiv double %tmp6.i, 2.000000e+00   ; <double> [#uses=1]
  br label %bb8.i

bb8.i:                                            ; preds = %bb8.i, %bb4.i
  %x.02.i = phi double [ %tmp7.i23, %bb4.i ], [ %tmp15.i25, %bb8.i ] ; <double> [#uses=4]
  %tmp12.i24 = fdiv double %tmp49, %x.02.i        ; <double> [#uses=1]
  %tmp14.i = fadd double %tmp12.i24, %x.02.i      ; <double> [#uses=1]
  %tmp15.i25 = fmul double %tmp14.i, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i = fsub double %tmp15.i25, %x.02.i      ; <double> [#uses=1]
  %tmp20.i = fdiv double %tmp18.i, %x.02.i        ; <double> [#uses=2]
  %tmp24.i = fcmp ogt double %tmp20.i, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i = fcmp olt double %tmp20.i, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i = or i1 %tmp24.i, %tmp29.i           ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb8.i, label %sqroot.exit

sqroot.exit:                                      ; preds = %bb8.i, %bb44
  %tmp.0.i26 = phi double [ 0.000000e+00, %bb44 ], [ %tmp15.i25, %bb8.i ] ; <double> [#uses=2]
  store double %tmp.0.i26, double* @a0, align 8
  %tmp51 = load double* @u0d, align 8             ; <double> [#uses=1]
  %tmp52 = fmul double %tmp51, 5.280000e+03       ; <double> [#uses=1]
  %tmp53 = fdiv double %tmp52, 3.600000e+03       ; <double> [#uses=2]
  store double %tmp53, double* @u0, align 8
  %tmp56 = fdiv double %tmp53, %tmp.0.i26         ; <double> [#uses=5]
  store double %tmp56, double* @fsmach, align 8
  %tmp58 = fdiv double %tmp45, 2.000000e+00       ; <double> [#uses=1]
  %tmp60 = fmul double %tmp58, %tmp56             ; <double> [#uses=1]
  %tmp62 = fmul double %tmp60, %tmp56             ; <double> [#uses=1]
  %tmp63 = load double* @ps0, align 8             ; <double> [#uses=3]
  %tmp64 = fmul double %tmp62, %tmp63             ; <double> [#uses=1]
  store double %tmp64, double* @q0, align 8
  %tmp78 = fadd double %tmp45, -1.000000e+00      ; <double> [#uses=2]
  %tmp79 = fmul double %tmp78, 5.000000e-01       ; <double> [#uses=1]
  %tmp81 = fmul double %tmp79, %tmp56             ; <double> [#uses=1]
  %tmp83 = fmul double %tmp81, %tmp56             ; <double> [#uses=1]
  %tmp84 = fadd double %tmp83, 1.000000e+00       ; <double> [#uses=1]
  %tmp86 = fmul double %tmp84, %tmp48             ; <double> [#uses=8]
  store double %tmp86, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 0), align 8
  %tmp91 = fdiv double %tmp45, %tmp78             ; <double> [#uses=1]
  %tmp95 = fdiv double %tmp86, %tmp48             ; <double> [#uses=1]
  %tmp96 = tail call double @fpow(double %tmp95, double %tmp91) nounwind ; <double> [#uses=1]
  %tmp98 = fmul double %tmp96, %tmp63             ; <double> [#uses=1]
  %tmp101 = fdiv double %tmp63, 1.440000e+02      ; <double> [#uses=1]
  store double %tmp101, double* @ps0, align 8
  %tmp104 = fdiv double %tmp98, 1.440000e+02      ; <double> [#uses=1]
  store double %tmp104, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 0), align 8
  %tmp3.i = fmul double %tmp86, -4.470213e-13     ; <double> [#uses=1]
  %tmp5.i = fmul double %tmp3.i, %tmp86           ; <double> [#uses=1]
  %tmp7.i = fmul double %tmp5.i, %tmp86           ; <double> [#uses=1]
  %tmp10.i = fmul double %tmp86, 0xBE019F35A06F41FC ; <double> [#uses=1]
  %tmp12.i = fmul double %tmp10.i, %tmp86         ; <double> [#uses=1]
  %tmp13.i = fadd double %tmp7.i, %tmp12.i        ; <double> [#uses=1]
  %tmp16.i = fmul double %tmp86, 0x3EFDB2FC7C597DC0 ; <double> [#uses=1]
  %tmp17.i = fadd double %tmp13.i, %tmp16.i       ; <double> [#uses=1]
  %tmp19.i = fadd double %tmp17.i, 2.245283e-01   ; <double> [#uses=1]
  store double %tmp19.i, double* @cpair, align 8
  ret void
}

define void @getThermo() nounwind {
entry:
  %tmp = load double* @fsmach, align 8            ; <double> [#uses=2]
  %tmp1 = fcmp ogt double %tmp, 1.000000e+00      ; <i1> [#uses=1]
  br i1 %tmp1, label %bb, label %bb11

bb:                                               ; preds = %entry
  %tmp4 = fadd double %tmp, -1.000000e+00         ; <double> [#uses=5]
  %tmp4.i = fcmp uge double %tmp4, 0.000000e+00   ; <i1> [#uses=1]
  br i1 %tmp4.i, label %bb13.i, label %fpow.exit

bb13.i:                                           ; preds = %bb
  %tmp15.i = fcmp olt double %tmp4, 0.000000e+00  ; <i1> [#uses=1]
  br i1 %tmp15.i, label %fpow.exit, label %bb22.i

bb22.i:                                           ; preds = %bb13.i
  %tmp31.i = tail call double @log(double %tmp4) nounwind ; <double> [#uses=1]
  %tmp32.i = fmul double %tmp31.i, 0x3FD6666666666668 ; <double> [#uses=2]
  %tmp2.i2.i = fcmp ogt double %tmp32.i, 0x40862E42FEFA39EF ; <i1> [#uses=1]
  br i1 %tmp2.i2.i, label %bb18.i.i.i, label %bb18.i.i

bb6.i.i.i:                                        ; preds = %fabs.exit.i.i.i
  %tmp78.i.i.i = sitofp i32 %indvar106 to double  ; <double> [#uses=1]
  %tmp10.i.i.i = fdiv double 7.097800e+02, %tmp78.i.i.i ; <double> [#uses=1]
  %tmp12.i.i.i = fmul double %tmp10.i.i.i, %coeff.0.i.i.i ; <double> [#uses=2]
  %tmp15.i.i3.i = fadd double %number.0.i.i.i, %tmp12.i.i.i ; <double> [#uses=1]
  %phitmp = add i32 %indvar106, 1                 ; <i32> [#uses=1]
  br label %bb18.i.i.i

bb18.i.i.i:                                       ; preds = %bb6.i.i.i, %bb22.i
  %indvar106 = phi i32 [ %phitmp, %bb6.i.i.i ], [ 1, %bb22.i ] ; <i32> [#uses=2]
  %coeff.0.i.i.i = phi double [ %tmp12.i.i.i, %bb6.i.i.i ], [ 1.000000e+00, %bb22.i ] ; <double> [#uses=4]
  %number.0.i.i.i = phi double [ %tmp15.i.i3.i, %bb6.i.i.i ], [ 1.000000e+00, %bb22.i ] ; <double> [#uses=2]
  %tmp2.i.i.i.i = fcmp olt double %coeff.0.i.i.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i.i.i, label %bb.i.i.i.i, label %fabs.exit.i.i.i

bb.i.i.i.i:                                       ; preds = %bb18.i.i.i
  %tmp5.i.i.i.i = fsub double -0.000000e+00, %coeff.0.i.i.i ; <double> [#uses=1]
  br label %fabs.exit.i.i.i

fabs.exit.i.i.i:                                  ; preds = %bb.i.i.i.i, %bb18.i.i.i
  %tmp201.i.i.i = phi double [ %tmp5.i.i.i.i, %bb.i.i.i.i ], [ %coeff.0.i.i.i, %bb18.i.i.i ] ; <double> [#uses=1]
  %tmp21.i.i.i = fcmp ogt double %tmp201.i.i.i, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i.i.i, label %bb6.i.i.i, label %expo.exit.i

bb6.i.i:                                          ; preds = %fabs.exit.i.i
  %tmp78.i.i = sitofp i32 %indvar to double       ; <double> [#uses=1]
  %tmp10.i.i = fdiv double %tmp32.i, %tmp78.i.i   ; <double> [#uses=1]
  %tmp12.i.i = fmul double %tmp10.i.i, %coeff.0.i.i ; <double> [#uses=2]
  %tmp15.i4.i = fadd double %number.0.i.i, %tmp12.i.i ; <double> [#uses=1]
  %phitmp111 = add i32 %indvar, 1                 ; <i32> [#uses=1]
  br label %bb18.i.i

bb18.i.i:                                         ; preds = %bb6.i.i, %bb22.i
  %indvar = phi i32 [ %phitmp111, %bb6.i.i ], [ 1, %bb22.i ] ; <i32> [#uses=2]
  %coeff.0.i.i = phi double [ %tmp12.i.i, %bb6.i.i ], [ 1.000000e+00, %bb22.i ] ; <double> [#uses=4]
  %number.0.i.i = phi double [ %tmp15.i4.i, %bb6.i.i ], [ 1.000000e+00, %bb22.i ] ; <double> [#uses=2]
  %tmp2.i.i5.i = fcmp olt double %coeff.0.i.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i5.i, label %bb.i.i6.i, label %fabs.exit.i.i

bb.i.i6.i:                                        ; preds = %bb18.i.i
  %tmp5.i.i.i = fsub double -0.000000e+00, %coeff.0.i.i ; <double> [#uses=1]
  br label %fabs.exit.i.i

fabs.exit.i.i:                                    ; preds = %bb.i.i6.i, %bb18.i.i
  %tmp201.i.i = phi double [ %tmp5.i.i.i, %bb.i.i6.i ], [ %coeff.0.i.i, %bb18.i.i ] ; <double> [#uses=1]
  %tmp21.i.i = fcmp ogt double %tmp201.i.i, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i.i, label %bb6.i.i, label %expo.exit.i

expo.exit.i:                                      ; preds = %fabs.exit.i.i, %fabs.exit.i.i.i
  %tmp337.i = phi double [ %number.0.i.i.i, %fabs.exit.i.i.i ], [ %number.0.i.i, %fabs.exit.i.i ] ; <double> [#uses=1]
  %tmp34.i = fmul double %tmp4, %tmp337.i         ; <double> [#uses=1]
  br label %fpow.exit

fpow.exit:                                        ; preds = %expo.exit.i, %bb13.i, %bb
  %tmp53 = phi double [ %tmp34.i, %expo.exit.i ], [ 0.000000e+00, %bb ], [ %tmp4, %bb13.i ] ; <double> [#uses=1]
  %tmp6 = fmul double %tmp53, -7.500000e-02       ; <double> [#uses=1]
  %tmp7 = fadd double %tmp6, 1.000000e+00         ; <double> [#uses=1]
  br label %bb11

bb11:                                             ; preds = %fpow.exit, %entry
  %tmp54 = phi double [ %tmp7, %fpow.exit ], [ 1.000000e+00, %entry ] ; <double> [#uses=3]
  store double %tmp54, double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 2), align 8
  store double %tmp54, double* getelementptr inbounds ([20 x double]* @eta, i32 0, i32 2), align 8
  %tmp17 = load double* getelementptr inbounds ([20 x double]* @eta, i32 0, i32 3), align 8 ; <double> [#uses=2]
  %tmp18 = fcmp olt double %tmp17, 5.000000e-01   ; <i1> [#uses=1]
  br i1 %tmp18, label %bb21, label %bb23

bb21:                                             ; preds = %bb11
  store double 5.000000e-01, double* getelementptr inbounds ([20 x double]* @eta, i32 0, i32 3), align 8
  br label %bb23

bb23:                                             ; preds = %bb21, %bb11
  %tmp78 = phi double [ 5.000000e-01, %bb21 ], [ %tmp17, %bb11 ] ; <double> [#uses=1]
  %tmp25 = load double* getelementptr inbounds ([20 x double]* @eta, i32 0, i32 5), align 8 ; <double> [#uses=2]
  %tmp26 = fcmp olt double %tmp25, 5.000000e-01   ; <i1> [#uses=1]
  br i1 %tmp26, label %bb29, label %bb31

bb29:                                             ; preds = %bb23
  store double 5.000000e-01, double* getelementptr inbounds ([20 x double]* @eta, i32 0, i32 5), align 8
  br label %bb31

bb31:                                             ; preds = %bb29, %bb23
  %tmp183 = phi double [ 5.000000e-01, %bb29 ], [ %tmp25, %bb23 ] ; <double> [#uses=1]
  store double 1.000000e+00, double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 7), align 8
  store double 1.000000e+00, double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 7), align 8
  %tmp35 = load double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 0), align 8 ; <double> [#uses=18]
  store double %tmp35, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 1), align 8
  store double %tmp35, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 2), align 8
  %tmp41 = load double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 0), align 8 ; <double> [#uses=2]
  store double %tmp41, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 1), align 8
  %tmp3.i31 = fmul double %tmp35, 0xBD6B1260BD3B5F28 ; <double> [#uses=1]
  %tmp5.i32 = fmul double %tmp3.i31, %tmp35       ; <double> [#uses=1]
  %tmp7.i33 = fmul double %tmp5.i32, %tmp35       ; <double> [#uses=1]
  %tmp10.i34 = fmul double %tmp35, 0x3E4D8F33D1342F7D ; <double> [#uses=1]
  %tmp12.i35 = fmul double %tmp10.i34, %tmp35     ; <double> [#uses=1]
  %tmp13.i36 = fadd double %tmp7.i33, %tmp12.i35  ; <double> [#uses=1]
  %tmp16.i37 = fmul double %tmp35, 0xBF147EF440AF8646 ; <double> [#uses=1]
  %tmp17.i38 = fadd double %tmp13.i36, %tmp16.i37 ; <double> [#uses=1]
  %tmp19.i39 = fadd double %tmp17.i38, 1.436914e+00 ; <double> [#uses=4]
  store double %tmp19.i39, double* getelementptr inbounds ([20 x double]* @gam, i32 0, i32 2), align 8
  %tmp3.i94 = fmul double %tmp35, -4.470213e-13   ; <double> [#uses=1]
  %tmp5.i95 = fmul double %tmp3.i94, %tmp35       ; <double> [#uses=1]
  %tmp7.i96 = fmul double %tmp5.i95, %tmp35       ; <double> [#uses=1]
  %tmp10.i97 = fmul double %tmp35, 0xBE019F35A06F41FC ; <double> [#uses=1]
  %tmp12.i98 = fmul double %tmp10.i97, %tmp35     ; <double> [#uses=1]
  %tmp13.i99 = fadd double %tmp7.i96, %tmp12.i98  ; <double> [#uses=1]
  %tmp16.i100 = fmul double %tmp35, 0x3EFDB2FC7C597DC0 ; <double> [#uses=1]
  %tmp17.i101 = fadd double %tmp13.i99, %tmp16.i100 ; <double> [#uses=1]
  %tmp19.i102 = fadd double %tmp17.i101, 2.245283e-01 ; <double> [#uses=4]
  store double %tmp19.i102, double* getelementptr inbounds ([20 x double]* @cp, i32 0, i32 2), align 8
  %tmp55 = fmul double %tmp41, %tmp54             ; <double> [#uses=3]
  store double %tmp55, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 2), align 8
  %tmp62 = load double* @p3p2d, align 8           ; <double> [#uses=2]
  %tmp66 = fcmp olt double %tmp62, 5.000000e-01   ; <i1> [#uses=1]
  %storemerge1 = select i1 %tmp66, double 5.000000e-01, double %tmp62 ; <double> [#uses=4]
  store double %storemerge1, double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 3), align 8
  %tmp76 = fmul double %tmp19.i102, %tmp35        ; <double> [#uses=1]
  %tmp79 = fdiv double %tmp76, %tmp78             ; <double> [#uses=1]
  %tmp82 = fadd double %tmp19.i39, -1.000000e+00  ; <double> [#uses=1]
  %tmp85 = fdiv double %tmp82, %tmp19.i39         ; <double> [#uses=1]
  %tmp88 = tail call double @fpow(double %storemerge1, double %tmp85) nounwind ; <double> [#uses=1]
  %tmp89 = fadd double %tmp88, -1.000000e+00      ; <double> [#uses=1]
  %tmp90 = fmul double %tmp79, %tmp89             ; <double> [#uses=2]
  %tmp94 = fdiv double %tmp90, %tmp19.i102        ; <double> [#uses=1]
  %tmp99 = fmul double %tmp55, %storemerge1       ; <double> [#uses=2]
  store double %tmp99, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 3), align 8
  %tmp104 = fadd double %tmp35, %tmp94            ; <double> [#uses=15]
  store double %tmp104, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 3), align 8
  %tmp110 = fdiv double %tmp104, %tmp35           ; <double> [#uses=2]
  store double %tmp110, double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 3), align 8
  %tmp3.i85 = fmul double %tmp104, 0xBD6B1260BD3B5F28 ; <double> [#uses=1]
  %tmp5.i86 = fmul double %tmp3.i85, %tmp104      ; <double> [#uses=1]
  %tmp7.i87 = fmul double %tmp5.i86, %tmp104      ; <double> [#uses=1]
  %tmp10.i88 = fmul double %tmp104, 0x3E4D8F33D1342F7D ; <double> [#uses=1]
  %tmp12.i89 = fmul double %tmp10.i88, %tmp104    ; <double> [#uses=1]
  %tmp13.i90 = fadd double %tmp7.i87, %tmp12.i89  ; <double> [#uses=1]
  %tmp16.i91 = fmul double %tmp104, 0xBF147EF440AF8646 ; <double> [#uses=1]
  %tmp17.i92 = fadd double %tmp13.i90, %tmp16.i91 ; <double> [#uses=1]
  %tmp19.i93 = fadd double %tmp17.i92, 1.436914e+00 ; <double> [#uses=1]
  store double %tmp19.i93, double* getelementptr inbounds ([20 x double]* @gam, i32 0, i32 3), align 8
  %tmp3.i76 = fmul double %tmp104, -4.470213e-13  ; <double> [#uses=1]
  %tmp5.i77 = fmul double %tmp3.i76, %tmp104      ; <double> [#uses=1]
  %tmp7.i78 = fmul double %tmp5.i77, %tmp104      ; <double> [#uses=1]
  %tmp10.i79 = fmul double %tmp104, 0xBE019F35A06F41FC ; <double> [#uses=1]
  %tmp12.i80 = fmul double %tmp10.i79, %tmp104    ; <double> [#uses=1]
  %tmp13.i81 = fadd double %tmp7.i78, %tmp12.i80  ; <double> [#uses=1]
  %tmp16.i82 = fmul double %tmp104, 0x3EFDB2FC7C597DC0 ; <double> [#uses=1]
  %tmp17.i83 = fadd double %tmp13.i81, %tmp16.i82 ; <double> [#uses=1]
  %tmp19.i84 = fadd double %tmp17.i83, 2.245283e-01 ; <double> [#uses=1]
  store double %tmp19.i84, double* getelementptr inbounds ([20 x double]* @cp, i32 0, i32 3), align 8
  %tmp120 = load double* @tt4, align 8            ; <double> [#uses=1]
  %tmp121 = load double* @throtl, align 8         ; <double> [#uses=1]
  %tmp122 = fmul double %tmp120, %tmp121          ; <double> [#uses=1]
  %tmp123 = fdiv double %tmp122, 1.000000e+02     ; <double> [#uses=17]
  store double %tmp123, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 4), align 8
  %tmp3.i67 = fmul double %tmp123, 0xBD6B1260BD3B5F28 ; <double> [#uses=1]
  %tmp5.i68 = fmul double %tmp3.i67, %tmp123      ; <double> [#uses=1]
  %tmp7.i69 = fmul double %tmp5.i68, %tmp123      ; <double> [#uses=1]
  %tmp10.i70 = fmul double %tmp123, 0x3E4D8F33D1342F7D ; <double> [#uses=1]
  %tmp12.i71 = fmul double %tmp10.i70, %tmp123    ; <double> [#uses=1]
  %tmp13.i72 = fadd double %tmp7.i69, %tmp12.i71  ; <double> [#uses=1]
  %tmp16.i73 = fmul double %tmp123, 0xBF147EF440AF8646 ; <double> [#uses=1]
  %tmp17.i74 = fadd double %tmp13.i72, %tmp16.i73 ; <double> [#uses=1]
  %tmp19.i75 = fadd double %tmp17.i74, 1.436914e+00 ; <double> [#uses=3]
  store double %tmp19.i75, double* getelementptr inbounds ([20 x double]* @gam, i32 0, i32 4), align 8
  %tmp3.i58 = fmul double %tmp123, -4.470213e-13  ; <double> [#uses=1]
  %tmp5.i59 = fmul double %tmp3.i58, %tmp123      ; <double> [#uses=1]
  %tmp7.i60 = fmul double %tmp5.i59, %tmp123      ; <double> [#uses=1]
  %tmp10.i61 = fmul double %tmp123, 0xBE019F35A06F41FC ; <double> [#uses=1]
  %tmp12.i62 = fmul double %tmp10.i61, %tmp123    ; <double> [#uses=1]
  %tmp13.i63 = fadd double %tmp7.i60, %tmp12.i62  ; <double> [#uses=1]
  %tmp16.i64 = fmul double %tmp123, 0x3EFDB2FC7C597DC0 ; <double> [#uses=1]
  %tmp17.i65 = fadd double %tmp13.i63, %tmp16.i64 ; <double> [#uses=1]
  %tmp19.i66 = fadd double %tmp17.i65, 2.245283e-01 ; <double> [#uses=2]
  store double %tmp19.i66, double* getelementptr inbounds ([20 x double]* @cp, i32 0, i32 4), align 8
  %tmp137 = fdiv double %tmp123, %tmp104          ; <double> [#uses=2]
  store double %tmp137, double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 4), align 8
  %tmp142 = load double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 4), align 8 ; <double> [#uses=2]
  %tmp143 = fmul double %tmp99, %tmp142           ; <double> [#uses=2]
  store double %tmp143, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 4), align 8
  %tmp149 = fdiv double %tmp90, %tmp19.i66        ; <double> [#uses=2]
  %tmp153 = fsub double %tmp123, %tmp149          ; <double> [#uses=29]
  store double %tmp153, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 5), align 8
  %tmp3.i49 = fmul double %tmp153, 0xBD6B1260BD3B5F28 ; <double> [#uses=1]
  %tmp5.i50 = fmul double %tmp3.i49, %tmp153      ; <double> [#uses=1]
  %tmp7.i51 = fmul double %tmp5.i50, %tmp153      ; <double> [#uses=1]
  %tmp10.i52 = fmul double %tmp153, 0x3E4D8F33D1342F7D ; <double> [#uses=1]
  %tmp12.i53 = fmul double %tmp10.i52, %tmp153    ; <double> [#uses=1]
  %tmp13.i54 = fadd double %tmp7.i51, %tmp12.i53  ; <double> [#uses=1]
  %tmp16.i55 = fmul double %tmp153, 0xBF147EF440AF8646 ; <double> [#uses=1]
  %tmp17.i56 = fadd double %tmp13.i54, %tmp16.i55 ; <double> [#uses=1]
  %tmp19.i57 = fadd double %tmp17.i56, 1.436914e+00 ; <double> [#uses=3]
  store double %tmp19.i57, double* getelementptr inbounds ([20 x double]* @gam, i32 0, i32 5), align 8
  %tmp3.i40 = fmul double %tmp153, -4.470213e-13  ; <double> [#uses=1]
  %tmp5.i41 = fmul double %tmp3.i40, %tmp153      ; <double> [#uses=1]
  %tmp7.i42 = fmul double %tmp5.i41, %tmp153      ; <double> [#uses=1]
  %tmp10.i43 = fmul double %tmp153, 0xBE019F35A06F41FC ; <double> [#uses=1]
  %tmp12.i44 = fmul double %tmp10.i43, %tmp153    ; <double> [#uses=1]
  %tmp13.i45 = fadd double %tmp7.i42, %tmp12.i44  ; <double> [#uses=1]
  %tmp16.i46 = fmul double %tmp153, 0x3EFDB2FC7C597DC0 ; <double> [#uses=1]
  %tmp17.i47 = fadd double %tmp13.i45, %tmp16.i46 ; <double> [#uses=1]
  %tmp19.i48 = fadd double %tmp17.i47, 2.245283e-01 ; <double> [#uses=3]
  store double %tmp19.i48, double* getelementptr inbounds ([20 x double]* @cp, i32 0, i32 5), align 8
  %tmp167 = fdiv double %tmp153, %tmp123          ; <double> [#uses=2]
  store double %tmp167, double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 5), align 8
  %tmp173 = fadd double %tmp19.i75, -1.000000e+00 ; <double> [#uses=1]
  %tmp174 = fdiv double %tmp19.i75, %tmp173       ; <double> [#uses=1]
  %tmp181 = fdiv double %tmp149, %tmp123          ; <double> [#uses=1]
  %tmp184 = fdiv double %tmp181, %tmp183          ; <double> [#uses=1]
  %tmp185 = fsub double 1.000000e+00, %tmp184     ; <double> [#uses=1]
  %tmp186 = tail call double @fpow(double %tmp185, double %tmp174) nounwind ; <double> [#uses=3]
  store double %tmp186, double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 5), align 8
  %tmp192 = fmul double %tmp143, %tmp186          ; <double> [#uses=4]
  store double %tmp192, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 5), align 8
  store double 1.000000e+00, double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 13), align 8
  store double 1.000000e+00, double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 13), align 8
  store double %tmp35, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 13), align 8
  store double %tmp55, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 13), align 8
  store double %tmp19.i39, double* getelementptr inbounds ([20 x double]* @gam, i32 0, i32 13), align 8
  store double %tmp19.i102, double* getelementptr inbounds ([20 x double]* @cp, i32 0, i32 13), align 8
  store double 1.000000e+00, double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 15), align 8
  store double %tmp192, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 15), align 8
  store double 1.000000e+00, double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 15), align 8
  store double %tmp153, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 15), align 8
  store double %tmp19.i57, double* getelementptr inbounds ([20 x double]* @gam, i32 0, i32 15), align 8
  store double %tmp19.i48, double* getelementptr inbounds ([20 x double]* @cp, i32 0, i32 15), align 8
  store double 1.000000e+00, double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 6), align 8
  store double %tmp192, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 6), align 8
  store double 1.000000e+00, double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 6), align 8
  store double %tmp153, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 6), align 8
  store double %tmp19.i57, double* getelementptr inbounds ([20 x double]* @gam, i32 0, i32 6), align 8
  store double %tmp19.i48, double* getelementptr inbounds ([20 x double]* @cp, i32 0, i32 6), align 8
  store double %tmp153, double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 7), align 8
  store double %tmp192, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 7), align 8
  %tmp3.i4 = fmul double %tmp153, 0xBD6B1260BD3B5F28 ; <double> [#uses=1]
  %tmp5.i5 = fmul double %tmp3.i4, %tmp153        ; <double> [#uses=1]
  %tmp7.i6 = fmul double %tmp5.i5, %tmp153        ; <double> [#uses=1]
  %tmp10.i7 = fmul double %tmp153, 0x3E4D8F33D1342F7D ; <double> [#uses=1]
  %tmp12.i8 = fmul double %tmp10.i7, %tmp153      ; <double> [#uses=1]
  %tmp13.i9 = fadd double %tmp7.i6, %tmp12.i8     ; <double> [#uses=1]
  %tmp16.i10 = fmul double %tmp153, 0xBF147EF440AF8646 ; <double> [#uses=1]
  %tmp17.i11 = fadd double %tmp13.i9, %tmp16.i10  ; <double> [#uses=1]
  %tmp19.i12 = fadd double %tmp17.i11, 1.436914e+00 ; <double> [#uses=1]
  store double %tmp19.i12, double* getelementptr inbounds ([20 x double]* @gam, i32 0, i32 7), align 8
  %tmp3.i = fmul double %tmp153, -4.470213e-13    ; <double> [#uses=1]
  %tmp5.i = fmul double %tmp3.i, %tmp153          ; <double> [#uses=1]
  %tmp7.i = fmul double %tmp5.i, %tmp153          ; <double> [#uses=1]
  %tmp10.i = fmul double %tmp153, 0xBE019F35A06F41FC ; <double> [#uses=1]
  %tmp12.i = fmul double %tmp10.i, %tmp153        ; <double> [#uses=1]
  %tmp13.i = fadd double %tmp7.i, %tmp12.i        ; <double> [#uses=1]
  %tmp16.i = fmul double %tmp153, 0x3EFDB2FC7C597DC0 ; <double> [#uses=1]
  %tmp17.i = fadd double %tmp13.i, %tmp16.i       ; <double> [#uses=1]
  %tmp19.i = fadd double %tmp17.i, 2.245283e-01   ; <double> [#uses=1]
  store double %tmp19.i, double* getelementptr inbounds ([20 x double]* @cp, i32 0, i32 7), align 8
  %tmp548 = fmul double %tmp186, %tmp142          ; <double> [#uses=1]
  %tmp551 = fmul double %tmp548, %storemerge1     ; <double> [#uses=1]
  store double %tmp551, double* @epr, align 8
  %tmp565 = fmul double %tmp167, %tmp137          ; <double> [#uses=1]
  %tmp568 = fmul double %tmp565, %tmp110          ; <double> [#uses=1]
  store double %tmp568, double* @etr, align 8
  ret void
}

define void @calcPerf() nounwind {
entry:
  %tmp7 = load double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 3), align 8 ; <double> [#uses=7]
  %tmp3.i = fmul double %tmp7, -4.470213e-13      ; <double> [#uses=1]
  %tmp5.i = fmul double %tmp3.i, %tmp7            ; <double> [#uses=1]
  %tmp7.i = fmul double %tmp5.i, %tmp7            ; <double> [#uses=1]
  %tmp10.i = fmul double %tmp7, 0xBE019F35A06F41FC ; <double> [#uses=1]
  %tmp12.i = fmul double %tmp10.i, %tmp7          ; <double> [#uses=1]
  %tmp13.i = fadd double %tmp7.i, %tmp12.i        ; <double> [#uses=1]
  %tmp16.i = fmul double %tmp7, 0x3EFDB2FC7C597DC0 ; <double> [#uses=1]
  %tmp17.i = fadd double %tmp13.i, %tmp16.i       ; <double> [#uses=1]
  %tmp19.i = fadd double %tmp17.i, 2.245283e-01   ; <double> [#uses=1]
  store double 3.220000e+01, double* @g0, align 8
  store double 0.000000e+00, double* @ues, align 8
  %tmp10 = load double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 5), align 8 ; <double> [#uses=12]
  %tmp3.i55 = fmul double %tmp10, 0xBD6B1260BD3B5F28 ; <double> [#uses=1]
  %tmp5.i56 = fmul double %tmp3.i55, %tmp10       ; <double> [#uses=1]
  %tmp7.i57 = fmul double %tmp5.i56, %tmp10       ; <double> [#uses=1]
  %tmp10.i58 = fmul double %tmp10, 0x3E4D8F33D1342F7D ; <double> [#uses=1]
  %tmp12.i59 = fmul double %tmp10.i58, %tmp10     ; <double> [#uses=1]
  %tmp13.i60 = fadd double %tmp7.i57, %tmp12.i59  ; <double> [#uses=1]
  %tmp16.i61 = fmul double %tmp10, 0xBF147EF440AF8646 ; <double> [#uses=1]
  %tmp17.i62 = fadd double %tmp13.i60, %tmp16.i61 ; <double> [#uses=1]
  %tmp19.i63 = fadd double %tmp17.i62, 1.436914e+00 ; <double> [#uses=5]
  %tmp13 = fadd double %tmp19.i63, -1.000000e+00  ; <double> [#uses=3]
  %tmp15 = fdiv double %tmp13, %tmp19.i63         ; <double> [#uses=2]
  %tmp3.i64 = fmul double %tmp10, -4.470213e-13   ; <double> [#uses=1]
  %tmp5.i65 = fmul double %tmp3.i64, %tmp10       ; <double> [#uses=1]
  %tmp7.i66 = fmul double %tmp5.i65, %tmp10       ; <double> [#uses=1]
  %tmp10.i67 = fmul double %tmp10, 0xBE019F35A06F41FC ; <double> [#uses=1]
  %tmp12.i68 = fmul double %tmp10.i67, %tmp10     ; <double> [#uses=1]
  %tmp13.i69 = fadd double %tmp7.i66, %tmp12.i68  ; <double> [#uses=1]
  %tmp16.i70 = fmul double %tmp10, 0x3EFDB2FC7C597DC0 ; <double> [#uses=1]
  %tmp17.i71 = fadd double %tmp13.i69, %tmp16.i70 ; <double> [#uses=1]
  %tmp19.i72 = fadd double %tmp17.i71, 2.245283e-01 ; <double> [#uses=1]
  %tmp20 = load double* getelementptr inbounds ([20 x double]* @eta, i32 0, i32 7), align 8 ; <double> [#uses=2]
  %tmp21 = fcmp olt double %tmp20, 8.000000e-01   ; <i1> [#uses=1]
  br i1 %tmp21, label %bb, label %bb24

bb:                                               ; preds = %entry
  store double 8.000000e-01, double* getelementptr inbounds ([20 x double]* @eta, i32 0, i32 7), align 8
  br label %bb24

bb24:                                             ; preds = %bb, %entry
  %tmp89 = phi double [ 8.000000e-01, %bb ], [ %tmp20, %entry ] ; <double> [#uses=1]
  %tmp26 = load double* getelementptr inbounds ([20 x double]* @eta, i32 0, i32 4), align 8 ; <double> [#uses=2]
  %tmp27 = fcmp olt double %tmp26, 8.000000e-01   ; <i1> [#uses=1]
  br i1 %tmp27, label %bb30, label %bb32

bb30:                                             ; preds = %bb24
  store double 8.000000e-01, double* getelementptr inbounds ([20 x double]* @eta, i32 0, i32 4), align 8
  br label %bb32

bb32:                                             ; preds = %bb30, %bb24
  %tmp251 = phi double [ 8.000000e-01, %bb30 ], [ %tmp26, %bb24 ] ; <double> [#uses=1]
  %tmp34 = load double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 2), align 8 ; <double> [#uses=2]
  %tmp35 = load double* @epr, align 8             ; <double> [#uses=1]
  %tmp36 = fmul double %tmp34, %tmp35             ; <double> [#uses=1]
  %tmp38 = load double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 0), align 8 ; <double> [#uses=2]
  %tmp39 = fmul double %tmp36, %tmp38             ; <double> [#uses=4]
  store double %tmp39, double* getelementptr inbounds ([20 x double]* @pt, i32 0, i32 8), align 8
  %tmp2.i105 = fadd double %tmp19.i63, 1.000000e+00 ; <double> [#uses=2]
  %tmp5.i107 = fmul double %tmp13, 2.000000e+00   ; <double> [#uses=1]
  %tmp6.i108 = fdiv double %tmp2.i105, %tmp5.i107 ; <double> [#uses=1]
  %tmp9.i109 = fmul double %tmp13, 5.000000e-01   ; <double> [#uses=1]
  %tmp14.i112 = fadd double %tmp9.i109, 1.000000e+00 ; <double> [#uses=1]
  %tmp16.i113 = tail call double @fpow(double %tmp14.i112, double %tmp6.i108) nounwind ; <double> [#uses=1]
  %tmp2.i.i114 = fcmp olt double %tmp19.i63, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i114, label %getAir.exit132, label %bb4.i.i116

bb4.i.i116:                                       ; preds = %bb32
  %tmp7.i.i115 = fdiv double %tmp2.i105, 2.000000e+00 ; <double> [#uses=1]
  br label %bb8.i.i126

bb8.i.i126:                                       ; preds = %bb8.i.i126, %bb4.i.i116
  %x.02.i.i117 = phi double [ %tmp7.i.i115, %bb4.i.i116 ], [ %tmp15.i.i120, %bb8.i.i126 ] ; <double> [#uses=4]
  %tmp12.i.i118 = fdiv double %tmp19.i63, %x.02.i.i117 ; <double> [#uses=1]
  %tmp14.i.i119 = fadd double %tmp12.i.i118, %x.02.i.i117 ; <double> [#uses=1]
  %tmp15.i.i120 = fmul double %tmp14.i.i119, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i.i121 = fsub double %tmp15.i.i120, %x.02.i.i117 ; <double> [#uses=1]
  %tmp20.i.i122 = fdiv double %tmp18.i.i121, %x.02.i.i117 ; <double> [#uses=2]
  %tmp24.i.i123 = fcmp ogt double %tmp20.i.i122, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i.i124 = fcmp olt double %tmp20.i.i122, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i.i125 = or i1 %tmp24.i.i123, %tmp29.i.i124 ; <i1> [#uses=1]
  br i1 %or.cond.i.i125, label %bb8.i.i126, label %sqroot.exit.loopexit.i128

sqroot.exit.loopexit.i128:                        ; preds = %bb8.i.i126
  %phitmp.i127 = fmul double %tmp15.i.i120, 5.016100e-01 ; <double> [#uses=1]
  br label %getAir.exit132

getAir.exit132:                                   ; preds = %sqroot.exit.loopexit.i128, %bb32
  %tmp.0.i.i129 = phi double [ %phitmp.i127, %sqroot.exit.loopexit.i128 ], [ 0.000000e+00, %bb32 ] ; <double> [#uses=1]
  %tmp23.i131 = fdiv double %tmp.0.i.i129, %tmp16.i113 ; <double> [#uses=1]
  %tmp43 = fmul double %tmp23.i131, 1.440000e+02  ; <double> [#uses=1]
  %tmp44 = load double* @a8, align 8              ; <double> [#uses=2]
  %tmp45 = fmul double %tmp43, %tmp44             ; <double> [#uses=1]
  %tmp48 = fmul double %tmp45, %tmp39             ; <double> [#uses=1]
  %tmp49 = fdiv double %tmp48, 1.470000e+01       ; <double> [#uses=1]
  %tmp51 = load double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 0), align 8 ; <double> [#uses=3]
  %tmp52 = load double* @etr, align 8             ; <double> [#uses=2]
  %tmp53 = fmul double %tmp51, %tmp52             ; <double> [#uses=1]
  %tmp54 = fdiv double %tmp53, 5.180000e+02       ; <double> [#uses=3]
  %tmp2.i89 = fcmp olt double %tmp54, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i89, label %sqroot.exit104, label %bb4.i92

bb4.i92:                                          ; preds = %getAir.exit132
  %tmp6.i90 = fadd double %tmp54, 1.000000e+00    ; <double> [#uses=1]
  %tmp7.i91 = fdiv double %tmp6.i90, 2.000000e+00 ; <double> [#uses=1]
  br label %bb8.i102

bb8.i102:                                         ; preds = %bb8.i102, %bb4.i92
  %x.02.i93 = phi double [ %tmp7.i91, %bb4.i92 ], [ %tmp15.i96, %bb8.i102 ] ; <double> [#uses=4]
  %tmp12.i94 = fdiv double %tmp54, %x.02.i93      ; <double> [#uses=1]
  %tmp14.i95 = fadd double %tmp12.i94, %x.02.i93  ; <double> [#uses=1]
  %tmp15.i96 = fmul double %tmp14.i95, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i97 = fsub double %tmp15.i96, %x.02.i93  ; <double> [#uses=1]
  %tmp20.i98 = fdiv double %tmp18.i97, %x.02.i93  ; <double> [#uses=2]
  %tmp24.i99 = fcmp ogt double %tmp20.i98, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i100 = fcmp olt double %tmp20.i98, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i101 = or i1 %tmp24.i99, %tmp29.i100   ; <i1> [#uses=1]
  br i1 %or.cond.i101, label %bb8.i102, label %sqroot.exit104

sqroot.exit104:                                   ; preds = %bb8.i102, %getAir.exit132
  %tmp.0.i103 = phi double [ 0.000000e+00, %getAir.exit132 ], [ %tmp15.i96, %bb8.i102 ] ; <double> [#uses=1]
  %tmp56 = fdiv double %tmp49, %tmp.0.i103        ; <double> [#uses=4]
  store double %tmp56, double* @eair, align 8
  %tmp57 = load double* @gama, align 8            ; <double> [#uses=6]
  %tmp60 = fdiv double %tmp51, 5.180000e+02       ; <double> [#uses=3]
  %tmp2.i73 = fcmp olt double %tmp60, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i73, label %sqroot.exit88, label %bb4.i76

bb4.i76:                                          ; preds = %sqroot.exit104
  %tmp6.i74 = fadd double %tmp60, 1.000000e+00    ; <double> [#uses=1]
  %tmp7.i75 = fdiv double %tmp6.i74, 2.000000e+00 ; <double> [#uses=1]
  br label %bb8.i86

bb8.i86:                                          ; preds = %bb8.i86, %bb4.i76
  %x.02.i77 = phi double [ %tmp7.i75, %bb4.i76 ], [ %tmp15.i80, %bb8.i86 ] ; <double> [#uses=4]
  %tmp12.i78 = fdiv double %tmp60, %x.02.i77      ; <double> [#uses=1]
  %tmp14.i79 = fadd double %tmp12.i78, %x.02.i77  ; <double> [#uses=1]
  %tmp15.i80 = fmul double %tmp14.i79, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i81 = fsub double %tmp15.i80, %x.02.i77  ; <double> [#uses=1]
  %tmp20.i82 = fdiv double %tmp18.i81, %x.02.i77  ; <double> [#uses=2]
  %tmp24.i83 = fcmp ogt double %tmp20.i82, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i84 = fcmp olt double %tmp20.i82, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i85 = or i1 %tmp24.i83, %tmp29.i84     ; <i1> [#uses=1]
  br i1 %or.cond.i85, label %bb8.i86, label %sqroot.exit88

sqroot.exit88:                                    ; preds = %bb8.i86, %sqroot.exit104
  %tmp.0.i87 = phi double [ 0.000000e+00, %sqroot.exit104 ], [ %tmp15.i80, %bb8.i86 ] ; <double> [#uses=1]
  %tmp63 = fmul double %tmp.0.i87, %tmp56         ; <double> [#uses=1]
  %tmp68 = fmul double %tmp34, %tmp38             ; <double> [#uses=1]
  %tmp69 = fdiv double %tmp68, 1.470000e+01       ; <double> [#uses=1]
  %tmp70 = load double* @acore, align 8           ; <double> [#uses=4]
  %tmp71 = fmul double %tmp69, %tmp70             ; <double> [#uses=1]
  %tmp72 = fmul double %tmp71, 1.440000e+02       ; <double> [#uses=1]
  %tmp73 = fdiv double %tmp63, %tmp72             ; <double> [#uses=1]
  %tmp74 = tail call double @getMach(i32 0, double %tmp73, double %tmp57) nounwind ; <double> [#uses=1]
  store double %tmp74, double* @m2, align 8
  %tmp77 = load double* @ps0, align 8             ; <double> [#uses=3]
  %tmp78 = fdiv double %tmp39, %tmp77             ; <double> [#uses=3]
  store double %tmp78, double* @npr, align 8
  %tmp79 = load double* @Rgas, align 8            ; <double> [#uses=1]
  %tmp80 = fmul double %tmp79, 2.000000e+00       ; <double> [#uses=1]
  %tmp82 = fdiv double %tmp80, %tmp15             ; <double> [#uses=1]
  %tmp84 = fmul double %tmp82, %tmp52             ; <double> [#uses=1]
  %tmp87 = fmul double %tmp84, %tmp51             ; <double> [#uses=1]
  %tmp90 = fmul double %tmp87, %tmp89             ; <double> [#uses=1]
  %tmp92 = fdiv double 1.000000e+00, %tmp78       ; <double> [#uses=1]
  %tmp94 = tail call double @fpow(double %tmp92, double %tmp15) nounwind ; <double> [#uses=1]
  %tmp95 = fsub double 1.000000e+00, %tmp94       ; <double> [#uses=1]
  %tmp96 = fmul double %tmp90, %tmp95             ; <double> [#uses=3]
  %tmp2.i39 = fcmp olt double %tmp96, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i39, label %sqroot.exit54, label %bb4.i42

bb4.i42:                                          ; preds = %sqroot.exit88
  %tmp6.i40 = fadd double %tmp96, 1.000000e+00    ; <double> [#uses=1]
  %tmp7.i41 = fdiv double %tmp6.i40, 2.000000e+00 ; <double> [#uses=1]
  br label %bb8.i52

bb8.i52:                                          ; preds = %bb8.i52, %bb4.i42
  %x.02.i43 = phi double [ %tmp7.i41, %bb4.i42 ], [ %tmp15.i46, %bb8.i52 ] ; <double> [#uses=4]
  %tmp12.i44 = fdiv double %tmp96, %x.02.i43      ; <double> [#uses=1]
  %tmp14.i45 = fadd double %tmp12.i44, %x.02.i43  ; <double> [#uses=1]
  %tmp15.i46 = fmul double %tmp14.i45, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i47 = fsub double %tmp15.i46, %x.02.i43  ; <double> [#uses=1]
  %tmp20.i48 = fdiv double %tmp18.i47, %x.02.i43  ; <double> [#uses=2]
  %tmp24.i49 = fcmp ogt double %tmp20.i48, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i50 = fcmp olt double %tmp20.i48, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i51 = or i1 %tmp24.i49, %tmp29.i50     ; <i1> [#uses=1]
  br i1 %or.cond.i51, label %bb8.i52, label %sqroot.exit54

sqroot.exit54:                                    ; preds = %bb8.i52, %sqroot.exit88
  %tmp117 = phi double [ 0.000000e+00, %sqroot.exit88 ], [ %tmp15.i46, %bb8.i52 ] ; <double> [#uses=2]
  store double %tmp117, double* @uexit, align 8
  %tmp99 = fcmp ugt double %tmp78, 1.893000e+00   ; <i1> [#uses=1]
  br i1 %tmp99, label %bb104, label %bb108

bb104:                                            ; preds = %sqroot.exit54
  %tmp107 = fmul double %tmp39, 5.282800e-01      ; <double> [#uses=1]
  br label %bb108

bb108:                                            ; preds = %bb104, %sqroot.exit54
  %storemerge = phi double [ %tmp107, %bb104 ], [ %tmp77, %sqroot.exit54 ] ; <double> [#uses=2]
  store double %storemerge, double* @pexit, align 8
  %tmp111 = fsub double %storemerge, %tmp77       ; <double> [#uses=1]
  %tmp112 = fmul double %tmp111, 1.440000e+02     ; <double> [#uses=1]
  %tmp114 = fmul double %tmp112, %tmp44           ; <double> [#uses=1]
  %tmp116 = fdiv double %tmp114, %tmp56           ; <double> [#uses=1]
  %tmp118 = fadd double %tmp116, %tmp117          ; <double> [#uses=1]
  %tmp120 = fdiv double %tmp118, 3.220000e+01     ; <double> [#uses=2]
  store double %tmp120, double* @fgros, align 8
  %tmp202 = load double* @u0, align 8             ; <double> [#uses=1]
  %tmp204 = fdiv double %tmp202, 3.220000e+01     ; <double> [#uses=2]
  store double %tmp204, double* @dram, align 8
  %tmp218 = load double* @fsmach, align 8         ; <double> [#uses=1]
  %tmp219 = fcmp ogt double %tmp218, 1.000000e-02 ; <i1> [#uses=1]
  br i1 %tmp219, label %bb222, label %bb234

bb222:                                            ; preds = %bb108
  %tmp2.i.i20 = fcmp olt double %tmp57, 0.000000e+00 ; <i1> [#uses=2]
  br i1 %tmp2.i.i20, label %bb234, label %bb4.i.i22

bb4.i.i22:                                        ; preds = %bb222
  %tmp2.i11 = fadd double %tmp57, 1.000000e+00    ; <double> [#uses=1]
  %tmp7.i.i21 = fdiv double %tmp2.i11, 2.000000e+00 ; <double> [#uses=1]
  br label %bb8.i.i32

bb8.i.i32:                                        ; preds = %bb8.i.i32, %bb4.i.i22
  %x.02.i.i23 = phi double [ %tmp7.i.i21, %bb4.i.i22 ], [ %tmp15.i.i26, %bb8.i.i32 ] ; <double> [#uses=4]
  %tmp12.i.i24 = fdiv double %tmp57, %x.02.i.i23  ; <double> [#uses=1]
  %tmp14.i.i25 = fadd double %tmp12.i.i24, %x.02.i.i23 ; <double> [#uses=1]
  %tmp15.i.i26 = fmul double %tmp14.i.i25, 5.000000e-01 ; <double> [#uses=2]
  %tmp18.i.i27 = fsub double %tmp15.i.i26, %x.02.i.i23 ; <double> [#uses=1]
  %tmp20.i.i28 = fdiv double %tmp18.i.i27, %x.02.i.i23 ; <double> [#uses=2]
  %tmp24.i.i29 = fcmp ogt double %tmp20.i.i28, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i.i30 = fcmp olt double %tmp20.i.i28, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i.i31 = or i1 %tmp24.i.i29, %tmp29.i.i30 ; <i1> [#uses=1]
  br i1 %or.cond.i.i31, label %bb8.i.i32, label %getAir.exit38

getAir.exit38:                                    ; preds = %bb8.i.i32
  br i1 %tmp2.i.i20, label %bb234, label %bb4.i.i

bb4.i.i:                                          ; preds = %getAir.exit38
  %tmp2.i5 = fadd double %tmp57, 1.000000e+00     ; <double> [#uses=1]
  %tmp7.i.i = fdiv double %tmp2.i5, 2.000000e+00  ; <double> [#uses=1]
  br label %bb8.i.i

bb8.i.i:                                          ; preds = %bb8.i.i, %bb4.i.i
  %x.02.i.i = phi double [ %tmp7.i.i, %bb4.i.i ], [ %tmp15.i.i, %bb8.i.i ] ; <double> [#uses=4]
  %tmp12.i.i = fdiv double %tmp57, %x.02.i.i      ; <double> [#uses=1]
  %tmp14.i.i = fadd double %tmp12.i.i, %x.02.i.i  ; <double> [#uses=1]
  %tmp15.i.i = fmul double %tmp14.i.i, 5.000000e-01 ; <double> [#uses=2]
  %tmp18.i.i = fsub double %tmp15.i.i, %x.02.i.i  ; <double> [#uses=1]
  %tmp20.i.i = fdiv double %tmp18.i.i, %x.02.i.i  ; <double> [#uses=2]
  %tmp24.i.i = fcmp ogt double %tmp20.i.i, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i.i = fcmp olt double %tmp20.i.i, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i.i = or i1 %tmp24.i.i, %tmp29.i.i     ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %bb8.i.i, label %bb234

bb234:                                            ; preds = %bb8.i.i, %getAir.exit38, %bb222, %bb108
  %tmp237 = fsub double %tmp120, %tmp204          ; <double> [#uses=4]
  store double %tmp237, double* @fnet, align 8
  %tmp240 = fmul double %tmp237, %tmp56           ; <double> [#uses=2]
  store double %tmp240, double* @fnlb, align 8
  %tmp248 = load double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 4), align 8 ; <double> [#uses=2]
  %tmp249 = fadd double %tmp248, -1.000000e+00    ; <double> [#uses=1]
  %tmp252 = load double* @fhv, align 8            ; <double> [#uses=2]
  %tmp253 = fmul double %tmp251, %tmp252          ; <double> [#uses=1]
  %tmp257 = fmul double %tmp7, %tmp19.i           ; <double> [#uses=1]
  %tmp258 = fdiv double %tmp253, %tmp257          ; <double> [#uses=1]
  %tmp261 = fsub double %tmp258, %tmp248          ; <double> [#uses=1]
  %tmp262 = fdiv double %tmp249, %tmp261          ; <double> [#uses=1]
  %tmp264 = load double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 7), align 8 ; <double> [#uses=2]
  %tmp265 = fadd double %tmp264, -1.000000e+00    ; <double> [#uses=1]
  %tmp268 = load double* getelementptr inbounds ([20 x double]* @tt, i32 0, i32 15), align 8 ; <double> [#uses=1]
  %tmp270 = fmul double %tmp268, %tmp19.i72       ; <double> [#uses=1]
  %tmp271 = fdiv double %tmp252, %tmp270          ; <double> [#uses=1]
  %tmp274 = fsub double %tmp271, %tmp264          ; <double> [#uses=1]
  %tmp275 = fdiv double %tmp265, %tmp274          ; <double> [#uses=1]
  %tmp276 = fadd double %tmp262, %tmp275          ; <double> [#uses=2]
  store double %tmp276, double* @fa, align 8
  %tmp278 = fcmp ogt double %tmp237, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp278, label %bb281, label %bb299

bb281:                                            ; preds = %bb234
  %tmp283 = fmul double %tmp276, 3.600000e+03     ; <double> [#uses=1]
  %tmp285 = fdiv double %tmp283, %tmp237          ; <double> [#uses=2]
  %tmp287 = fcmp olt double %tmp285, 0.000000e+00 ; <i1> [#uses=1]
  %storemerge2 = select i1 %tmp287, double 0.000000e+00, double %tmp285 ; <double> [#uses=2]
  store double %storemerge2, double* @sfc, align 8
  %tmp294 = fmul double %storemerge2, %tmp240     ; <double> [#uses=1]
  store double %tmp294, double* @flflo, align 8
  br label %bb300

bb299:                                            ; preds = %bb234
  store double 0.000000e+00, double* @fnlb, align 8
  store double 0.000000e+00, double* @flflo, align 8
  store double 0.000000e+00, double* @sfc, align 8
  br label %bb300

bb300:                                            ; preds = %bb299, %bb281
  %tmp301.b = load i1* @engine.b                  ; <i1> [#uses=1]
  br i1 %tmp301.b, label %bb305, label %return

bb305:                                            ; preds = %bb300
  %tmp308 = fmul double %tmp70, %tmp70            ; <double> [#uses=1]
  %tmp310 = fmul double %tmp308, %tmp70           ; <double> [#uses=3]
  %tmp2.i = fcmp olt double %tmp310, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i, label %sqroot.exit, label %bb4.i

bb4.i:                                            ; preds = %bb305
  %tmp6.i = fadd double %tmp310, 1.000000e+00     ; <double> [#uses=1]
  %tmp7.i3 = fdiv double %tmp6.i, 2.000000e+00    ; <double> [#uses=1]
  br label %bb8.i

bb8.i:                                            ; preds = %bb8.i, %bb4.i
  %x.02.i = phi double [ %tmp7.i3, %bb4.i ], [ %tmp15.i, %bb8.i ] ; <double> [#uses=4]
  %tmp12.i4 = fdiv double %tmp310, %x.02.i        ; <double> [#uses=1]
  %tmp14.i = fadd double %tmp12.i4, %x.02.i       ; <double> [#uses=1]
  %tmp15.i = fmul double %tmp14.i, 5.000000e-01   ; <double> [#uses=2]
  %tmp18.i = fsub double %tmp15.i, %x.02.i        ; <double> [#uses=1]
  %tmp20.i = fdiv double %tmp18.i, %x.02.i        ; <double> [#uses=2]
  %tmp24.i = fcmp ogt double %tmp20.i, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i = fcmp olt double %tmp20.i, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i = or i1 %tmp24.i, %tmp29.i           ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb8.i, label %sqroot.exit

sqroot.exit:                                      ; preds = %bb8.i, %bb305
  ret void

return:                                           ; preds = %bb300
  ret void
}

define void @getGeo() nounwind {
entry:
  %tmp = load double* @afan, align 8              ; <double> [#uses=1]
  %tmp1 = load double* @acore, align 8            ; <double> [#uses=3]
  %tmp2 = fcmp olt double %tmp, %tmp1             ; <i1> [#uses=1]
  br i1 %tmp2, label %bb, label %bb5

bb:                                               ; preds = %entry
  store double %tmp1, double* @afan, align 8
  br label %bb5

bb5:                                              ; preds = %bb, %entry
  %tmp6 = load double* @etr, align 8              ; <double> [#uses=3]
  %tmp2.i = fcmp olt double %tmp6, 0.000000e+00   ; <i1> [#uses=1]
  br i1 %tmp2.i, label %sqroot.exit, label %bb4.i

bb4.i:                                            ; preds = %bb5
  %tmp6.i = fadd double %tmp6, 1.000000e+00       ; <double> [#uses=1]
  %tmp7.i = fdiv double %tmp6.i, 2.000000e+00     ; <double> [#uses=1]
  br label %bb8.i

bb8.i:                                            ; preds = %bb8.i, %bb4.i
  %x.02.i = phi double [ %tmp7.i, %bb4.i ], [ %tmp15.i, %bb8.i ] ; <double> [#uses=4]
  %tmp12.i = fdiv double %tmp6, %x.02.i           ; <double> [#uses=1]
  %tmp14.i = fadd double %tmp12.i, %x.02.i        ; <double> [#uses=1]
  %tmp15.i = fmul double %tmp14.i, 5.000000e-01   ; <double> [#uses=3]
  %tmp18.i = fsub double %tmp15.i, %x.02.i        ; <double> [#uses=1]
  %tmp20.i = fdiv double %tmp18.i, %x.02.i        ; <double> [#uses=2]
  %tmp24.i = fcmp ogt double %tmp20.i, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i = fcmp olt double %tmp20.i, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i = or i1 %tmp24.i, %tmp29.i           ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb8.i, label %sqroot.exit.loopexit

sqroot.exit.loopexit:                             ; preds = %bb8.i
  %phitmp = fmul double %tmp15.i, 7.500000e-01    ; <double> [#uses=1]
  br label %sqroot.exit

sqroot.exit:                                      ; preds = %sqroot.exit.loopexit, %bb5
  %tmp.0.i = phi double [ %phitmp, %sqroot.exit.loopexit ], [ 0.000000e+00, %bb5 ] ; <double> [#uses=1]
  %tmp9 = load double* @epr, align 8              ; <double> [#uses=1]
  %tmp10 = fdiv double %tmp.0.i, %tmp9            ; <double> [#uses=2]
  %tmp12 = fcmp ogt double %tmp10, 1.000000e+00   ; <i1> [#uses=1]
  %storemerge = select i1 %tmp12, double 1.000000e+00, double %tmp10 ; <double> [#uses=5]
  store double %storemerge, double* @a8max, align 8
  %tmp17 = load double* @a8rat, align 8           ; <double> [#uses=1]
  %tmp19 = fcmp ogt double %tmp17, %storemerge    ; <i1> [#uses=1]
  br i1 %tmp19, label %bb22, label %bb30

bb22:                                             ; preds = %sqroot.exit
  store double %storemerge, double* @a8rat, align 8
  br label %bb30

bb30:                                             ; preds = %bb22, %sqroot.exit
  store double %storemerge, double* @a8rat, align 8
  %tmp35 = fmul double %storemerge, %tmp1         ; <double> [#uses=2]
  store double %tmp35, double* @a8, align 8
  %tmp41 = load double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 7), align 8 ; <double> [#uses=5]
  %tmp2.i47 = fcmp olt double %tmp41, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i47, label %sqroot.exit62, label %bb4.i50

bb4.i50:                                          ; preds = %bb30
  %tmp6.i48 = fadd double %tmp41, 1.000000e+00    ; <double> [#uses=1]
  %tmp7.i49 = fdiv double %tmp6.i48, 2.000000e+00 ; <double> [#uses=1]
  br label %bb8.i60

bb8.i60:                                          ; preds = %bb8.i60, %bb4.i50
  %x.02.i51 = phi double [ %tmp7.i49, %bb4.i50 ], [ %tmp15.i54, %bb8.i60 ] ; <double> [#uses=4]
  %tmp12.i52 = fdiv double %tmp41, %x.02.i51      ; <double> [#uses=1]
  %tmp14.i53 = fadd double %tmp12.i52, %x.02.i51  ; <double> [#uses=1]
  %tmp15.i54 = fmul double %tmp14.i53, 5.000000e-01 ; <double> [#uses=2]
  %tmp18.i55 = fsub double %tmp15.i54, %x.02.i51  ; <double> [#uses=1]
  %tmp20.i56 = fdiv double %tmp18.i55, %x.02.i51  ; <double> [#uses=2]
  %tmp24.i57 = fcmp ogt double %tmp20.i56, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i58 = fcmp olt double %tmp20.i56, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i59 = or i1 %tmp24.i57, %tmp29.i58     ; <i1> [#uses=1]
  br i1 %or.cond.i59, label %bb8.i60, label %sqroot.exit62

sqroot.exit62:                                    ; preds = %bb8.i60, %bb30
  %tmp45 = load double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 5), align 8 ; <double> [#uses=1]
  %tmp47 = fmul double %tmp45, %tmp35             ; <double> [#uses=1]
  %tmp49 = load double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 15), align 8 ; <double> [#uses=1]
  %tmp50 = fmul double %tmp47, %tmp49             ; <double> [#uses=1]
  %tmp52 = load double* getelementptr inbounds ([20 x double]* @prat, i32 0, i32 7), align 8 ; <double> [#uses=1]
  %tmp53 = fmul double %tmp50, %tmp52             ; <double> [#uses=1]
  %tmp57 = load double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 5), align 8 ; <double> [#uses=1]
  %tmp58 = fmul double %tmp41, %tmp57             ; <double> [#uses=1]
  %tmp60 = load double* getelementptr inbounds ([20 x double]* @trat, i32 0, i32 15), align 8 ; <double> [#uses=2]
  %tmp61 = fmul double %tmp58, %tmp60             ; <double> [#uses=3]
  %tmp2.i31 = fcmp olt double %tmp61, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i31, label %sqroot.exit46, label %bb4.i34

bb4.i34:                                          ; preds = %sqroot.exit62
  %tmp6.i32 = fadd double %tmp61, 1.000000e+00    ; <double> [#uses=1]
  %tmp7.i33 = fdiv double %tmp6.i32, 2.000000e+00 ; <double> [#uses=1]
  br label %bb8.i44

bb8.i44:                                          ; preds = %bb8.i44, %bb4.i34
  %x.02.i35 = phi double [ %tmp7.i33, %bb4.i34 ], [ %tmp15.i38, %bb8.i44 ] ; <double> [#uses=4]
  %tmp12.i36 = fdiv double %tmp61, %x.02.i35      ; <double> [#uses=1]
  %tmp14.i37 = fadd double %tmp12.i36, %x.02.i35  ; <double> [#uses=1]
  %tmp15.i38 = fmul double %tmp14.i37, 5.000000e-01 ; <double> [#uses=3]
  %tmp18.i39 = fsub double %tmp15.i38, %x.02.i35  ; <double> [#uses=1]
  %tmp20.i40 = fdiv double %tmp18.i39, %x.02.i35  ; <double> [#uses=2]
  %tmp24.i41 = fcmp ogt double %tmp20.i40, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i42 = fcmp olt double %tmp20.i40, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i43 = or i1 %tmp24.i41, %tmp29.i42     ; <i1> [#uses=1]
  br i1 %or.cond.i43, label %bb8.i44, label %sqroot.exit46

sqroot.exit46:                                    ; preds = %bb8.i44, %sqroot.exit62
  %tmp.0.i45 = phi double [ 0.000000e+00, %sqroot.exit62 ], [ %tmp15.i38, %bb8.i44 ] ; <double> [#uses=1]
  %tmp63 = fdiv double %tmp53, %tmp.0.i45         ; <double> [#uses=1]
  store double %tmp63, double* @a4, align 8
  %tmp75 = fmul double %tmp41, %tmp60             ; <double> [#uses=3]
  %tmp2.i15 = fcmp olt double %tmp75, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i15, label %sqroot.exit30, label %bb4.i18

bb4.i18:                                          ; preds = %sqroot.exit46
  %tmp6.i16 = fadd double %tmp75, 1.000000e+00    ; <double> [#uses=1]
  %tmp7.i17 = fdiv double %tmp6.i16, 2.000000e+00 ; <double> [#uses=1]
  br label %bb8.i28

bb8.i28:                                          ; preds = %bb8.i28, %bb4.i18
  %x.02.i19 = phi double [ %tmp7.i17, %bb4.i18 ], [ %tmp15.i22, %bb8.i28 ] ; <double> [#uses=4]
  %tmp12.i20 = fdiv double %tmp75, %x.02.i19      ; <double> [#uses=1]
  %tmp14.i21 = fadd double %tmp12.i20, %x.02.i19  ; <double> [#uses=1]
  %tmp15.i22 = fmul double %tmp14.i21, 5.000000e-01 ; <double> [#uses=2]
  %tmp18.i23 = fsub double %tmp15.i22, %x.02.i19  ; <double> [#uses=1]
  %tmp20.i24 = fdiv double %tmp18.i23, %x.02.i19  ; <double> [#uses=2]
  %tmp24.i25 = fcmp ogt double %tmp20.i24, 1.000000e-04 ; <i1> [#uses=1]
  %tmp29.i26 = fcmp olt double %tmp20.i24, -1.000000e-04 ; <i1> [#uses=1]
  %or.cond.i27 = or i1 %tmp24.i25, %tmp29.i26     ; <i1> [#uses=1]
  br i1 %or.cond.i27, label %bb8.i28, label %sqroot.exit30

sqroot.exit30:                                    ; preds = %bb8.i28, %sqroot.exit46
  %tmp80 = load double* @p3p2d, align 8           ; <double> [#uses=1]
  %tmp81 = fdiv double %tmp80, 1.500000e+00       ; <double> [#uses=1]
  %tmp82 = fadd double %tmp81, 1.000000e+00       ; <double> [#uses=1]
  %tmp8283 = fptosi double %tmp82 to i32          ; <i32> [#uses=2]
  %tmp828384 = sitofp i32 %tmp8283 to double      ; <double> [#uses=1]
  %tmp86 = icmp sgt i32 %tmp8283, 15              ; <i1> [#uses=1]
  %storemerge1 = select i1 %tmp86, double 1.500000e+01, double %tmp828384 ; <double> [#uses=4]
  store double %storemerge1, double* @ncomp, align 8
  store double 2.000000e-02, double* @sblade, align 8
  store double 0x3FE98845377B83CE, double* @hblade, align 8
  store double 0x3FC46D042C62CFD8, double* @tblade, align 8
  %tmp98 = fmul double %storemerge1, 0x3FC6FC6055589267 ; <double> [#uses=2]
  store double %tmp98, double* @xcomp, align 8
  store double %storemerge1, double* @ncompd, align 8
  store double %tmp98, double* @lcomp, align 8
  store double 0x3FE98845377B83CE, double* @lburn, align 8
  %tmp116 = fdiv double %storemerge1, 4.000000e+00 ; <double> [#uses=1]
  %tmp117 = fadd double %tmp116, 1.000000e+00     ; <double> [#uses=2]
  store double %tmp117, double* @nturb, align 8
  %tmp130 = fmul double %tmp117, 0x3FC6FC6055589267 ; <double> [#uses=1]
  store double %tmp130, double* @lturb, align 8
  store double 0x3FE98845377B83CE, double* @lnoz, align 8
  ret void
}

define double @sqroot(double %number) nounwind readnone {
entry:
  %tmp2 = fcmp olt double %number, 0.000000e+00   ; <i1> [#uses=1]
  br i1 %tmp2, label %bb34, label %bb4

bb4:                                              ; preds = %entry
  %tmp6 = fadd double %number, 1.000000e+00       ; <double> [#uses=1]
  %tmp7 = fdiv double %tmp6, 2.000000e+00         ; <double> [#uses=1]
  br label %bb8

bb8:                                              ; preds = %bb8, %bb4
  %x.02 = phi double [ %tmp7, %bb4 ], [ %tmp15, %bb8 ] ; <double> [#uses=4]
  %tmp12 = fdiv double %number, %x.02             ; <double> [#uses=1]
  %tmp14 = fadd double %tmp12, %x.02              ; <double> [#uses=1]
  %tmp15 = fmul double %tmp14, 5.000000e-01       ; <double> [#uses=3]
  %tmp18 = fsub double %tmp15, %x.02              ; <double> [#uses=1]
  %tmp20 = fdiv double %tmp18, %x.02              ; <double> [#uses=2]
  %tmp24 = fcmp ogt double %tmp20, 1.000000e-04   ; <i1> [#uses=1]
  %tmp29 = fcmp olt double %tmp20, -1.000000e-04  ; <i1> [#uses=1]
  %or.cond = or i1 %tmp24, %tmp29                 ; <i1> [#uses=1]
  br i1 %or.cond, label %bb8, label %bb34

bb34:                                             ; preds = %bb8, %entry
  %tmp.0 = phi double [ 0.000000e+00, %entry ], [ %tmp15, %bb8 ] ; <double> [#uses=1]
  ret double %tmp.0
}

define double @fabs(double %x) nounwind readnone {
entry:
  %tmp2 = fcmp olt double %x, 0.000000e+00        ; <i1> [#uses=1]
  br i1 %tmp2, label %bb, label %bb8

bb:                                               ; preds = %entry
  %tmp5 = fsub double -0.000000e+00, %x           ; <double> [#uses=1]
  ret double %tmp5

bb8:                                              ; preds = %entry
  ret double %x
}

define double @log(double %x) nounwind readnone {
entry:
  %tmp2.not = fcmp ole double %x, 0.000000e+00    ; <i1> [#uses=1]
  %tmp6 = fcmp oeq double %x, 1.000000e+00        ; <i1> [#uses=1]
  %or.cond = or i1 %tmp6, %tmp2.not               ; <i1> [#uses=1]
  br i1 %or.cond, label %bb43, label %bb10

bb10:                                             ; preds = %entry
  %tmp12 = fcmp ogt double %x, 1.000000e+00       ; <i1> [#uses=1]
  br i1 %tmp12, label %bb15, label %bb35.preheader

bb35.preheader:                                   ; preds = %bb10
  %tmp24 = fsub double 1.000000e+00, %x           ; <double> [#uses=1]
  br label %bb35

bb15:                                             ; preds = %bb10
  %tmp17 = fdiv double 1.000000e+00, %x           ; <double> [#uses=5]
  %tmp2.not.i = fcmp ole double %tmp17, 0.000000e+00 ; <i1> [#uses=1]
  %tmp6.i = fcmp oeq double %tmp17, 1.000000e+00  ; <i1> [#uses=1]
  %or.cond.i = or i1 %tmp6.i, %tmp2.not.i         ; <i1> [#uses=1]
  br i1 %or.cond.i, label %log.exit, label %bb10.i

bb10.i:                                           ; preds = %bb15
  %tmp12.i = fcmp ogt double %tmp17, 1.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp12.i, label %bb15.i, label %bb35.i.preheader

bb35.i.preheader:                                 ; preds = %bb10.i
  %tmp24.i = fsub double 1.000000e+00, %tmp17     ; <double> [#uses=1]
  br label %bb35.i

bb15.i:                                           ; preds = %bb10.i
  %tmp17.i = fdiv double 1.000000e+00, %tmp17     ; <double> [#uses=1]
  %tmp18.i = tail call double @log(double %tmp17.i) nounwind ; <double> [#uses=1]
  %tmp19.i = fsub double -0.000000e+00, %tmp18.i  ; <double> [#uses=1]
  br label %log.exit

bb21.i:                                           ; preds = %fabs.exit.i
  %tmp26.i = fmul double %tmp24.i, %coeff.0.i     ; <double> [#uses=2]
  %tmp2728.i = sitofp i32 %indvar4 to double      ; <double> [#uses=1]
  %tmp30.i = fdiv double %tmp26.i, %tmp2728.i     ; <double> [#uses=1]
  %tmp32.i = fadd double %tmp30.i, %number.0.i    ; <double> [#uses=1]
  %phitmp = add i32 %indvar4, 1                   ; <i32> [#uses=1]
  br label %bb35.i

bb35.i:                                           ; preds = %bb21.i, %bb35.i.preheader
  %indvar4 = phi i32 [ 1, %bb35.i.preheader ], [ %phitmp, %bb21.i ] ; <i32> [#uses=2]
  %coeff.0.i = phi double [ %tmp26.i, %bb21.i ], [ -1.000000e+00, %bb35.i.preheader ] ; <double> [#uses=4]
  %number.0.i = phi double [ %tmp32.i, %bb21.i ], [ 0.000000e+00, %bb35.i.preheader ] ; <double> [#uses=2]
  %tmp2.i.i = fcmp olt double %coeff.0.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i, label %bb.i.i, label %fabs.exit.i

bb.i.i:                                           ; preds = %bb35.i
  %tmp5.i.i = fsub double -0.000000e+00, %coeff.0.i ; <double> [#uses=1]
  br label %fabs.exit.i

fabs.exit.i:                                      ; preds = %bb.i.i, %bb35.i
  %tmp371.i = phi double [ %tmp5.i.i, %bb.i.i ], [ %coeff.0.i, %bb35.i ] ; <double> [#uses=1]
  %tmp38.i = fcmp ogt double %tmp371.i, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp38.i, label %bb21.i, label %log.exit

log.exit:                                         ; preds = %fabs.exit.i, %bb15.i, %bb15
  %tmp183 = phi double [ %tmp19.i, %bb15.i ], [ 0.000000e+00, %bb15 ], [ %number.0.i, %fabs.exit.i ] ; <double> [#uses=1]
  %tmp19 = fsub double -0.000000e+00, %tmp183     ; <double> [#uses=1]
  ret double %tmp19

bb21:                                             ; preds = %fabs.exit
  %tmp26 = fmul double %tmp24, %coeff.0           ; <double> [#uses=2]
  %tmp2728 = sitofp i32 %indvar to double         ; <double> [#uses=1]
  %tmp30 = fdiv double %tmp26, %tmp2728           ; <double> [#uses=1]
  %tmp32 = fadd double %tmp30, %number.0          ; <double> [#uses=1]
  %phitmp6 = add i32 %indvar, 1                   ; <i32> [#uses=1]
  br label %bb35

bb35:                                             ; preds = %bb21, %bb35.preheader
  %indvar = phi i32 [ 1, %bb35.preheader ], [ %phitmp6, %bb21 ] ; <i32> [#uses=2]
  %coeff.0 = phi double [ %tmp26, %bb21 ], [ -1.000000e+00, %bb35.preheader ] ; <double> [#uses=4]
  %number.0 = phi double [ %tmp32, %bb21 ], [ 0.000000e+00, %bb35.preheader ] ; <double> [#uses=2]
  %tmp2.i = fcmp olt double %coeff.0, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i, label %bb.i, label %fabs.exit

bb.i:                                             ; preds = %bb35
  %tmp5.i = fsub double -0.000000e+00, %coeff.0   ; <double> [#uses=1]
  br label %fabs.exit

fabs.exit:                                        ; preds = %bb.i, %bb35
  %tmp371 = phi double [ %tmp5.i, %bb.i ], [ %coeff.0, %bb35 ] ; <double> [#uses=1]
  %tmp38 = fcmp ogt double %tmp371, 1.000000e-04  ; <i1> [#uses=1]
  br i1 %tmp38, label %bb21, label %bb43

bb43:                                             ; preds = %fabs.exit, %entry
  %tmp.0 = phi double [ 0.000000e+00, %entry ], [ %number.0, %fabs.exit ] ; <double> [#uses=1]
  ret double %tmp.0
}

define double @expo(double %x) nounwind readnone {
entry:
  %tmp2 = fcmp ogt double %x, 0x40862E42FEFA39EF  ; <i1> [#uses=1]
  br i1 %tmp2, label %bb18.i, label %bb18

bb6.i:                                            ; preds = %fabs.exit.i
  %tmp78.i = sitofp i32 %indvar2 to double        ; <double> [#uses=1]
  %tmp10.i = fdiv double 7.097800e+02, %tmp78.i   ; <double> [#uses=1]
  %tmp12.i = fmul double %tmp10.i, %coeff.0.i     ; <double> [#uses=2]
  %tmp15.i = fadd double %number.0.i, %tmp12.i    ; <double> [#uses=1]
  %phitmp = add i32 %indvar2, 1                   ; <i32> [#uses=1]
  br label %bb18.i

bb18.i:                                           ; preds = %bb6.i, %entry
  %indvar2 = phi i32 [ %phitmp, %bb6.i ], [ 1, %entry ] ; <i32> [#uses=2]
  %coeff.0.i = phi double [ %tmp12.i, %bb6.i ], [ 1.000000e+00, %entry ] ; <double> [#uses=4]
  %number.0.i = phi double [ %tmp15.i, %bb6.i ], [ 1.000000e+00, %entry ] ; <double> [#uses=2]
  %tmp2.i.i = fcmp olt double %coeff.0.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i, label %bb.i.i, label %fabs.exit.i

bb.i.i:                                           ; preds = %bb18.i
  %tmp5.i.i = fsub double -0.000000e+00, %coeff.0.i ; <double> [#uses=1]
  br label %fabs.exit.i

fabs.exit.i:                                      ; preds = %bb.i.i, %bb18.i
  %tmp201.i = phi double [ %tmp5.i.i, %bb.i.i ], [ %coeff.0.i, %bb18.i ] ; <double> [#uses=1]
  %tmp21.i = fcmp ogt double %tmp201.i, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i, label %bb6.i, label %expo.exit

expo.exit:                                        ; preds = %fabs.exit.i
  ret double %number.0.i

bb6:                                              ; preds = %fabs.exit
  %tmp78 = sitofp i32 %indvar to double           ; <double> [#uses=1]
  %tmp10 = fdiv double %x, %tmp78                 ; <double> [#uses=1]
  %tmp12 = fmul double %tmp10, %coeff.0           ; <double> [#uses=2]
  %tmp15 = fadd double %number.0, %tmp12          ; <double> [#uses=1]
  %phitmp4 = add i32 %indvar, 1                   ; <i32> [#uses=1]
  br label %bb18

bb18:                                             ; preds = %bb6, %entry
  %indvar = phi i32 [ %phitmp4, %bb6 ], [ 1, %entry ] ; <i32> [#uses=2]
  %coeff.0 = phi double [ %tmp12, %bb6 ], [ 1.000000e+00, %entry ] ; <double> [#uses=4]
  %number.0 = phi double [ %tmp15, %bb6 ], [ 1.000000e+00, %entry ] ; <double> [#uses=2]
  %tmp2.i = fcmp olt double %coeff.0, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i, label %bb.i, label %fabs.exit

bb.i:                                             ; preds = %bb18
  %tmp5.i = fsub double -0.000000e+00, %coeff.0   ; <double> [#uses=1]
  br label %fabs.exit

fabs.exit:                                        ; preds = %bb.i, %bb18
  %tmp201 = phi double [ %tmp5.i, %bb.i ], [ %coeff.0, %bb18 ] ; <double> [#uses=1]
  %tmp21 = fcmp ogt double %tmp201, 1.000000e-04  ; <i1> [#uses=1]
  br i1 %tmp21, label %bb6, label %bb26

bb26:                                             ; preds = %fabs.exit
  ret double %number.0
}

define double @fpow(double %x, double %y) nounwind readnone {
entry:
  %tmp12 = fptosi double %y to i32                ; <i32> [#uses=7]
  %tmp4 = fcmp uge double %x, 0.000000e+00        ; <i1> [#uses=1]
  br i1 %tmp4, label %bb13, label %bb

bb:                                               ; preds = %entry
  %tmp67 = sitofp i32 %tmp12 to double            ; <double> [#uses=1]
  %tmp9 = fcmp oeq double %tmp67, %y              ; <i1> [#uses=1]
  br i1 %tmp9, label %bb13, label %bb35

bb13:                                             ; preds = %bb, %entry
  %tmp15 = fcmp olt double %x, 0.000000e+00       ; <i1> [#uses=1]
  %tmp2.i = icmp slt i32 %tmp12, 0                ; <i1> [#uses=1]
  br i1 %tmp2.i, label %bb.i, label %bb16.preheader.i

bb16.preheader.i:                                 ; preds = %bb13
  %tmp194.i = icmp sgt i32 %tmp12, 0              ; <i1> [#uses=1]
  br i1 %tmp194.i, label %bb10.i, label %power.exit

bb.i:                                             ; preds = %bb13
  %tmp5.i = sub i32 0, %tmp12                     ; <i32> [#uses=3]
  %tmp2.i.i = icmp slt i32 %tmp5.i, 0             ; <i1> [#uses=1]
  br i1 %tmp2.i.i, label %bb.i.i, label %bb16.i.preheader.i

bb16.i.preheader.i:                               ; preds = %bb.i
  %tmp19.i8.i = icmp sgt i32 %tmp5.i, 0           ; <i1> [#uses=1]
  br i1 %tmp19.i8.i, label %bb10.i.i, label %power.exit.i

bb.i.i:                                           ; preds = %bb.i
  %tmp7.i.i = tail call double @power(double %x, i32 %tmp12) nounwind ; <double> [#uses=1]
  %tmp8.i.i = fdiv double 1.000000e+00, %tmp7.i.i ; <double> [#uses=1]
  br label %power.exit.i

bb10.i.i:                                         ; preds = %bb10.i.i, %bb16.i.preheader.i
  %number.0.i7.i = phi double [ 1.000000e+00, %bb16.i.preheader.i ], [ %tmp13.i.i, %bb10.i.i ] ; <double> [#uses=1]
  %i.0.i6.i = phi i32 [ 0, %bb16.i.preheader.i ], [ %tmp15.i.i, %bb10.i.i ] ; <i32> [#uses=1]
  %tmp13.i.i = fmul double %number.0.i7.i, %x     ; <double> [#uses=2]
  %tmp15.i.i = add i32 %i.0.i6.i, 1               ; <i32> [#uses=2]
  %exitcond9 = icmp eq i32 %tmp15.i.i, %tmp5.i    ; <i1> [#uses=1]
  br i1 %exitcond9, label %power.exit.i, label %bb10.i.i

power.exit.i:                                     ; preds = %bb10.i.i, %bb.i.i, %bb16.i.preheader.i
  %tmp71.i = phi double [ %tmp8.i.i, %bb.i.i ], [ 1.000000e+00, %bb16.i.preheader.i ], [ %tmp13.i.i, %bb10.i.i ] ; <double> [#uses=1]
  %tmp8.i = fdiv double 1.000000e+00, %tmp71.i    ; <double> [#uses=1]
  br label %power.exit

bb10.i:                                           ; preds = %bb10.i, %bb16.preheader.i
  %number.03.i = phi double [ 1.000000e+00, %bb16.preheader.i ], [ %tmp13.i, %bb10.i ] ; <double> [#uses=1]
  %i.02.i = phi i32 [ 0, %bb16.preheader.i ], [ %tmp15.i, %bb10.i ] ; <i32> [#uses=1]
  %tmp13.i = fmul double %number.03.i, %x         ; <double> [#uses=2]
  %tmp15.i = add i32 %i.02.i, 1                   ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %tmp15.i, %tmp12        ; <i1> [#uses=1]
  br i1 %exitcond, label %power.exit, label %bb10.i

power.exit:                                       ; preds = %bb10.i, %power.exit.i, %bb16.preheader.i
  %tmp211 = phi double [ %tmp8.i, %power.exit.i ], [ 1.000000e+00, %bb16.preheader.i ], [ %tmp13.i, %bb10.i ] ; <double> [#uses=2]
  br i1 %tmp15, label %bb35, label %bb22

bb22:                                             ; preds = %power.exit
  %tmp2627 = sitofp i32 %tmp12 to double          ; <double> [#uses=1]
  %tmp29 = fsub double %y, %tmp2627               ; <double> [#uses=1]
  %tmp31 = tail call double @log(double %x) nounwind ; <double> [#uses=1]
  %tmp32 = fmul double %tmp29, %tmp31             ; <double> [#uses=2]
  %tmp2.i2 = fcmp ogt double %tmp32, 0x40862E42FEFA39EF ; <i1> [#uses=1]
  br i1 %tmp2.i2, label %bb18.i.i, label %bb18.i

bb6.i.i:                                          ; preds = %fabs.exit.i.i
  %tmp78.i.i = sitofp i32 %indvar11 to double     ; <double> [#uses=1]
  %tmp10.i.i = fdiv double 7.097800e+02, %tmp78.i.i ; <double> [#uses=1]
  %tmp12.i.i = fmul double %tmp10.i.i, %coeff.0.i.i ; <double> [#uses=2]
  %tmp15.i.i3 = fadd double %number.0.i.i, %tmp12.i.i ; <double> [#uses=1]
  %phitmp = add i32 %indvar11, 1                  ; <i32> [#uses=1]
  br label %bb18.i.i

bb18.i.i:                                         ; preds = %bb6.i.i, %bb22
  %indvar11 = phi i32 [ %phitmp, %bb6.i.i ], [ 1, %bb22 ] ; <i32> [#uses=2]
  %coeff.0.i.i = phi double [ %tmp12.i.i, %bb6.i.i ], [ 1.000000e+00, %bb22 ] ; <double> [#uses=4]
  %number.0.i.i = phi double [ %tmp15.i.i3, %bb6.i.i ], [ 1.000000e+00, %bb22 ] ; <double> [#uses=2]
  %tmp2.i.i.i = fcmp olt double %coeff.0.i.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i.i, label %bb.i.i.i, label %fabs.exit.i.i

bb.i.i.i:                                         ; preds = %bb18.i.i
  %tmp5.i.i.i = fsub double -0.000000e+00, %coeff.0.i.i ; <double> [#uses=1]
  br label %fabs.exit.i.i

fabs.exit.i.i:                                    ; preds = %bb.i.i.i, %bb18.i.i
  %tmp201.i.i = phi double [ %tmp5.i.i.i, %bb.i.i.i ], [ %coeff.0.i.i, %bb18.i.i ] ; <double> [#uses=1]
  %tmp21.i.i = fcmp ogt double %tmp201.i.i, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i.i, label %bb6.i.i, label %expo.exit

bb6.i:                                            ; preds = %fabs.exit.i
  %tmp78.i = sitofp i32 %indvar to double         ; <double> [#uses=1]
  %tmp10.i = fdiv double %tmp32, %tmp78.i         ; <double> [#uses=1]
  %tmp12.i = fmul double %tmp10.i, %coeff.0.i     ; <double> [#uses=2]
  %tmp15.i4 = fadd double %number.0.i, %tmp12.i   ; <double> [#uses=1]
  %phitmp14 = add i32 %indvar, 1                  ; <i32> [#uses=1]
  br label %bb18.i

bb18.i:                                           ; preds = %bb6.i, %bb22
  %indvar = phi i32 [ %phitmp14, %bb6.i ], [ 1, %bb22 ] ; <i32> [#uses=2]
  %coeff.0.i = phi double [ %tmp12.i, %bb6.i ], [ 1.000000e+00, %bb22 ] ; <double> [#uses=4]
  %number.0.i = phi double [ %tmp15.i4, %bb6.i ], [ 1.000000e+00, %bb22 ] ; <double> [#uses=2]
  %tmp2.i.i5 = fcmp olt double %coeff.0.i, 0.000000e+00 ; <i1> [#uses=1]
  br i1 %tmp2.i.i5, label %bb.i.i6, label %fabs.exit.i

bb.i.i6:                                          ; preds = %bb18.i
  %tmp5.i.i = fsub double -0.000000e+00, %coeff.0.i ; <double> [#uses=1]
  br label %fabs.exit.i

fabs.exit.i:                                      ; preds = %bb.i.i6, %bb18.i
  %tmp201.i = phi double [ %tmp5.i.i, %bb.i.i6 ], [ %coeff.0.i, %bb18.i ] ; <double> [#uses=1]
  %tmp21.i = fcmp ogt double %tmp201.i, 1.000000e-04 ; <i1> [#uses=1]
  br i1 %tmp21.i, label %bb6.i, label %expo.exit

expo.exit:                                        ; preds = %fabs.exit.i, %fabs.exit.i.i
  %tmp337 = phi double [ %number.0.i.i, %fabs.exit.i.i ], [ %number.0.i, %fabs.exit.i ] ; <double> [#uses=1]
  %tmp34 = fmul double %tmp211, %tmp337           ; <double> [#uses=1]
  ret double %tmp34

bb35:                                             ; preds = %power.exit, %bb
  %tmp.0 = phi double [ 0.000000e+00, %bb ], [ %tmp211, %power.exit ] ; <double> [#uses=1]
  ret double %tmp.0
}

define double @power(double %x, i32 %y) nounwind readnone {
entry:
  %tmp2 = icmp slt i32 %y, 0                      ; <i1> [#uses=1]
  br i1 %tmp2, label %bb, label %bb16.preheader

bb16.preheader:                                   ; preds = %entry
  %tmp194 = icmp sgt i32 %y, 0                    ; <i1> [#uses=1]
  br i1 %tmp194, label %bb10, label %bb25

bb:                                               ; preds = %entry
  %tmp5 = sub i32 0, %y                           ; <i32> [#uses=3]
  %tmp2.i = icmp slt i32 %tmp5, 0                 ; <i1> [#uses=1]
  br i1 %tmp2.i, label %bb.i, label %bb16.i.preheader

bb16.i.preheader:                                 ; preds = %bb
  %tmp19.i8 = icmp sgt i32 %tmp5, 0               ; <i1> [#uses=1]
  br i1 %tmp19.i8, label %bb10.i, label %power.exit

bb.i:                                             ; preds = %bb
  %tmp7.i = tail call double @power(double %x, i32 %y) nounwind ; <double> [#uses=1]
  %tmp8.i = fdiv double 1.000000e+00, %tmp7.i     ; <double> [#uses=1]
  br label %power.exit

bb10.i:                                           ; preds = %bb10.i, %bb16.i.preheader
  %number.0.i7 = phi double [ 1.000000e+00, %bb16.i.preheader ], [ %tmp13.i, %bb10.i ] ; <double> [#uses=1]
  %i.0.i6 = phi i32 [ 0, %bb16.i.preheader ], [ %tmp15.i, %bb10.i ] ; <i32> [#uses=1]
  %tmp13.i = fmul double %number.0.i7, %x         ; <double> [#uses=2]
  %tmp15.i = add i32 %i.0.i6, 1                   ; <i32> [#uses=2]
  %exitcond11 = icmp eq i32 %tmp15.i, %tmp5       ; <i1> [#uses=1]
  br i1 %exitcond11, label %power.exit, label %bb10.i

power.exit:                                       ; preds = %bb10.i, %bb.i, %bb16.i.preheader
  %tmp71 = phi double [ %tmp8.i, %bb.i ], [ 1.000000e+00, %bb16.i.preheader ], [ %tmp13.i, %bb10.i ] ; <double> [#uses=1]
  %tmp8 = fdiv double 1.000000e+00, %tmp71        ; <double> [#uses=1]
  ret double %tmp8

bb10:                                             ; preds = %bb10, %bb16.preheader
  %number.03 = phi double [ 1.000000e+00, %bb16.preheader ], [ %tmp13, %bb10 ] ; <double> [#uses=1]
  %i.02 = phi i32 [ 0, %bb16.preheader ], [ %tmp15, %bb10 ] ; <i32> [#uses=1]
  %tmp13 = fmul double %number.03, %x             ; <double> [#uses=2]
  %tmp15 = add i32 %i.02, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %tmp15, %y              ; <i1> [#uses=1]
  br i1 %exitcond, label %bb25, label %bb10

bb25:                                             ; preds = %bb10, %bb16.preheader
  %number.0.lcssa = phi double [ 1.000000e+00, %bb16.preheader ], [ %tmp13, %bb10 ] ; <double> [#uses=1]
  ret double %number.0.lcssa
}
