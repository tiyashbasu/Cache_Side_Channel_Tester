; ModuleID = 'jetbench.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i486-linux-gnu"

%struct.input_data = type { double, double, double, double }

@num_steps = internal global i32 1000000          ; <i32*> [#uses=2]
@inp = global [35 x %struct.input_data] [%struct.input_data { double 0.000000e+00, double 0.000000e+00, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.000000e+02, double 0.000000e+00, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.000000e+02, double 1.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 2.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 3.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 4.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 5.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 6.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 7.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 8.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 9.000000e+03, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.500000e+02, double 1.000000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.500000e+02, double 1.500000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 4.000000e+02, double 2.000000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 4.500000e+02, double 2.500000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 5.000000e+02, double 3.000000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 3.000000e+04, double 9.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 3.000000e+04, double 6.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 2.500000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 2.000000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 6.000000e+02, double 1.500000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 5.000000e+02, double 1.500000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 4.000000e+02, double 1.500000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 4.000000e+02, double 1.000000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 3.000000e+02, double 1.000000e+04, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.850000e+02, double 9.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.700000e+02, double 8.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.550000e+02, double 7.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.400000e+02, double 6.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.250000e+02, double 5.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 2.100000e+02, double 4.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.950000e+02, double 3.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.800000e+02, double 2.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.650000e+02, double 1.000000e+03, double 5.000000e+01, double 5.000000e-02 }, %struct.input_data { double 1.500000e+02, double 0.000000e+00, double 5.000000e+01, double 5.000000e-02 }], align 32 ; <[35 x %struct.input_data]*> [#uses=4]
@engine = internal global i32 0                   ; <i32*> [#uses=11]
@u0d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@altd = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@throtl = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@tref = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@g0d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@g0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=6]
@gama = internal global double 0.000000e+00, align 8 ; <double*> [#uses=14]
@trat = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=32]
@tt = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=90]
@prat = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=52]
@pt = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=41]
@eta = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=19]
@tt4d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@tt4 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@tt7d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@tt7 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@p3p2d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=5]
@p3fp2d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@byprat = internal global double 0.000000e+00, align 8 ; <double*> [#uses=7]
@abflag = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@fhv = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@fhvd = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@acore = internal global double 0.000000e+00, align 8 ; <double*> [#uses=16]
@a2 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@acap = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@a8rat = internal global double 0.000000e+00, align 8 ; <double*> [#uses=5]
@a8 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=7]
@a8d = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@arsched = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@afan = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@a4 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@u0min = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@u0max = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@altmin = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@altmax = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@thrmin = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@thrmax = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@etmin = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@etmax = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@cprmin = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@cprmax = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@bypmin = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@bypmax = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@fprmin = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@fprmax = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@t4min = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@t4max = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@t7min = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@t7max = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@a8max = internal global double 0.000000e+00, align 8 ; <double*> [#uses=7]
@pmax = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@tmin = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@tmax = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@weight = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@dfan = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@dcomp = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@dburner = internal global double 0.000000e+00, align 8 ; <double*> [#uses=5]
@dturbin = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@dnozl = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@Rgas = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@alt = internal global double 0.000000e+00, align 8 ; <double*> [#uses=8]
@ts0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=9]
@ps0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=14]
@a0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@u0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=7]
@fsmach = internal global double 0.000000e+00, align 8 ; <double*> [#uses=9]
@q0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@rho0 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@cpair = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@tsout = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@psout = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@gam = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=29]
@cp = internal global [20 x double] zeroinitializer, align 8 ; <[20 x double]*> [#uses=27]
@epr = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@etr = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@ues = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@eair = internal global double 0.000000e+00, align 8 ; <double*> [#uses=8]
@m2 = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@npr = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@uexit = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@pexit = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@fgros = internal global double 0.000000e+00, align 8 ; <double*> [#uses=5]
@snpr = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@pfexit = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@dram = internal global double 0.000000e+00, align 8 ; <double*> [#uses=5]
@mfr = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@fnet = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@fnlb = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@fglb = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@drlb = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@fa = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@sfc = internal global double 0.000000e+00, align 8 ; <double*> [#uses=5]
@flflo = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@isp = internal global double 0.000000e+00, align 8 ; <double*> [#uses=2]
@lcomp = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@lburn = internal global double 0.000000e+00, align 8 ; <double*> [#uses=5]
@lturb = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@lnoz = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@ncomp = internal global double 0.000000e+00, align 8 ; <double*> [#uses=8]
@nturb = internal global double 0.000000e+00, align 8 ; <double*> [#uses=5]
@a4p = internal global double 0.000000e+00, align 8 ; <double*> [#uses=1]
@sblade = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@hblade = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@tblade = internal global double 0.000000e+00, align 8 ; <double*> [#uses=4]
@xcomp = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@ncompd = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]

define i32 @main(i32 %argc, i8** %argv) {
entry:
  %argc_addr = alloca i32                         ; <i32*> [#uses=1]
  %argv_addr = alloca i8**                        ; <i8***> [#uses=1]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %PiTime = alloca [16 x double], align 8         ; <[16 x double]*> [#uses=0]
  %EndPiTime = alloca [16 x double], align 8      ; <[16 x double]*> [#uses=0]
  %StartPiTime = alloca [16 x double], align 8    ; <[16 x double]*> [#uses=0]
  %TotalTimePoint = alloca double, align 8        ; <double*> [#uses=5]
  %TimePoint = alloca double, align 8             ; <double*> [#uses=3]
  %ExecTotTime = alloca double, align 8           ; <double*> [#uses=0]
  %ExecTime = alloca double, align 8              ; <double*> [#uses=0]
  %EndTime = alloca double, align 8               ; <double*> [#uses=0]
  %StartTime = alloca double, align 8             ; <double*> [#uses=0]
  %TotalTime = alloca double, align 8             ; <double*> [#uses=1]
  %TotalUsed = alloca double, align 8             ; <double*> [#uses=2]
  %usedTime = alloca double, align 8              ; <double*> [#uses=1]
  %used = alloca double, align 8                  ; <double*> [#uses=2]
  %tid3 = alloca i32                              ; <i32*> [#uses=1]
  %tid2 = alloca i32                              ; <i32*> [#uses=1]
  %tid1 = alloca i32                              ; <i32*> [#uses=1]
  %step = alloca double, align 8                  ; <double*> [#uses=3]
  %sum = alloca double, align 8                   ; <double*> [#uses=3]
  %pi = alloca double, align 8                    ; <double*> [#uses=3]
  %x = alloca double, align 8                     ; <double*> [#uses=3]
  %NumMissed = alloca i32                         ; <i32*> [#uses=3]
  %NumPoints = alloca i32                         ; <i32*> [#uses=3]
  %d = alloca double, align 8                     ; <double*> [#uses=1]
  %c = alloca double, align 8                     ; <double*> [#uses=2]
  %b = alloca double, align 8                     ; <double*> [#uses=2]
  %a = alloca double, align 8                     ; <double*> [#uses=2]
  %lid = alloca i32                               ; <i32*> [#uses=8]
  %i = alloca i32                                 ; <i32*> [#uses=6]
  %tmp = alloca i32                               ; <i32*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %argc, i32* %argc_addr
  store i8** %argv, i8*** %argv_addr
  store i32 0, i32* %i, align 4
  store i32 0, i32* %NumPoints, align 4
  store i32 0, i32* %NumMissed, align 4
  %tmp1 = load i32* @num_steps, align 4           ; <i32> [#uses=1]
  %tmp12 = sitofp i32 %tmp1 to double             ; <double> [#uses=1]
  %tmp3 = fdiv double 1.000000e+00, %tmp12        ; <double> [#uses=1]
  store double %tmp3, double* %step, align 8
  store double 0.000000e+00, double* %TotalTime, align 8
  store double 0.000000e+00, double* %TotalTimePoint, align 8
  call void (...)* bitcast (void ()* @defaultParam to void (...)*)() nounwind
  store i32 1, i32* @engine, align 4
  store i32 0, i32* %lid, align 4
  br label %bb116

bb:                                               ; preds = %bb116
  store i32 0, i32* %tid1, align 4
  store i32 0, i32* %i, align 4
  br label %bb20

bb4:                                              ; preds = %bb20
  %tmp5 = load i32* %i, align 4                   ; <i32> [#uses=1]
  %tmp56 = sitofp i32 %tmp5 to double             ; <double> [#uses=1]
  %tmp7 = fadd double %tmp56, 5.000000e-01        ; <double> [#uses=1]
  %tmp8 = load double* %step, align 8             ; <double> [#uses=1]
  %tmp9 = fmul double %tmp7, %tmp8                ; <double> [#uses=1]
  store double %tmp9, double* %x, align 8
  %tmp10 = load double* %x, align 8               ; <double> [#uses=1]
  %tmp11 = load double* %x, align 8               ; <double> [#uses=1]
  %tmp13 = fmul double %tmp10, %tmp11             ; <double> [#uses=1]
  %tmp14 = fadd double %tmp13, 1.000000e+00       ; <double> [#uses=1]
  %tmp15 = fdiv double 4.000000e+00, %tmp14       ; <double> [#uses=1]
  %tmp16 = load double* %sum, align 8             ; <double> [#uses=1]
  %tmp17 = fadd double %tmp15, %tmp16             ; <double> [#uses=1]
  store double %tmp17, double* %sum, align 8
  %tmp18 = load i32* %i, align 4                  ; <i32> [#uses=1]
  %tmp19 = add i32 %tmp18, 1                      ; <i32> [#uses=1]
  store i32 %tmp19, i32* %i, align 4
  br label %bb20

bb20:                                             ; preds = %bb4, %bb
  %tmp21 = load i32* @num_steps, align 4          ; <i32> [#uses=1]
  %tmp22 = load i32* %i, align 4                  ; <i32> [#uses=1]
  %tmp23 = icmp slt i32 %tmp22, %tmp21            ; <i1> [#uses=1]
  %tmp2324 = zext i1 %tmp23 to i8                 ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp2324, 0                ; <i1> [#uses=1]
  br i1 %toBool, label %bb4, label %bb25

bb25:                                             ; preds = %bb20
  %tmp26 = load double* %sum, align 8             ; <double> [#uses=1]
  %tmp27 = load double* %step, align 8            ; <double> [#uses=1]
  %tmp28 = fmul double %tmp26, %tmp27             ; <double> [#uses=1]
  store double %tmp28, double* %pi, align 8
  store i32 0, i32* %tid2, align 4
  %tmp29 = load double* %a, align 8               ; <double> [#uses=1]
  %tmp30 = fcmp olt double %tmp29, 0.000000e+00   ; <i1> [#uses=1]
  %tmp3031 = zext i1 %tmp30 to i8                 ; <i8> [#uses=1]
  %toBool32 = icmp ne i8 %tmp3031, 0              ; <i1> [#uses=1]
  br i1 %toBool32, label %bb38, label %bb33

bb33:                                             ; preds = %bb25
  %tmp34 = load double* %a, align 8               ; <double> [#uses=1]
  %tmp35 = fcmp ogt double %tmp34, 1.500000e+03   ; <i1> [#uses=1]
  %tmp3536 = zext i1 %tmp35 to i8                 ; <i8> [#uses=1]
  %toBool37 = icmp ne i8 %tmp3536, 0              ; <i1> [#uses=1]
  br i1 %toBool37, label %bb38, label %bb39

bb38:                                             ; preds = %bb33, %bb25
  store double 0.000000e+00, double* @u0d, align 8
  br label %bb44

bb39:                                             ; preds = %bb33
  %tmp40 = load i32* %lid, align 4                ; <i32> [#uses=1]
  %tmp41 = getelementptr [35 x %struct.input_data]* @inp, i32 0, i32 %tmp40 ; <%struct.input_data*> [#uses=1]
  %tmp42 = getelementptr %struct.input_data* %tmp41, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp43 = load double* %tmp42, align 4           ; <double> [#uses=1]
  store double %tmp43, double* @u0d, align 8
  br label %bb44

bb44:                                             ; preds = %bb39, %bb38
  %tmp45 = load double* %b, align 8               ; <double> [#uses=1]
  %tmp46 = fcmp olt double %tmp45, 0.000000e+00   ; <i1> [#uses=1]
  %tmp4647 = zext i1 %tmp46 to i8                 ; <i8> [#uses=1]
  %toBool48 = icmp ne i8 %tmp4647, 0              ; <i1> [#uses=1]
  br i1 %toBool48, label %bb54, label %bb49

bb49:                                             ; preds = %bb44
  %tmp50 = load double* %b, align 8               ; <double> [#uses=1]
  %tmp51 = fcmp ogt double %tmp50, 5.000000e+04   ; <i1> [#uses=1]
  %tmp5152 = zext i1 %tmp51 to i8                 ; <i8> [#uses=1]
  %toBool53 = icmp ne i8 %tmp5152, 0              ; <i1> [#uses=1]
  br i1 %toBool53, label %bb54, label %bb55

bb54:                                             ; preds = %bb49, %bb44
  store double 0.000000e+00, double* @altd, align 8
  br label %bb61

bb55:                                             ; preds = %bb49
  %tmp57 = load i32* %lid, align 4                ; <i32> [#uses=1]
  %tmp58 = getelementptr [35 x %struct.input_data]* @inp, i32 0, i32 %tmp57 ; <%struct.input_data*> [#uses=1]
  %tmp59 = getelementptr %struct.input_data* %tmp58, i32 0, i32 1 ; <double*> [#uses=1]
  %tmp60 = load double* %tmp59, align 4           ; <double> [#uses=1]
  store double %tmp60, double* @altd, align 8
  br label %bb61

bb61:                                             ; preds = %bb55, %bb54
  %tmp62 = load double* %c, align 8               ; <double> [#uses=1]
  %tmp63 = fcmp olt double %tmp62, 4.500000e+01   ; <i1> [#uses=1]
  %tmp6364 = zext i1 %tmp63 to i8                 ; <i8> [#uses=1]
  %toBool65 = icmp ne i8 %tmp6364, 0              ; <i1> [#uses=1]
  br i1 %toBool65, label %bb71, label %bb66

bb66:                                             ; preds = %bb61
  %tmp67 = load double* %c, align 8               ; <double> [#uses=1]
  %tmp68 = fcmp ogt double %tmp67, 9.000000e+01   ; <i1> [#uses=1]
  %tmp6869 = zext i1 %tmp68 to i8                 ; <i8> [#uses=1]
  %toBool70 = icmp ne i8 %tmp6869, 0              ; <i1> [#uses=1]
  br i1 %toBool70, label %bb71, label %bb72

bb71:                                             ; preds = %bb66, %bb61
  store double 1.000000e+02, double* @throtl, align 8
  br label %bb83

bb72:                                             ; preds = %bb66
  %tmp73 = load i32* %lid, align 4                ; <i32> [#uses=1]
  %tmp74 = getelementptr [35 x %struct.input_data]* @inp, i32 0, i32 %tmp73 ; <%struct.input_data*> [#uses=1]
  %tmp75 = getelementptr %struct.input_data* %tmp74, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp76 = load double* %tmp75, align 4           ; <double> [#uses=1]
  %tmp77 = load double* %pi, align 8              ; <double> [#uses=1]
  %tmp78 = call double @deg2rad(double %tmp76, double %tmp77) nounwind ; <double> [#uses=1]
  %tmp79 = fmul double %tmp78, 1.000000e+02       ; <double> [#uses=1]
  %tmp80 = fmul double %tmp79, 2.000000e+00       ; <double> [#uses=1]
  %tmp81 = load double* %pi, align 8              ; <double> [#uses=1]
  %tmp82 = fdiv double %tmp80, %tmp81             ; <double> [#uses=1]
  store double %tmp82, double* @throtl, align 8
  br label %bb83

bb83:                                             ; preds = %bb72, %bb71
  %tmp84 = load double* %d, align 8               ; <double> [#uses=1]
  %tmp85 = fcmp olt double %tmp84, 0.000000e+00   ; <i1> [#uses=1]
  %tmp8586 = zext i1 %tmp85 to i8                 ; <i8> [#uses=1]
  %toBool87 = icmp ne i8 %tmp8586, 0              ; <i1> [#uses=1]
  br i1 %toBool87, label %bb88, label %bb89

bb88:                                             ; preds = %bb83
  store double 0.000000e+00, double* %TimePoint, align 8
  br label %bb94

bb89:                                             ; preds = %bb83
  %tmp90 = load i32* %lid, align 4                ; <i32> [#uses=1]
  %tmp91 = getelementptr [35 x %struct.input_data]* @inp, i32 0, i32 %tmp90 ; <%struct.input_data*> [#uses=1]
  %tmp92 = getelementptr %struct.input_data* %tmp91, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp93 = load double* %tmp92, align 4           ; <double> [#uses=1]
  store double %tmp93, double* %TimePoint, align 8
  br label %bb94

bb94:                                             ; preds = %bb89, %bb88
  %tmp95 = load double* %TotalTimePoint, align 8  ; <double> [#uses=1]
  %tmp96 = load double* %TimePoint, align 8       ; <double> [#uses=1]
  %tmp97 = fadd double %tmp95, %tmp96             ; <double> [#uses=1]
  store double %tmp97, double* %TotalTimePoint, align 8
  call void (...)* bitcast (void ()* @deduceInputs to void (...)*)() nounwind
  call void (...)* bitcast (void ()* @getThermo to void (...)*)() nounwind
  call void (...)* bitcast (void ()* @getGeo to void (...)*)() nounwind
  call void (...)* bitcast (void ()* @calcPerf to void (...)*)() nounwind
  store i32 0, i32* %tid3, align 4
  %tmp98 = load double* %TotalUsed, align 8       ; <double> [#uses=1]
  %tmp99 = load double* %used, align 8            ; <double> [#uses=1]
  %tmp100 = fadd double %tmp98, %tmp99            ; <double> [#uses=1]
  store double %tmp100, double* %TotalUsed, align 8
  %tmp101 = load i32* %NumPoints, align 4         ; <i32> [#uses=1]
  %tmp102 = add i32 %tmp101, 1                    ; <i32> [#uses=1]
  store i32 %tmp102, i32* %NumPoints, align 4
  %tmp103 = load double* %used, align 8           ; <double> [#uses=1]
  %tmp104 = fcmp ogt double %tmp103, 1.000000e+00 ; <i1> [#uses=1]
  %tmp104105 = zext i1 %tmp104 to i8              ; <i8> [#uses=1]
  %toBool106 = icmp ne i8 %tmp104105, 0           ; <i1> [#uses=1]
  br i1 %toBool106, label %bb107, label %bb113

bb107:                                            ; preds = %bb94
  %tmp108 = load i32* %NumMissed, align 4         ; <i32> [#uses=1]
  %tmp109 = add i32 %tmp108, 1                    ; <i32> [#uses=1]
  store i32 %tmp109, i32* %NumMissed, align 4
  %tmp110 = load double* %TotalTimePoint, align 8 ; <double> [#uses=1]
  %tmp111 = load double* %usedTime, align 8       ; <double> [#uses=1]
  %tmp112 = fadd double %tmp110, %tmp111          ; <double> [#uses=1]
  store double %tmp112, double* %TotalTimePoint, align 8
  br label %bb113

bb113:                                            ; preds = %bb107, %bb94
  %tmp114 = load i32* %lid, align 4               ; <i32> [#uses=1]
  %tmp115 = add i32 %tmp114, 1                    ; <i32> [#uses=1]
  store i32 %tmp115, i32* %lid, align 4
  br label %bb116

bb116:                                            ; preds = %bb113, %entry
  %tmp117 = load i32* %lid, align 4               ; <i32> [#uses=1]
  %tmp118 = icmp sle i32 %tmp117, 34              ; <i1> [#uses=1]
  %tmp118119 = zext i1 %tmp118 to i8              ; <i8> [#uses=1]
  %toBool120 = icmp ne i8 %tmp118119, 0           ; <i1> [#uses=1]
  br i1 %toBool120, label %bb, label %bb121

bb121:                                            ; preds = %bb116
  store i32 0, i32* %tmp, align 4
  %tmp122 = load i32* %tmp, align 4               ; <i32> [#uses=1]
  store i32 %tmp122, i32* %retval, align 4
  br label %return

return:                                           ; preds = %bb121
  %retval123 = load i32* %retval                  ; <i32> [#uses=1]
  ret i32 %retval123
}

define double @deg2rad(double %deg, double %pi) {
entry:
  %deg_addr = alloca double                       ; <double*> [#uses=2]
  %pi_addr = alloca double                        ; <double*> [#uses=2]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %tmp = alloca double, align 8                   ; <double*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %deg, double* %deg_addr
  store double %pi, double* %pi_addr
  %tmp1 = load double* %deg_addr, align 8         ; <double> [#uses=1]
  %tmp2 = fdiv double %tmp1, 1.800000e+02         ; <double> [#uses=1]
  %tmp3 = load double* %pi_addr, align 8          ; <double> [#uses=1]
  %tmp4 = fmul double %tmp2, %tmp3                ; <double> [#uses=1]
  store double %tmp4, double* %tmp, align 8
  %tmp5 = load double* %tmp, align 8              ; <double> [#uses=1]
  store double %tmp5, double* %retval, align 8
  br label %return

return:                                           ; preds = %entry
  %retval6 = load double* %retval                 ; <double> [#uses=1]
  ret double %retval6
}

define double @getGama(double %temp) {
entry:
  %temp_addr = alloca double                      ; <double*> [#uses=7]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %d = alloca double, align 8                     ; <double*> [#uses=2]
  %c = alloca double, align 8                     ; <double*> [#uses=2]
  %b = alloca double, align 8                     ; <double*> [#uses=2]
  %a = alloca double, align 8                     ; <double*> [#uses=2]
  %number = alloca double, align 8                ; <double*> [#uses=2]
  %tmp = alloca double, align 8                   ; <double*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %temp, double* %temp_addr
  store double 0xBD6B1260BD3B5F28, double* %a, align 8
  store double 0x3E4D8F33D1342F7D, double* %b, align 8
  store double 0xBF147EF440AF8646, double* %c, align 8
  store double 1.436914e+00, double* %d, align 8
  %tmp1 = load double* %a, align 8                ; <double> [#uses=1]
  %tmp2 = load double* %temp_addr, align 8        ; <double> [#uses=1]
  %tmp3 = fmul double %tmp1, %tmp2                ; <double> [#uses=1]
  %tmp4 = load double* %temp_addr, align 8        ; <double> [#uses=1]
  %tmp5 = fmul double %tmp3, %tmp4                ; <double> [#uses=1]
  %tmp6 = load double* %temp_addr, align 8        ; <double> [#uses=1]
  %tmp7 = fmul double %tmp5, %tmp6                ; <double> [#uses=1]
  %tmp8 = load double* %b, align 8                ; <double> [#uses=1]
  %tmp9 = load double* %temp_addr, align 8        ; <double> [#uses=1]
  %tmp10 = fmul double %tmp8, %tmp9               ; <double> [#uses=1]
  %tmp11 = load double* %temp_addr, align 8       ; <double> [#uses=1]
  %tmp12 = fmul double %tmp10, %tmp11             ; <double> [#uses=1]
  %tmp13 = fadd double %tmp7, %tmp12              ; <double> [#uses=1]
  %tmp14 = load double* %c, align 8               ; <double> [#uses=1]
  %tmp15 = load double* %temp_addr, align 8       ; <double> [#uses=1]
  %tmp16 = fmul double %tmp14, %tmp15             ; <double> [#uses=1]
  %tmp17 = fadd double %tmp13, %tmp16             ; <double> [#uses=1]
  %tmp18 = load double* %d, align 8               ; <double> [#uses=1]
  %tmp19 = fadd double %tmp17, %tmp18             ; <double> [#uses=1]
  store double %tmp19, double* %number, align 8
  %tmp20 = load double* %number, align 8          ; <double> [#uses=1]
  store double %tmp20, double* %tmp, align 8
  %tmp21 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp21, double* %retval, align 8
  br label %return

return:                                           ; preds = %entry
  %retval22 = load double* %retval                ; <double> [#uses=1]
  ret double %retval22
}

define double @getCp(double %temp) {
entry:
  %temp_addr = alloca double                      ; <double*> [#uses=7]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %d = alloca double, align 8                     ; <double*> [#uses=2]
  %c = alloca double, align 8                     ; <double*> [#uses=2]
  %b = alloca double, align 8                     ; <double*> [#uses=2]
  %a = alloca double, align 8                     ; <double*> [#uses=2]
  %number = alloca double, align 8                ; <double*> [#uses=2]
  %tmp = alloca double, align 8                   ; <double*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %temp, double* %temp_addr
  store double -4.470213e-13, double* %a, align 8
  store double 0xBE019F35A06F41FC, double* %b, align 8
  store double 0x3EFDB2FC7C597DC0, double* %c, align 8
  store double 2.245283e-01, double* %d, align 8
  %tmp1 = load double* %a, align 8                ; <double> [#uses=1]
  %tmp2 = load double* %temp_addr, align 8        ; <double> [#uses=1]
  %tmp3 = fmul double %tmp1, %tmp2                ; <double> [#uses=1]
  %tmp4 = load double* %temp_addr, align 8        ; <double> [#uses=1]
  %tmp5 = fmul double %tmp3, %tmp4                ; <double> [#uses=1]
  %tmp6 = load double* %temp_addr, align 8        ; <double> [#uses=1]
  %tmp7 = fmul double %tmp5, %tmp6                ; <double> [#uses=1]
  %tmp8 = load double* %b, align 8                ; <double> [#uses=1]
  %tmp9 = load double* %temp_addr, align 8        ; <double> [#uses=1]
  %tmp10 = fmul double %tmp8, %tmp9               ; <double> [#uses=1]
  %tmp11 = load double* %temp_addr, align 8       ; <double> [#uses=1]
  %tmp12 = fmul double %tmp10, %tmp11             ; <double> [#uses=1]
  %tmp13 = fadd double %tmp7, %tmp12              ; <double> [#uses=1]
  %tmp14 = load double* %c, align 8               ; <double> [#uses=1]
  %tmp15 = load double* %temp_addr, align 8       ; <double> [#uses=1]
  %tmp16 = fmul double %tmp14, %tmp15             ; <double> [#uses=1]
  %tmp17 = fadd double %tmp13, %tmp16             ; <double> [#uses=1]
  %tmp18 = load double* %d, align 8               ; <double> [#uses=1]
  %tmp19 = fadd double %tmp17, %tmp18             ; <double> [#uses=1]
  store double %tmp19, double* %number, align 8
  %tmp20 = load double* %number, align 8          ; <double> [#uses=1]
  store double %tmp20, double* %tmp, align 8
  %tmp21 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp21, double* %retval, align 8
  br label %return

return:                                           ; preds = %entry
  %retval22 = load double* %retval                ; <double> [#uses=1]
  ret double %retval22
}

define double @getMach(i32 %sub, double %corair, double %gama1) {
entry:
  %sub_addr = alloca i32                          ; <i32*> [#uses=3]
  %corair_addr = alloca double                    ; <double*> [#uses=4]
  %gama1_addr = alloca double                     ; <double*> [#uses=3]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %iter = alloca i32                              ; <i32*> [#uses=4]
  %airn = alloca double, align 8                  ; <double*> [#uses=3]
  %airo = alloca double, align 8                  ; <double*> [#uses=5]
  %macho = alloca double, align 8                 ; <double*> [#uses=8]
  %machn = alloca double, align 8                 ; <double*> [#uses=5]
  %deriv = alloca double, align 8                 ; <double*> [#uses=2]
  %chokair = alloca double, align 8               ; <double*> [#uses=2]
  %number = alloca double, align 8                ; <double*> [#uses=4]
  %tmp = alloca double, align 8                   ; <double*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %sub, i32* %sub_addr
  store double %corair, double* %corair_addr
  store double %gama1, double* %gama1_addr
  %tmp1 = load double* %gama1_addr, align 8       ; <double> [#uses=1]
  %tmp2 = call double (...)* bitcast (double (double, double)* @getAir to double (...)*)(double 1.000000e+00, double %tmp1) nounwind ; <double> [#uses=1]
  store double %tmp2, double* %chokair, align 8
  %tmp3 = load double* %corair_addr, align 8      ; <double> [#uses=1]
  %tmp4 = load double* %chokair, align 8          ; <double> [#uses=1]
  %tmp5 = fcmp ogt double %tmp3, %tmp4            ; <i1> [#uses=1]
  %tmp56 = zext i1 %tmp5 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp56, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb8

bb:                                               ; preds = %entry
  store double 1.000000e+00, double* %number, align 8
  %tmp7 = load double* %number, align 8           ; <double> [#uses=1]
  store double %tmp7, double* %tmp, align 8
  br label %bb63

bb8:                                              ; preds = %entry
  store double 2.561800e-01, double* %airo, align 8
  %tmp9 = load i32* %sub_addr, align 4            ; <i32> [#uses=1]
  %tmp10 = icmp eq i32 %tmp9, 1                   ; <i1> [#uses=1]
  %tmp1011 = zext i1 %tmp10 to i8                 ; <i8> [#uses=1]
  %toBool12 = icmp ne i8 %tmp1011, 0              ; <i1> [#uses=1]
  br i1 %toBool12, label %bb13, label %bb14

bb13:                                             ; preds = %bb8
  store double 1.000000e+00, double* %macho, align 8
  br label %bb60

bb14:                                             ; preds = %bb8
  %tmp15 = load i32* %sub_addr, align 4           ; <i32> [#uses=1]
  %tmp16 = icmp eq i32 %tmp15, 2                  ; <i1> [#uses=1]
  %tmp1617 = zext i1 %tmp16 to i8                 ; <i8> [#uses=1]
  %toBool18 = icmp ne i8 %tmp1617, 0              ; <i1> [#uses=1]
  br i1 %toBool18, label %bb19, label %bb20

bb19:                                             ; preds = %bb14
  store double 1.703000e+00, double* %macho, align 8
  br label %bb21

bb20:                                             ; preds = %bb14
  store double 5.000000e-01, double* %macho, align 8
  br label %bb21

bb21:                                             ; preds = %bb20, %bb19
  store i32 1, i32* %iter, align 4
  %tmp22 = load double* %macho, align 8           ; <double> [#uses=1]
  %tmp23 = fsub double %tmp22, 2.000000e-01       ; <double> [#uses=1]
  store double %tmp23, double* %machn, align 8
  br label %bb46

bb24:                                             ; preds = %bb54
  %tmp25 = load double* %machn, align 8           ; <double> [#uses=1]
  %tmp26 = load double* %gama1_addr, align 8      ; <double> [#uses=1]
  %tmp27 = call double (...)* bitcast (double (double, double)* @getAir to double (...)*)(double %tmp25, double %tmp26) nounwind ; <double> [#uses=1]
  store double %tmp27, double* %airn, align 8
  %tmp28 = load double* %airn, align 8            ; <double> [#uses=1]
  %tmp29 = load double* %airo, align 8            ; <double> [#uses=1]
  %tmp30 = fsub double %tmp28, %tmp29             ; <double> [#uses=1]
  %tmp31 = load double* %machn, align 8           ; <double> [#uses=1]
  %tmp32 = load double* %macho, align 8           ; <double> [#uses=1]
  %tmp33 = fsub double %tmp31, %tmp32             ; <double> [#uses=1]
  %tmp34 = fdiv double %tmp30, %tmp33             ; <double> [#uses=1]
  store double %tmp34, double* %deriv, align 8
  %tmp35 = load double* %airn, align 8            ; <double> [#uses=1]
  store double %tmp35, double* %airo, align 8
  %tmp36 = load double* %machn, align 8           ; <double> [#uses=1]
  store double %tmp36, double* %macho, align 8
  %tmp37 = load double* %corair_addr, align 8     ; <double> [#uses=1]
  %tmp38 = load double* %airo, align 8            ; <double> [#uses=1]
  %tmp39 = fsub double %tmp37, %tmp38             ; <double> [#uses=1]
  %tmp40 = load double* %deriv, align 8           ; <double> [#uses=1]
  %tmp41 = fdiv double %tmp39, %tmp40             ; <double> [#uses=1]
  %tmp42 = load double* %macho, align 8           ; <double> [#uses=1]
  %tmp43 = fadd double %tmp41, %tmp42             ; <double> [#uses=1]
  store double %tmp43, double* %machn, align 8
  %tmp44 = load i32* %iter, align 4               ; <i32> [#uses=1]
  %tmp45 = add i32 %tmp44, 1                      ; <i32> [#uses=1]
  store i32 %tmp45, i32* %iter, align 4
  br label %bb46

bb46:                                             ; preds = %bb24, %bb21
  %tmp47 = load double* %corair_addr, align 8     ; <double> [#uses=1]
  %tmp48 = load double* %airo, align 8            ; <double> [#uses=1]
  %tmp49 = fsub double %tmp47, %tmp48             ; <double> [#uses=1]
  %tmp50 = call double @fabs(double %tmp49)       ; <double> [#uses=1]
  %tmp51 = fcmp ule double %tmp50, 1.000000e-04   ; <i1> [#uses=1]
  %tmp5152 = zext i1 %tmp51 to i8                 ; <i8> [#uses=1]
  %toBool53 = icmp ne i8 %tmp5152, 0              ; <i1> [#uses=1]
  br i1 %toBool53, label %bb60, label %bb54

bb54:                                             ; preds = %bb46
  %tmp55 = load i32* %iter, align 4               ; <i32> [#uses=1]
  %tmp57 = icmp sle i32 %tmp55, 19                ; <i1> [#uses=1]
  %tmp5758 = zext i1 %tmp57 to i8                 ; <i8> [#uses=1]
  %toBool59 = icmp ne i8 %tmp5758, 0              ; <i1> [#uses=1]
  br i1 %toBool59, label %bb24, label %bb60

bb60:                                             ; preds = %bb54, %bb46, %bb13
  %tmp61 = load double* %macho, align 8           ; <double> [#uses=1]
  store double %tmp61, double* %number, align 8
  %tmp62 = load double* %number, align 8          ; <double> [#uses=1]
  store double %tmp62, double* %tmp, align 8
  br label %bb63

bb63:                                             ; preds = %bb60, %bb
  %tmp64 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp64, double* %retval, align 8
  br label %return

return:                                           ; preds = %bb63
  %retval65 = load double* %retval                ; <double> [#uses=1]
  ret double %retval65
}

define double @getAir(double %mach, double %gama2) {
entry:
  %mach_addr = alloca double                      ; <double*> [#uses=4]
  %gama2_addr = alloca double                     ; <double*> [#uses=5]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %fac2 = alloca double, align 8                  ; <double*> [#uses=2]
  %fac1 = alloca double, align 8                  ; <double*> [#uses=2]
  %number = alloca double, align 8                ; <double*> [#uses=2]
  %tmp = alloca double, align 8                   ; <double*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %mach, double* %mach_addr
  store double %gama2, double* %gama2_addr
  %tmp1 = load double* %gama2_addr, align 8       ; <double> [#uses=1]
  %tmp2 = fadd double %tmp1, 1.000000e+00         ; <double> [#uses=1]
  %tmp3 = load double* %gama2_addr, align 8       ; <double> [#uses=1]
  %tmp4 = fsub double %tmp3, 1.000000e+00         ; <double> [#uses=1]
  %tmp5 = fmul double %tmp4, 2.000000e+00         ; <double> [#uses=1]
  %tmp6 = fdiv double %tmp2, %tmp5                ; <double> [#uses=1]
  store double %tmp6, double* %fac2, align 8
  %tmp7 = load double* %gama2_addr, align 8       ; <double> [#uses=1]
  %tmp8 = fsub double %tmp7, 1.000000e+00         ; <double> [#uses=1]
  %tmp9 = fmul double %tmp8, 5.000000e-01         ; <double> [#uses=1]
  %tmp10 = load double* %mach_addr, align 8       ; <double> [#uses=1]
  %tmp11 = fmul double %tmp9, %tmp10              ; <double> [#uses=1]
  %tmp12 = load double* %mach_addr, align 8       ; <double> [#uses=1]
  %tmp13 = fmul double %tmp11, %tmp12             ; <double> [#uses=1]
  %tmp14 = fadd double %tmp13, 1.000000e+00       ; <double> [#uses=1]
  %tmp15 = load double* %fac2, align 8            ; <double> [#uses=1]
  %tmp16 = call double @fpow(double %tmp14, double %tmp15) nounwind ; <double> [#uses=1]
  store double %tmp16, double* %fac1, align 8
  %tmp17 = load double* %gama2_addr, align 8      ; <double> [#uses=1]
  %tmp18 = call double @sqroot(double %tmp17) nounwind ; <double> [#uses=1]
  %tmp19 = fmul double %tmp18, 5.016100e-01       ; <double> [#uses=1]
  %tmp20 = load double* %mach_addr, align 8       ; <double> [#uses=1]
  %tmp21 = fmul double %tmp19, %tmp20             ; <double> [#uses=1]
  %tmp22 = load double* %fac1, align 8            ; <double> [#uses=1]
  %tmp23 = fdiv double %tmp21, %tmp22             ; <double> [#uses=1]
  store double %tmp23, double* %number, align 8
  %tmp24 = load double* %number, align 8          ; <double> [#uses=1]
  store double %tmp24, double* %tmp, align 8
  %tmp25 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp25, double* %retval, align 8
  br label %return

return:                                           ; preds = %entry
  %retval26 = load double* %retval                ; <double> [#uses=1]
  ret double %retval26
}

define double @getRayleighLoss(double %mach1, double %ttrat, double %tlow) {
entry:
  %mach1_addr = alloca double                     ; <double*> [#uses=6]
  %ttrat_addr = alloca double                     ; <double*> [#uses=3]
  %tlow_addr = alloca double                      ; <double*> [#uses=3]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %fac4 = alloca double, align 8                  ; <double*> [#uses=2]
  %fac3 = alloca double, align 8                  ; <double*> [#uses=2]
  %fac2 = alloca double, align 8                  ; <double*> [#uses=2]
  %fac1 = alloca double, align 8                  ; <double*> [#uses=2]
  %gm2 = alloca double, align 8                   ; <double*> [#uses=3]
  %g2 = alloca double, align 8                    ; <double*> [#uses=5]
  %gm1 = alloca double, align 8                   ; <double*> [#uses=3]
  %g1 = alloca double, align 8                    ; <double*> [#uses=5]
  %mach2 = alloca double, align 8                 ; <double*> [#uses=8]
  %mgueso = alloca double, align 8                ; <double*> [#uses=3]
  %wc2 = alloca double, align 8                   ; <double*> [#uses=2]
  %wc1 = alloca double, align 8                   ; <double*> [#uses=2]
  %number = alloca double, align 8                ; <double*> [#uses=4]
  %tmp = alloca double, align 8                   ; <double*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %mach1, double* %mach1_addr
  store double %ttrat, double* %ttrat_addr
  store double %tlow, double* %tlow_addr
  %tmp1 = load double* %tlow_addr, align 8        ; <double> [#uses=1]
  %tmp2 = call double @getGama(double %tmp1) nounwind ; <double> [#uses=1]
  store double %tmp2, double* %g1, align 8
  %tmp3 = load double* %g1, align 8               ; <double> [#uses=1]
  %tmp4 = fsub double %tmp3, 1.000000e+00         ; <double> [#uses=1]
  store double %tmp4, double* %gm1, align 8
  %tmp5 = load double* %mach1_addr, align 8       ; <double> [#uses=1]
  %tmp6 = load double* %g1, align 8               ; <double> [#uses=1]
  %tmp7 = call double @getAir(double %tmp5, double %tmp6) nounwind ; <double> [#uses=1]
  store double %tmp7, double* %wc1, align 8
  %tmp8 = load double* %tlow_addr, align 8        ; <double> [#uses=1]
  %tmp9 = load double* %ttrat_addr, align 8       ; <double> [#uses=1]
  %tmp10 = fmul double %tmp8, %tmp9               ; <double> [#uses=1]
  %tmp11 = call double @getGama(double %tmp10) nounwind ; <double> [#uses=1]
  store double %tmp11, double* %g2, align 8
  %tmp12 = load double* %g2, align 8              ; <double> [#uses=1]
  %tmp13 = fsub double %tmp12, 1.000000e+00       ; <double> [#uses=1]
  store double %tmp13, double* %gm2, align 8
  store double 9.500000e-01, double* %number, align 8
  store double 4.000000e-01, double* %mgueso, align 8
  store double 5.000000e-01, double* %mach2, align 8
  br label %bb65

bb:                                               ; preds = %bb65
  %tmp14 = load double* %mach2, align 8           ; <double> [#uses=1]
  store double %tmp14, double* %mgueso, align 8
  %tmp15 = load double* %g1, align 8              ; <double> [#uses=1]
  %tmp16 = load double* %mach1_addr, align 8      ; <double> [#uses=1]
  %tmp17 = fmul double %tmp15, %tmp16             ; <double> [#uses=1]
  %tmp18 = load double* %mach1_addr, align 8      ; <double> [#uses=1]
  %tmp19 = fmul double %tmp17, %tmp18             ; <double> [#uses=1]
  %tmp20 = fadd double %tmp19, 1.000000e+00       ; <double> [#uses=1]
  store double %tmp20, double* %fac1, align 8
  %tmp21 = load double* %g2, align 8              ; <double> [#uses=1]
  %tmp22 = load double* %mach2, align 8           ; <double> [#uses=1]
  %tmp23 = fmul double %tmp21, %tmp22             ; <double> [#uses=1]
  %tmp24 = load double* %mach2, align 8           ; <double> [#uses=1]
  %tmp25 = fmul double %tmp23, %tmp24             ; <double> [#uses=1]
  %tmp26 = fadd double %tmp25, 1.000000e+00       ; <double> [#uses=1]
  store double %tmp26, double* %fac2, align 8
  %tmp27 = load double* %g1, align 8              ; <double> [#uses=1]
  %tmp28 = load double* %gm1, align 8             ; <double> [#uses=1]
  %tmp29 = fdiv double %tmp27, %tmp28             ; <double> [#uses=1]
  %tmp30 = load double* %gm1, align 8             ; <double> [#uses=1]
  %tmp31 = fmul double %tmp30, 5.000000e-01       ; <double> [#uses=1]
  %tmp32 = load double* %mach1_addr, align 8      ; <double> [#uses=1]
  %tmp33 = fmul double %tmp31, %tmp32             ; <double> [#uses=1]
  %tmp34 = load double* %mach1_addr, align 8      ; <double> [#uses=1]
  %tmp35 = fmul double %tmp33, %tmp34             ; <double> [#uses=1]
  %tmp36 = fadd double %tmp35, 1.000000e+00       ; <double> [#uses=1]
  %tmp37 = call double @fpow(double %tmp36, double %tmp29) nounwind ; <double> [#uses=1]
  store double %tmp37, double* %fac3, align 8
  %tmp38 = load double* %g2, align 8              ; <double> [#uses=1]
  %tmp39 = load double* %gm2, align 8             ; <double> [#uses=1]
  %tmp40 = fdiv double %tmp38, %tmp39             ; <double> [#uses=1]
  %tmp41 = load double* %gm2, align 8             ; <double> [#uses=1]
  %tmp42 = fmul double %tmp41, 5.000000e-01       ; <double> [#uses=1]
  %tmp43 = load double* %mach2, align 8           ; <double> [#uses=1]
  %tmp44 = fmul double %tmp42, %tmp43             ; <double> [#uses=1]
  %tmp45 = load double* %mach2, align 8           ; <double> [#uses=1]
  %tmp46 = fmul double %tmp44, %tmp45             ; <double> [#uses=1]
  %tmp47 = fadd double %tmp46, 1.000000e+00       ; <double> [#uses=1]
  %tmp48 = call double @fpow(double %tmp47, double %tmp40) nounwind ; <double> [#uses=1]
  store double %tmp48, double* %fac4, align 8
  %tmp49 = load double* %fac1, align 8            ; <double> [#uses=1]
  %tmp50 = load double* %fac4, align 8            ; <double> [#uses=1]
  %tmp51 = fmul double %tmp49, %tmp50             ; <double> [#uses=1]
  %tmp52 = load double* %fac2, align 8            ; <double> [#uses=1]
  %tmp53 = fdiv double %tmp51, %tmp52             ; <double> [#uses=1]
  %tmp54 = load double* %fac3, align 8            ; <double> [#uses=1]
  %tmp55 = fdiv double %tmp53, %tmp54             ; <double> [#uses=1]
  store double %tmp55, double* %number, align 8
  %tmp56 = load double* %ttrat_addr, align 8      ; <double> [#uses=1]
  %tmp57 = call double @sqroot(double %tmp56) nounwind ; <double> [#uses=1]
  %tmp58 = load double* %wc1, align 8             ; <double> [#uses=1]
  %tmp59 = fmul double %tmp57, %tmp58             ; <double> [#uses=1]
  %tmp60 = load double* %number, align 8          ; <double> [#uses=1]
  %tmp61 = fdiv double %tmp59, %tmp60             ; <double> [#uses=1]
  store double %tmp61, double* %wc2, align 8
  %tmp62 = load double* %wc2, align 8             ; <double> [#uses=1]
  %tmp63 = load double* %g2, align 8              ; <double> [#uses=1]
  %tmp64 = call double @getMach(i32 0, double %tmp62, double %tmp63) nounwind ; <double> [#uses=1]
  store double %tmp64, double* %mach2, align 8
  br label %bb65

bb65:                                             ; preds = %bb, %entry
  %tmp66 = load double* %mach2, align 8           ; <double> [#uses=1]
  %tmp67 = load double* %mgueso, align 8          ; <double> [#uses=1]
  %tmp68 = fsub double %tmp66, %tmp67             ; <double> [#uses=1]
  %tmp69 = call double @fabs(double %tmp68)       ; <double> [#uses=1]
  %tmp70 = fcmp ogt double %tmp69, 1.000000e-04   ; <i1> [#uses=1]
  %tmp7071 = zext i1 %tmp70 to i8                 ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp7071, 0                ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb72

bb72:                                             ; preds = %bb65
  %tmp73 = load double* %number, align 8          ; <double> [#uses=1]
  store double %tmp73, double* %tmp, align 8
  %tmp74 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp74, double* %retval, align 8
  br label %return

return:                                           ; preds = %bb72
  %retval75 = load double* %retval                ; <double> [#uses=1]
  ret double %retval75
}

define void @defaultParam() {
entry:
  %i = alloca i32                                 ; <i32*> [#uses=9]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double 4.596000e+02, double* @tref, align 8
  store double 3.220000e+01, double* @g0d, align 8
  %tmp = load double* @g0d, align 8               ; <double> [#uses=1]
  store double %tmp, double* @g0, align 8
  store double 1.400000e+00, double* @gama, align 8
  store i32 0, i32* %i, align 4
  br label %bb13

bb:                                               ; preds = %bb13
  %tmp1 = load i32* %i, align 4                   ; <i32> [#uses=1]
  %tmp2 = getelementptr [20 x double]* @trat, i32 0, i32 %tmp1 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp2, align 8
  %tmp3 = load i32* %i, align 4                   ; <i32> [#uses=1]
  %tmp4 = getelementptr [20 x double]* @tt, i32 0, i32 %tmp3 ; <double*> [#uses=1]
  store double 5.186000e+02, double* %tmp4, align 8
  %tmp5 = load i32* %i, align 4                   ; <i32> [#uses=1]
  %tmp6 = getelementptr [20 x double]* @prat, i32 0, i32 %tmp5 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp6, align 8
  %tmp7 = load i32* %i, align 4                   ; <i32> [#uses=1]
  %tmp8 = getelementptr [20 x double]* @pt, i32 0, i32 %tmp7 ; <double*> [#uses=1]
  store double 1.470000e+01, double* %tmp8, align 8
  %tmp9 = load i32* %i, align 4                   ; <i32> [#uses=1]
  %tmp10 = getelementptr [20 x double]* @eta, i32 0, i32 %tmp9 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp10, align 8
  %tmp11 = load i32* %i, align 4                  ; <i32> [#uses=1]
  %tmp12 = add i32 %tmp11, 1                      ; <i32> [#uses=1]
  store i32 %tmp12, i32* %i, align 4
  br label %bb13

bb13:                                             ; preds = %bb, %entry
  %tmp14 = load i32* %i, align 4                  ; <i32> [#uses=1]
  %tmp15 = icmp sle i32 %tmp14, 19                ; <i1> [#uses=1]
  %tmp1516 = zext i1 %tmp15 to i8                 ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp1516, 0                ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb17

bb17:                                             ; preds = %bb13
  store double 2.500000e+03, double* @tt4d, align 8
  %tmp18 = load double* @tt4d, align 8            ; <double> [#uses=1]
  store double %tmp18, double* @tt4, align 8
  %tmp19 = load double* @tt4, align 8             ; <double> [#uses=1]
  %tmp20 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp19, double* %tmp20, align 8
  store double 2.500000e+03, double* @tt7d, align 8
  %tmp21 = load double* @tt7d, align 8            ; <double> [#uses=1]
  store double %tmp21, double* @tt7, align 8
  %tmp22 = load double* @tt7, align 8             ; <double> [#uses=1]
  %tmp23 = getelementptr [20 x double]* @tt, i32 0, i32 7 ; <double*> [#uses=1]
  store double %tmp22, double* %tmp23, align 8
  store double 8.000000e+00, double* @p3p2d, align 8
  %tmp24 = load double* @p3p2d, align 8           ; <double> [#uses=1]
  %tmp25 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp24, double* %tmp25, align 8
  store double 2.000000e+00, double* @p3fp2d, align 8
  %tmp26 = load double* @p3fp2d, align 8          ; <double> [#uses=1]
  %tmp27 = getelementptr [20 x double]* @prat, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp26, double* %tmp27, align 8
  store double 1.000000e+00, double* @byprat, align 8
  store double 0.000000e+00, double* @abflag, align 8
  store double 1.860000e+04, double* @fhv, align 8
  %tmp28 = load double* @fhv, align 8             ; <double> [#uses=1]
  store double %tmp28, double* @fhvd, align 8
  store double 2.000000e+00, double* @acore, align 8
  %tmp29 = load double* @acore, align 8           ; <double> [#uses=1]
  store double %tmp29, double* @a2, align 8
  %tmp30 = load double* @a2, align 8              ; <double> [#uses=1]
  %tmp31 = fmul double %tmp30, 9.000000e-01       ; <double> [#uses=1]
  store double %tmp31, double* @acap, align 8
  store double 3.500000e-01, double* @a8rat, align 8
  store double 7.000000e-01, double* @a8, align 8
  store double 4.000000e-01, double* @a8d, align 8
  store double 0.000000e+00, double* @arsched, align 8
  store double 2.000000e+00, double* @afan, align 8
  store double 4.180000e-01, double* @a4, align 8
  store double 0.000000e+00, double* @u0min, align 8
  store double 1.500000e+03, double* @u0max, align 8
  store double 0.000000e+00, double* @altmin, align 8
  store double 6.000000e+04, double* @altmax, align 8
  store double 3.000000e+01, double* @thrmin, align 8
  store double 1.000000e+02, double* @thrmax, align 8
  store double 5.000000e-01, double* @etmin, align 8
  store double 1.000000e+00, double* @etmax, align 8
  store double 1.000000e+00, double* @cprmin, align 8
  store double 5.000000e+01, double* @cprmax, align 8
  store double 0.000000e+00, double* @bypmin, align 8
  store double 1.000000e+01, double* @bypmax, align 8
  store double 1.000000e+00, double* @fprmin, align 8
  store double 2.000000e+00, double* @fprmax, align 8
  store double 1.000000e+03, double* @t4min, align 8
  store double 3.200000e+03, double* @t4max, align 8
  store double 1.000000e+03, double* @t7min, align 8
  store double 4.000000e+03, double* @t7max, align 8
  store double 4.000000e-01, double* @a8max, align 8
  store double 2.000000e+01, double* @pmax, align 8
  %tmp32 = load double* @tref, align 8            ; <double> [#uses=1]
  %tmp33 = fsub double %tmp32, 1.000000e+02       ; <double> [#uses=1]
  store double %tmp33, double* @tmin, align 8
  %tmp34 = load double* @tref, align 8            ; <double> [#uses=1]
  %tmp35 = fadd double %tmp34, 1.000000e+02       ; <double> [#uses=1]
  store double %tmp35, double* @tmax, align 8
  store double 1.000000e+03, double* @weight, align 8
  store double 2.930200e+02, double* @dfan, align 8
  store double 2.930200e+02, double* @dcomp, align 8
  store double 5.152000e+02, double* @dburner, align 8
  store double 5.152000e+02, double* @dturbin, align 8
  store double 5.152000e+02, double* @dnozl, align 8
  br label %return

return:                                           ; preds = %bb17
  ret void
}

define void @deduceInputs() {
entry:
  store double 1.718000e+03, double* @Rgas, align 8
  %tmp = load double* @altd, align 8              ; <double> [#uses=1]
  store double %tmp, double* @alt, align 8
  %tmp1 = load double* @alt, align 8              ; <double> [#uses=1]
  %tmp2 = fcmp olt double %tmp1, 3.615200e+04     ; <i1> [#uses=1]
  %tmp23 = zext i1 %tmp2 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp23, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb12

bb:                                               ; preds = %entry
  %tmp4 = load double* @alt, align 8              ; <double> [#uses=1]
  %tmp5 = fmul double %tmp4, 3.560000e+00         ; <double> [#uses=1]
  %tmp6 = fdiv double %tmp5, -1.000000e+03        ; <double> [#uses=1]
  %tmp7 = fadd double %tmp6, 5.186000e+02         ; <double> [#uses=1]
  store double %tmp7, double* @ts0, align 8
  %tmp8 = load double* @ts0, align 8              ; <double> [#uses=1]
  %tmp9 = fdiv double %tmp8, 5.186000e+02         ; <double> [#uses=1]
  %tmp10 = call double @fpow(double %tmp9, double 5.256000e+00) nounwind ; <double> [#uses=1]
  %tmp11 = fmul double %tmp10, 2.116000e+03       ; <double> [#uses=1]
  store double %tmp11, double* @ps0, align 8
  br label %bb12

bb12:                                             ; preds = %bb, %entry
  %tmp13 = load double* @alt, align 8             ; <double> [#uses=1]
  %tmp14 = fcmp oge double %tmp13, 3.615200e+04   ; <i1> [#uses=1]
  %tmp1415 = zext i1 %tmp14 to i8                 ; <i8> [#uses=1]
  %toBool16 = icmp ne i8 %tmp1415, 0              ; <i1> [#uses=1]
  br i1 %toBool16, label %bb17, label %bb29

bb17:                                             ; preds = %bb12
  %tmp18 = load double* @alt, align 8             ; <double> [#uses=1]
  %tmp19 = fcmp ole double %tmp18, 8.234500e+04   ; <i1> [#uses=1]
  %tmp1920 = zext i1 %tmp19 to i8                 ; <i8> [#uses=1]
  %toBool21 = icmp ne i8 %tmp1920, 0              ; <i1> [#uses=1]
  br i1 %toBool21, label %bb22, label %bb29

bb22:                                             ; preds = %bb17
  store double 3.899800e+02, double* @ts0, align 8
  %tmp24 = load double* @alt, align 8             ; <double> [#uses=1]
  %tmp25 = fsub double 3.600000e+04, %tmp24       ; <double> [#uses=1]
  %tmp26 = fdiv double %tmp25, 0x40D4515BB645A1CB ; <double> [#uses=1]
  %tmp27 = call double @expo(double %tmp26) nounwind ; <double> [#uses=1]
  %tmp28 = fmul double %tmp27, 0x407D92339C0EBEDF ; <double> [#uses=1]
  store double %tmp28, double* @ps0, align 8
  br label %bb29

bb29:                                             ; preds = %bb22, %bb17, %bb12
  %tmp30 = load double* @alt, align 8             ; <double> [#uses=1]
  %tmp31 = fcmp oge double %tmp30, 8.234500e+04   ; <i1> [#uses=1]
  %tmp3132 = zext i1 %tmp31 to i8                 ; <i8> [#uses=1]
  %toBool33 = icmp ne i8 %tmp3132, 0              ; <i1> [#uses=1]
  br i1 %toBool33, label %bb34, label %bb44

bb34:                                             ; preds = %bb29
  %tmp35 = load double* @alt, align 8             ; <double> [#uses=1]
  %tmp36 = fsub double %tmp35, 8.234500e+04       ; <double> [#uses=1]
  %tmp37 = fmul double %tmp36, 1.645000e+00       ; <double> [#uses=1]
  %tmp38 = fdiv double %tmp37, 1.000000e+03       ; <double> [#uses=1]
  %tmp39 = fadd double %tmp38, 3.899800e+02       ; <double> [#uses=1]
  store double %tmp39, double* @ts0, align 8
  %tmp40 = load double* @ts0, align 8             ; <double> [#uses=1]
  %tmp41 = fdiv double %tmp40, 3.899800e+02       ; <double> [#uses=1]
  %tmp42 = call double @fpow(double %tmp41, double -1.138800e+01) nounwind ; <double> [#uses=1]
  %tmp43 = fmul double %tmp42, 0x4049FC06E19B90EA ; <double> [#uses=1]
  store double %tmp43, double* @ps0, align 8
  br label %bb44

bb44:                                             ; preds = %bb34, %bb29
  %tmp45 = load double* @gama, align 8            ; <double> [#uses=1]
  %tmp46 = load double* @Rgas, align 8            ; <double> [#uses=1]
  %tmp47 = fmul double %tmp45, %tmp46             ; <double> [#uses=1]
  %tmp48 = load double* @ts0, align 8             ; <double> [#uses=1]
  %tmp49 = fmul double %tmp47, %tmp48             ; <double> [#uses=1]
  %tmp50 = call double @sqroot(double %tmp49) nounwind ; <double> [#uses=1]
  store double %tmp50, double* @a0, align 8
  %tmp51 = load double* @u0d, align 8             ; <double> [#uses=1]
  %tmp52 = fmul double %tmp51, 5.280000e+03       ; <double> [#uses=1]
  %tmp53 = fdiv double %tmp52, 3.600000e+03       ; <double> [#uses=1]
  store double %tmp53, double* @u0, align 8
  %tmp54 = load double* @u0, align 8              ; <double> [#uses=1]
  %tmp55 = load double* @a0, align 8              ; <double> [#uses=1]
  %tmp56 = fdiv double %tmp54, %tmp55             ; <double> [#uses=1]
  store double %tmp56, double* @fsmach, align 8
  %tmp57 = load double* @gama, align 8            ; <double> [#uses=1]
  %tmp58 = fdiv double %tmp57, 2.000000e+00       ; <double> [#uses=1]
  %tmp59 = load double* @fsmach, align 8          ; <double> [#uses=1]
  %tmp60 = fmul double %tmp58, %tmp59             ; <double> [#uses=1]
  %tmp61 = load double* @fsmach, align 8          ; <double> [#uses=1]
  %tmp62 = fmul double %tmp60, %tmp61             ; <double> [#uses=1]
  %tmp63 = load double* @ps0, align 8             ; <double> [#uses=1]
  %tmp64 = fmul double %tmp62, %tmp63             ; <double> [#uses=1]
  store double %tmp64, double* @q0, align 8
  %tmp65 = load double* @u0, align 8              ; <double> [#uses=1]
  %tmp66 = fcmp ogt double %tmp65, 1.000000e-04   ; <i1> [#uses=1]
  %tmp6667 = zext i1 %tmp66 to i8                 ; <i8> [#uses=1]
  %toBool68 = icmp ne i8 %tmp6667, 0              ; <i1> [#uses=1]
  br i1 %toBool68, label %bb69, label %bb75

bb69:                                             ; preds = %bb44
  %tmp70 = load double* @q0, align 8              ; <double> [#uses=1]
  %tmp71 = load double* @u0, align 8              ; <double> [#uses=1]
  %tmp72 = load double* @u0, align 8              ; <double> [#uses=1]
  %tmp73 = fmul double %tmp71, %tmp72             ; <double> [#uses=1]
  %tmp74 = fdiv double %tmp70, %tmp73             ; <double> [#uses=1]
  store double %tmp74, double* @rho0, align 8
  br label %bb76

bb75:                                             ; preds = %bb44
  store double 1.000000e+00, double* @rho0, align 8
  br label %bb76

bb76:                                             ; preds = %bb75, %bb69
  %tmp77 = load double* @gama, align 8            ; <double> [#uses=1]
  %tmp78 = fsub double %tmp77, 1.000000e+00       ; <double> [#uses=1]
  %tmp79 = fmul double %tmp78, 5.000000e-01       ; <double> [#uses=1]
  %tmp80 = load double* @fsmach, align 8          ; <double> [#uses=1]
  %tmp81 = fmul double %tmp79, %tmp80             ; <double> [#uses=1]
  %tmp82 = load double* @fsmach, align 8          ; <double> [#uses=1]
  %tmp83 = fmul double %tmp81, %tmp82             ; <double> [#uses=1]
  %tmp84 = fadd double %tmp83, 1.000000e+00       ; <double> [#uses=1]
  %tmp85 = load double* @ts0, align 8             ; <double> [#uses=1]
  %tmp86 = fmul double %tmp84, %tmp85             ; <double> [#uses=1]
  %tmp87 = getelementptr [20 x double]* @tt, i32 0, i32 0 ; <double*> [#uses=1]
  store double %tmp86, double* %tmp87, align 8
  %tmp88 = load double* @gama, align 8            ; <double> [#uses=1]
  %tmp89 = load double* @gama, align 8            ; <double> [#uses=1]
  %tmp90 = fsub double %tmp89, 1.000000e+00       ; <double> [#uses=1]
  %tmp91 = fdiv double %tmp88, %tmp90             ; <double> [#uses=1]
  %tmp92 = getelementptr [20 x double]* @tt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp93 = load double* %tmp92, align 8           ; <double> [#uses=1]
  %tmp94 = load double* @ts0, align 8             ; <double> [#uses=1]
  %tmp95 = fdiv double %tmp93, %tmp94             ; <double> [#uses=1]
  %tmp96 = call double @fpow(double %tmp95, double %tmp91) nounwind ; <double> [#uses=1]
  %tmp97 = load double* @ps0, align 8             ; <double> [#uses=1]
  %tmp98 = fmul double %tmp96, %tmp97             ; <double> [#uses=1]
  %tmp99 = getelementptr [20 x double]* @pt, i32 0, i32 0 ; <double*> [#uses=1]
  store double %tmp98, double* %tmp99, align 8
  %tmp100 = load double* @ps0, align 8            ; <double> [#uses=1]
  %tmp101 = fdiv double %tmp100, 1.440000e+02     ; <double> [#uses=1]
  store double %tmp101, double* @ps0, align 8
  %tmp102 = getelementptr [20 x double]* @pt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp103 = load double* %tmp102, align 8         ; <double> [#uses=1]
  %tmp104 = fdiv double %tmp103, 1.440000e+02     ; <double> [#uses=1]
  %tmp105 = getelementptr [20 x double]* @pt, i32 0, i32 0 ; <double*> [#uses=1]
  store double %tmp104, double* %tmp105, align 8
  %tmp106 = getelementptr [20 x double]* @tt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp107 = load double* %tmp106, align 8         ; <double> [#uses=1]
  %tmp108 = call double @getCp(double %tmp107) nounwind ; <double> [#uses=1]
  store double %tmp108, double* @cpair, align 8
  %tmp109 = load double* @ts0, align 8            ; <double> [#uses=1]
  %tmp110 = fsub double %tmp109, 4.596000e+02     ; <double> [#uses=1]
  store double %tmp110, double* @tsout, align 8
  %tmp111 = load double* @ps0, align 8            ; <double> [#uses=1]
  store double %tmp111, double* @psout, align 8
  br label %return

return:                                           ; preds = %bb76
  ret void
}

define void @getThermo() {
entry:
  %deltlt = alloca double, align 8                ; <double*> [#uses=2]
  %deltf = alloca double, align 8                 ; <double*> [#uses=2]
  %deltht = alloca double, align 8                ; <double*> [#uses=4]
  %deltc = alloca double, align 8                 ; <double*> [#uses=4]
  %delhlt = alloca double, align 8                ; <double*> [#uses=3]
  %delhf = alloca double, align 8                 ; <double*> [#uses=3]
  %delhht = alloca double, align 8                ; <double*> [#uses=6]
  %delhc = alloca double, align 8                 ; <double*> [#uses=6]
  %m5 = alloca double, align 8                    ; <double*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  %tmp = load double* @fsmach, align 8            ; <double> [#uses=1]
  %tmp1 = fcmp ogt double %tmp, 1.000000e+00      ; <i1> [#uses=1]
  %tmp12 = zext i1 %tmp1 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp12, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb9

bb:                                               ; preds = %entry
  %tmp3 = load double* @fsmach, align 8           ; <double> [#uses=1]
  %tmp4 = fsub double %tmp3, 1.000000e+00         ; <double> [#uses=1]
  %tmp5 = call double @fpow(double %tmp4, double 1.350000e+00) nounwind ; <double> [#uses=1]
  %tmp6 = fmul double %tmp5, -7.500000e-02        ; <double> [#uses=1]
  %tmp7 = fadd double %tmp6, 1.000000e+00         ; <double> [#uses=1]
  %tmp8 = getelementptr [20 x double]* @prat, i32 0, i32 2 ; <double*> [#uses=1]
  store double %tmp7, double* %tmp8, align 8
  br label %bb11

bb9:                                              ; preds = %entry
  %tmp10 = getelementptr [20 x double]* @prat, i32 0, i32 2 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp10, align 8
  br label %bb11

bb11:                                             ; preds = %bb9, %bb
  %tmp13 = getelementptr [20 x double]* @prat, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp14 = load double* %tmp13, align 8           ; <double> [#uses=1]
  %tmp15 = getelementptr [20 x double]* @eta, i32 0, i32 2 ; <double*> [#uses=1]
  store double %tmp14, double* %tmp15, align 8
  %tmp16 = getelementptr [20 x double]* @eta, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp17 = load double* %tmp16, align 8           ; <double> [#uses=1]
  %tmp18 = fcmp olt double %tmp17, 5.000000e-01   ; <i1> [#uses=1]
  %tmp1819 = zext i1 %tmp18 to i8                 ; <i8> [#uses=1]
  %toBool20 = icmp ne i8 %tmp1819, 0              ; <i1> [#uses=1]
  br i1 %toBool20, label %bb21, label %bb23

bb21:                                             ; preds = %bb11
  %tmp22 = getelementptr [20 x double]* @eta, i32 0, i32 3 ; <double*> [#uses=1]
  store double 5.000000e-01, double* %tmp22, align 8
  br label %bb23

bb23:                                             ; preds = %bb21, %bb11
  %tmp24 = getelementptr [20 x double]* @eta, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp25 = load double* %tmp24, align 8           ; <double> [#uses=1]
  %tmp26 = fcmp olt double %tmp25, 5.000000e-01   ; <i1> [#uses=1]
  %tmp2627 = zext i1 %tmp26 to i8                 ; <i8> [#uses=1]
  %toBool28 = icmp ne i8 %tmp2627, 0              ; <i1> [#uses=1]
  br i1 %toBool28, label %bb29, label %bb31

bb29:                                             ; preds = %bb23
  %tmp30 = getelementptr [20 x double]* @eta, i32 0, i32 5 ; <double*> [#uses=1]
  store double 5.000000e-01, double* %tmp30, align 8
  br label %bb31

bb31:                                             ; preds = %bb29, %bb23
  %tmp32 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp32, align 8
  %tmp33 = getelementptr [20 x double]* @prat, i32 0, i32 7 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp33, align 8
  %tmp34 = getelementptr [20 x double]* @tt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp35 = load double* %tmp34, align 8           ; <double> [#uses=1]
  %tmp36 = getelementptr [20 x double]* @tt, i32 0, i32 1 ; <double*> [#uses=1]
  store double %tmp35, double* %tmp36, align 8
  %tmp37 = getelementptr [20 x double]* @tt, i32 0, i32 1 ; <double*> [#uses=1]
  %tmp38 = load double* %tmp37, align 8           ; <double> [#uses=1]
  %tmp39 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  store double %tmp38, double* %tmp39, align 8
  %tmp40 = getelementptr [20 x double]* @pt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp41 = load double* %tmp40, align 8           ; <double> [#uses=1]
  %tmp42 = getelementptr [20 x double]* @pt, i32 0, i32 1 ; <double*> [#uses=1]
  store double %tmp41, double* %tmp42, align 8
  %tmp43 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp44 = load double* %tmp43, align 8           ; <double> [#uses=1]
  %tmp45 = call double @getGama(double %tmp44) nounwind ; <double> [#uses=1]
  %tmp46 = getelementptr [20 x double]* @gam, i32 0, i32 2 ; <double*> [#uses=1]
  store double %tmp45, double* %tmp46, align 8
  %tmp47 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp48 = load double* %tmp47, align 8           ; <double> [#uses=1]
  %tmp49 = call double @getCp(double %tmp48) nounwind ; <double> [#uses=1]
  %tmp50 = getelementptr [20 x double]* @cp, i32 0, i32 2 ; <double*> [#uses=1]
  store double %tmp49, double* %tmp50, align 8
  %tmp51 = getelementptr [20 x double]* @pt, i32 0, i32 1 ; <double*> [#uses=1]
  %tmp52 = load double* %tmp51, align 8           ; <double> [#uses=1]
  %tmp53 = getelementptr [20 x double]* @prat, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp54 = load double* %tmp53, align 8           ; <double> [#uses=1]
  %tmp55 = fmul double %tmp52, %tmp54             ; <double> [#uses=1]
  %tmp56 = getelementptr [20 x double]* @pt, i32 0, i32 2 ; <double*> [#uses=1]
  store double %tmp55, double* %tmp56, align 8
  %tmp57 = load i32* @engine, align 4             ; <i32> [#uses=1]
  %tmp58 = icmp sle i32 %tmp57, 2                 ; <i1> [#uses=1]
  %tmp5859 = zext i1 %tmp58 to i8                 ; <i8> [#uses=1]
  %toBool60 = icmp ne i8 %tmp5859, 0              ; <i1> [#uses=1]
  br i1 %toBool60, label %bb61, label %bb222

bb61:                                             ; preds = %bb31
  %tmp62 = load double* @p3p2d, align 8           ; <double> [#uses=1]
  %tmp63 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp62, double* %tmp63, align 8
  %tmp64 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp65 = load double* %tmp64, align 8           ; <double> [#uses=1]
  %tmp66 = fcmp olt double %tmp65, 5.000000e-01   ; <i1> [#uses=1]
  %tmp6667 = zext i1 %tmp66 to i8                 ; <i8> [#uses=1]
  %toBool68 = icmp ne i8 %tmp6667, 0              ; <i1> [#uses=1]
  br i1 %toBool68, label %bb69, label %bb71

bb69:                                             ; preds = %bb61
  %tmp70 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  store double 5.000000e-01, double* %tmp70, align 8
  br label %bb71

bb71:                                             ; preds = %bb69, %bb61
  %tmp72 = getelementptr [20 x double]* @cp, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp73 = load double* %tmp72, align 8           ; <double> [#uses=1]
  %tmp74 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp75 = load double* %tmp74, align 8           ; <double> [#uses=1]
  %tmp76 = fmul double %tmp73, %tmp75             ; <double> [#uses=1]
  %tmp77 = getelementptr [20 x double]* @eta, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp78 = load double* %tmp77, align 8           ; <double> [#uses=1]
  %tmp79 = fdiv double %tmp76, %tmp78             ; <double> [#uses=1]
  %tmp80 = getelementptr [20 x double]* @gam, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp81 = load double* %tmp80, align 8           ; <double> [#uses=1]
  %tmp82 = fsub double %tmp81, 1.000000e+00       ; <double> [#uses=1]
  %tmp83 = getelementptr [20 x double]* @gam, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp84 = load double* %tmp83, align 8           ; <double> [#uses=1]
  %tmp85 = fdiv double %tmp82, %tmp84             ; <double> [#uses=1]
  %tmp86 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp87 = load double* %tmp86, align 8           ; <double> [#uses=1]
  %tmp88 = call double @fpow(double %tmp87, double %tmp85) nounwind ; <double> [#uses=1]
  %tmp89 = fsub double %tmp88, 1.000000e+00       ; <double> [#uses=1]
  %tmp90 = fmul double %tmp79, %tmp89             ; <double> [#uses=1]
  store double %tmp90, double* %delhc, align 8
  %tmp91 = getelementptr [20 x double]* @cp, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp92 = load double* %tmp91, align 8           ; <double> [#uses=1]
  %tmp93 = load double* %delhc, align 8           ; <double> [#uses=1]
  %tmp94 = fdiv double %tmp93, %tmp92             ; <double> [#uses=1]
  store double %tmp94, double* %deltc, align 8
  %tmp95 = getelementptr [20 x double]* @pt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp96 = load double* %tmp95, align 8           ; <double> [#uses=1]
  %tmp97 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp98 = load double* %tmp97, align 8           ; <double> [#uses=1]
  %tmp99 = fmul double %tmp96, %tmp98             ; <double> [#uses=1]
  %tmp100 = getelementptr [20 x double]* @pt, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp99, double* %tmp100, align 8
  %tmp101 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp102 = load double* %tmp101, align 8         ; <double> [#uses=1]
  %tmp103 = load double* %deltc, align 8          ; <double> [#uses=1]
  %tmp104 = fadd double %tmp102, %tmp103          ; <double> [#uses=1]
  %tmp105 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp104, double* %tmp105, align 8
  %tmp106 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp107 = load double* %tmp106, align 8         ; <double> [#uses=1]
  %tmp108 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp109 = load double* %tmp108, align 8         ; <double> [#uses=1]
  %tmp110 = fdiv double %tmp107, %tmp109          ; <double> [#uses=1]
  %tmp111 = getelementptr [20 x double]* @trat, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp110, double* %tmp111, align 8
  %tmp112 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp113 = load double* %tmp112, align 8         ; <double> [#uses=1]
  %tmp114 = call double @getGama(double %tmp113) nounwind ; <double> [#uses=1]
  %tmp115 = getelementptr [20 x double]* @gam, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp114, double* %tmp115, align 8
  %tmp116 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp117 = load double* %tmp116, align 8         ; <double> [#uses=1]
  %tmp118 = call double @getCp(double %tmp117) nounwind ; <double> [#uses=1]
  %tmp119 = getelementptr [20 x double]* @cp, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp118, double* %tmp119, align 8
  %tmp120 = load double* @tt4, align 8            ; <double> [#uses=1]
  %tmp121 = load double* @throtl, align 8         ; <double> [#uses=1]
  %tmp122 = fmul double %tmp120, %tmp121          ; <double> [#uses=1]
  %tmp123 = fdiv double %tmp122, 1.000000e+02     ; <double> [#uses=1]
  %tmp124 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp123, double* %tmp124, align 8
  %tmp125 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp126 = load double* %tmp125, align 8         ; <double> [#uses=1]
  %tmp127 = call double @getGama(double %tmp126) nounwind ; <double> [#uses=1]
  %tmp128 = getelementptr [20 x double]* @gam, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp127, double* %tmp128, align 8
  %tmp129 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp130 = load double* %tmp129, align 8         ; <double> [#uses=1]
  %tmp131 = call double @getCp(double %tmp130) nounwind ; <double> [#uses=1]
  %tmp132 = getelementptr [20 x double]* @cp, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp131, double* %tmp132, align 8
  %tmp133 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp134 = load double* %tmp133, align 8         ; <double> [#uses=1]
  %tmp135 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp136 = load double* %tmp135, align 8         ; <double> [#uses=1]
  %tmp137 = fdiv double %tmp134, %tmp136          ; <double> [#uses=1]
  %tmp138 = getelementptr [20 x double]* @trat, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp137, double* %tmp138, align 8
  %tmp139 = getelementptr [20 x double]* @pt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp140 = load double* %tmp139, align 8         ; <double> [#uses=1]
  %tmp141 = getelementptr [20 x double]* @prat, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp142 = load double* %tmp141, align 8         ; <double> [#uses=1]
  %tmp143 = fmul double %tmp140, %tmp142          ; <double> [#uses=1]
  %tmp144 = getelementptr [20 x double]* @pt, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp143, double* %tmp144, align 8
  %tmp145 = load double* %delhc, align 8          ; <double> [#uses=1]
  store double %tmp145, double* %delhht, align 8
  %tmp146 = getelementptr [20 x double]* @cp, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp147 = load double* %tmp146, align 8         ; <double> [#uses=1]
  %tmp148 = load double* %delhht, align 8         ; <double> [#uses=1]
  %tmp149 = fdiv double %tmp148, %tmp147          ; <double> [#uses=1]
  store double %tmp149, double* %deltht, align 8
  %tmp150 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp151 = load double* %tmp150, align 8         ; <double> [#uses=1]
  %tmp152 = load double* %deltht, align 8         ; <double> [#uses=1]
  %tmp153 = fsub double %tmp151, %tmp152          ; <double> [#uses=1]
  %tmp154 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp153, double* %tmp154, align 8
  %tmp155 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp156 = load double* %tmp155, align 8         ; <double> [#uses=1]
  %tmp157 = call double @getGama(double %tmp156) nounwind ; <double> [#uses=1]
  %tmp158 = getelementptr [20 x double]* @gam, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp157, double* %tmp158, align 8
  %tmp159 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp160 = load double* %tmp159, align 8         ; <double> [#uses=1]
  %tmp161 = call double @getCp(double %tmp160) nounwind ; <double> [#uses=1]
  %tmp162 = getelementptr [20 x double]* @cp, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp161, double* %tmp162, align 8
  %tmp163 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp164 = load double* %tmp163, align 8         ; <double> [#uses=1]
  %tmp165 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp166 = load double* %tmp165, align 8         ; <double> [#uses=1]
  %tmp167 = fdiv double %tmp164, %tmp166          ; <double> [#uses=1]
  %tmp168 = getelementptr [20 x double]* @trat, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp167, double* %tmp168, align 8
  %tmp169 = getelementptr [20 x double]* @gam, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp170 = load double* %tmp169, align 8         ; <double> [#uses=1]
  %tmp171 = getelementptr [20 x double]* @gam, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp172 = load double* %tmp171, align 8         ; <double> [#uses=1]
  %tmp173 = fsub double %tmp172, 1.000000e+00     ; <double> [#uses=1]
  %tmp174 = fdiv double %tmp170, %tmp173          ; <double> [#uses=1]
  %tmp175 = getelementptr [20 x double]* @cp, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp176 = load double* %tmp175, align 8         ; <double> [#uses=1]
  %tmp177 = load double* %delhht, align 8         ; <double> [#uses=1]
  %tmp178 = fdiv double %tmp177, %tmp176          ; <double> [#uses=1]
  %tmp179 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp180 = load double* %tmp179, align 8         ; <double> [#uses=1]
  %tmp181 = fdiv double %tmp178, %tmp180          ; <double> [#uses=1]
  %tmp182 = getelementptr [20 x double]* @eta, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp183 = load double* %tmp182, align 8         ; <double> [#uses=1]
  %tmp184 = fdiv double %tmp181, %tmp183          ; <double> [#uses=1]
  %tmp185 = fsub double 1.000000e+00, %tmp184     ; <double> [#uses=1]
  %tmp186 = call double @fpow(double %tmp185, double %tmp174) nounwind ; <double> [#uses=1]
  %tmp187 = getelementptr [20 x double]* @prat, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp186, double* %tmp187, align 8
  %tmp188 = getelementptr [20 x double]* @pt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp189 = load double* %tmp188, align 8         ; <double> [#uses=1]
  %tmp190 = getelementptr [20 x double]* @prat, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp191 = load double* %tmp190, align 8         ; <double> [#uses=1]
  %tmp192 = fmul double %tmp189, %tmp191          ; <double> [#uses=1]
  %tmp193 = getelementptr [20 x double]* @pt, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp192, double* %tmp193, align 8
  %tmp194 = getelementptr [20 x double]* @prat, i32 0, i32 13 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp194, align 8
  %tmp195 = getelementptr [20 x double]* @trat, i32 0, i32 13 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp195, align 8
  %tmp196 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp197 = load double* %tmp196, align 8         ; <double> [#uses=1]
  %tmp198 = getelementptr [20 x double]* @tt, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp197, double* %tmp198, align 8
  %tmp199 = getelementptr [20 x double]* @pt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp200 = load double* %tmp199, align 8         ; <double> [#uses=1]
  %tmp201 = getelementptr [20 x double]* @pt, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp200, double* %tmp201, align 8
  %tmp202 = getelementptr [20 x double]* @gam, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp203 = load double* %tmp202, align 8         ; <double> [#uses=1]
  %tmp204 = getelementptr [20 x double]* @gam, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp203, double* %tmp204, align 8
  %tmp205 = getelementptr [20 x double]* @cp, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp206 = load double* %tmp205, align 8         ; <double> [#uses=1]
  %tmp207 = getelementptr [20 x double]* @cp, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp206, double* %tmp207, align 8
  %tmp208 = getelementptr [20 x double]* @prat, i32 0, i32 15 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp208, align 8
  %tmp209 = getelementptr [20 x double]* @pt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp210 = load double* %tmp209, align 8         ; <double> [#uses=1]
  %tmp211 = getelementptr [20 x double]* @pt, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp210, double* %tmp211, align 8
  %tmp212 = getelementptr [20 x double]* @trat, i32 0, i32 15 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp212, align 8
  %tmp213 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp214 = load double* %tmp213, align 8         ; <double> [#uses=1]
  %tmp215 = getelementptr [20 x double]* @tt, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp214, double* %tmp215, align 8
  %tmp216 = getelementptr [20 x double]* @gam, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp217 = load double* %tmp216, align 8         ; <double> [#uses=1]
  %tmp218 = getelementptr [20 x double]* @gam, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp217, double* %tmp218, align 8
  %tmp219 = getelementptr [20 x double]* @cp, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp220 = load double* %tmp219, align 8         ; <double> [#uses=1]
  %tmp221 = getelementptr [20 x double]* @cp, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp220, double* %tmp221, align 8
  br label %bb222

bb222:                                            ; preds = %bb71, %bb31
  %tmp223 = load i32* @engine, align 4            ; <i32> [#uses=1]
  %tmp224 = icmp eq i32 %tmp223, 3                ; <i1> [#uses=1]
  %tmp224225 = zext i1 %tmp224 to i8              ; <i8> [#uses=1]
  %toBool226 = icmp ne i8 %tmp224225, 0           ; <i1> [#uses=1]
  br i1 %toBool226, label %bb227, label %bb470

bb227:                                            ; preds = %bb222
  %tmp228 = load double* @p3fp2d, align 8         ; <double> [#uses=1]
  %tmp229 = getelementptr [20 x double]* @prat, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp228, double* %tmp229, align 8
  %tmp230 = getelementptr [20 x double]* @prat, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp231 = load double* %tmp230, align 8         ; <double> [#uses=1]
  %tmp232 = fcmp olt double %tmp231, 5.000000e-01 ; <i1> [#uses=1]
  %tmp232233 = zext i1 %tmp232 to i8              ; <i8> [#uses=1]
  %toBool234 = icmp ne i8 %tmp232233, 0           ; <i1> [#uses=1]
  br i1 %toBool234, label %bb235, label %bb237

bb235:                                            ; preds = %bb227
  %tmp236 = getelementptr [20 x double]* @prat, i32 0, i32 13 ; <double*> [#uses=1]
  store double 5.000000e-01, double* %tmp236, align 8
  br label %bb237

bb237:                                            ; preds = %bb235, %bb227
  %tmp238 = getelementptr [20 x double]* @cp, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp239 = load double* %tmp238, align 8         ; <double> [#uses=1]
  %tmp240 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp241 = load double* %tmp240, align 8         ; <double> [#uses=1]
  %tmp242 = fmul double %tmp239, %tmp241          ; <double> [#uses=1]
  %tmp243 = getelementptr [20 x double]* @eta, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp244 = load double* %tmp243, align 8         ; <double> [#uses=1]
  %tmp245 = fdiv double %tmp242, %tmp244          ; <double> [#uses=1]
  %tmp246 = getelementptr [20 x double]* @gam, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp247 = load double* %tmp246, align 8         ; <double> [#uses=1]
  %tmp248 = fsub double %tmp247, 1.000000e+00     ; <double> [#uses=1]
  %tmp249 = getelementptr [20 x double]* @gam, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp250 = load double* %tmp249, align 8         ; <double> [#uses=1]
  %tmp251 = fdiv double %tmp248, %tmp250          ; <double> [#uses=1]
  %tmp252 = getelementptr [20 x double]* @prat, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp253 = load double* %tmp252, align 8         ; <double> [#uses=1]
  %tmp254 = call double @fpow(double %tmp253, double %tmp251) nounwind ; <double> [#uses=1]
  %tmp255 = fsub double %tmp254, 1.000000e+00     ; <double> [#uses=1]
  %tmp256 = fmul double %tmp245, %tmp255          ; <double> [#uses=1]
  store double %tmp256, double* %delhf, align 8
  %tmp257 = getelementptr [20 x double]* @cp, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp258 = load double* %tmp257, align 8         ; <double> [#uses=1]
  %tmp259 = load double* %delhf, align 8          ; <double> [#uses=1]
  %tmp260 = fdiv double %tmp259, %tmp258          ; <double> [#uses=1]
  store double %tmp260, double* %deltf, align 8
  %tmp261 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp262 = load double* %tmp261, align 8         ; <double> [#uses=1]
  %tmp263 = load double* %deltf, align 8          ; <double> [#uses=1]
  %tmp264 = fadd double %tmp262, %tmp263          ; <double> [#uses=1]
  %tmp265 = getelementptr [20 x double]* @tt, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp264, double* %tmp265, align 8
  %tmp266 = getelementptr [20 x double]* @pt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp267 = load double* %tmp266, align 8         ; <double> [#uses=1]
  %tmp268 = getelementptr [20 x double]* @prat, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp269 = load double* %tmp268, align 8         ; <double> [#uses=1]
  %tmp270 = fmul double %tmp267, %tmp269          ; <double> [#uses=1]
  %tmp271 = getelementptr [20 x double]* @pt, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp270, double* %tmp271, align 8
  %tmp272 = getelementptr [20 x double]* @tt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp273 = load double* %tmp272, align 8         ; <double> [#uses=1]
  %tmp274 = getelementptr [20 x double]* @tt, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp275 = load double* %tmp274, align 8         ; <double> [#uses=1]
  %tmp276 = fdiv double %tmp273, %tmp275          ; <double> [#uses=1]
  %tmp277 = getelementptr [20 x double]* @trat, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp276, double* %tmp277, align 8
  %tmp278 = getelementptr [20 x double]* @tt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp279 = load double* %tmp278, align 8         ; <double> [#uses=1]
  %tmp280 = call double @getGama(double %tmp279) nounwind ; <double> [#uses=1]
  %tmp281 = getelementptr [20 x double]* @gam, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp280, double* %tmp281, align 8
  %tmp282 = getelementptr [20 x double]* @tt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp283 = load double* %tmp282, align 8         ; <double> [#uses=1]
  %tmp284 = call double @getCp(double %tmp283) nounwind ; <double> [#uses=1]
  %tmp285 = getelementptr [20 x double]* @cp, i32 0, i32 13 ; <double*> [#uses=1]
  store double %tmp284, double* %tmp285, align 8
  %tmp286 = load double* @p3p2d, align 8          ; <double> [#uses=1]
  %tmp287 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp286, double* %tmp287, align 8
  %tmp288 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp289 = load double* %tmp288, align 8         ; <double> [#uses=1]
  %tmp290 = fcmp olt double %tmp289, 5.000000e-01 ; <i1> [#uses=1]
  %tmp290291 = zext i1 %tmp290 to i8              ; <i8> [#uses=1]
  %toBool292 = icmp ne i8 %tmp290291, 0           ; <i1> [#uses=1]
  br i1 %toBool292, label %bb293, label %bb295

bb293:                                            ; preds = %bb237
  %tmp294 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  store double 5.000000e-01, double* %tmp294, align 8
  br label %bb295

bb295:                                            ; preds = %bb293, %bb237
  %tmp296 = getelementptr [20 x double]* @cp, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp297 = load double* %tmp296, align 8         ; <double> [#uses=1]
  %tmp298 = getelementptr [20 x double]* @tt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp299 = load double* %tmp298, align 8         ; <double> [#uses=1]
  %tmp300 = fmul double %tmp297, %tmp299          ; <double> [#uses=1]
  %tmp301 = getelementptr [20 x double]* @eta, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp302 = load double* %tmp301, align 8         ; <double> [#uses=1]
  %tmp303 = fdiv double %tmp300, %tmp302          ; <double> [#uses=1]
  %tmp304 = getelementptr [20 x double]* @gam, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp305 = load double* %tmp304, align 8         ; <double> [#uses=1]
  %tmp306 = fsub double %tmp305, 1.000000e+00     ; <double> [#uses=1]
  %tmp307 = getelementptr [20 x double]* @gam, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp308 = load double* %tmp307, align 8         ; <double> [#uses=1]
  %tmp309 = fdiv double %tmp306, %tmp308          ; <double> [#uses=1]
  %tmp310 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp311 = load double* %tmp310, align 8         ; <double> [#uses=1]
  %tmp312 = call double @fpow(double %tmp311, double %tmp309) nounwind ; <double> [#uses=1]
  %tmp313 = fsub double %tmp312, 1.000000e+00     ; <double> [#uses=1]
  %tmp314 = fmul double %tmp303, %tmp313          ; <double> [#uses=1]
  store double %tmp314, double* %delhc, align 8
  %tmp315 = getelementptr [20 x double]* @cp, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp316 = load double* %tmp315, align 8         ; <double> [#uses=1]
  %tmp317 = load double* %delhc, align 8          ; <double> [#uses=1]
  %tmp318 = fdiv double %tmp317, %tmp316          ; <double> [#uses=1]
  store double %tmp318, double* %deltc, align 8
  %tmp319 = getelementptr [20 x double]* @tt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp320 = load double* %tmp319, align 8         ; <double> [#uses=1]
  %tmp321 = load double* %deltc, align 8          ; <double> [#uses=1]
  %tmp322 = fadd double %tmp320, %tmp321          ; <double> [#uses=1]
  %tmp323 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp322, double* %tmp323, align 8
  %tmp324 = getelementptr [20 x double]* @pt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp325 = load double* %tmp324, align 8         ; <double> [#uses=1]
  %tmp326 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp327 = load double* %tmp326, align 8         ; <double> [#uses=1]
  %tmp328 = fmul double %tmp325, %tmp327          ; <double> [#uses=1]
  %tmp329 = getelementptr [20 x double]* @pt, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp328, double* %tmp329, align 8
  %tmp330 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp331 = load double* %tmp330, align 8         ; <double> [#uses=1]
  %tmp332 = getelementptr [20 x double]* @tt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp333 = load double* %tmp332, align 8         ; <double> [#uses=1]
  %tmp334 = fdiv double %tmp331, %tmp333          ; <double> [#uses=1]
  %tmp335 = getelementptr [20 x double]* @trat, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp334, double* %tmp335, align 8
  %tmp336 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp337 = load double* %tmp336, align 8         ; <double> [#uses=1]
  %tmp338 = call double @getGama(double %tmp337) nounwind ; <double> [#uses=1]
  %tmp339 = getelementptr [20 x double]* @gam, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp338, double* %tmp339, align 8
  %tmp340 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp341 = load double* %tmp340, align 8         ; <double> [#uses=1]
  %tmp342 = call double @getCp(double %tmp341) nounwind ; <double> [#uses=1]
  %tmp343 = getelementptr [20 x double]* @cp, i32 0, i32 3 ; <double*> [#uses=1]
  store double %tmp342, double* %tmp343, align 8
  %tmp344 = load double* @tt4, align 8            ; <double> [#uses=1]
  %tmp345 = load double* @throtl, align 8         ; <double> [#uses=1]
  %tmp346 = fmul double %tmp344, %tmp345          ; <double> [#uses=1]
  %tmp347 = fdiv double %tmp346, 1.000000e+02     ; <double> [#uses=1]
  %tmp348 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp347, double* %tmp348, align 8
  %tmp349 = getelementptr [20 x double]* @pt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp350 = load double* %tmp349, align 8         ; <double> [#uses=1]
  %tmp351 = getelementptr [20 x double]* @prat, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp352 = load double* %tmp351, align 8         ; <double> [#uses=1]
  %tmp353 = fmul double %tmp350, %tmp352          ; <double> [#uses=1]
  %tmp354 = getelementptr [20 x double]* @pt, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp353, double* %tmp354, align 8
  %tmp355 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp356 = load double* %tmp355, align 8         ; <double> [#uses=1]
  %tmp357 = call double @getGama(double %tmp356) nounwind ; <double> [#uses=1]
  %tmp358 = getelementptr [20 x double]* @gam, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp357, double* %tmp358, align 8
  %tmp359 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp360 = load double* %tmp359, align 8         ; <double> [#uses=1]
  %tmp361 = call double @getCp(double %tmp360) nounwind ; <double> [#uses=1]
  %tmp362 = getelementptr [20 x double]* @cp, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp361, double* %tmp362, align 8
  %tmp363 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp364 = load double* %tmp363, align 8         ; <double> [#uses=1]
  %tmp365 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp366 = load double* %tmp365, align 8         ; <double> [#uses=1]
  %tmp367 = fdiv double %tmp364, %tmp366          ; <double> [#uses=1]
  %tmp368 = getelementptr [20 x double]* @trat, i32 0, i32 4 ; <double*> [#uses=1]
  store double %tmp367, double* %tmp368, align 8
  %tmp369 = load double* %delhc, align 8          ; <double> [#uses=1]
  store double %tmp369, double* %delhht, align 8
  %tmp370 = getelementptr [20 x double]* @cp, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp371 = load double* %tmp370, align 8         ; <double> [#uses=1]
  %tmp372 = load double* %delhht, align 8         ; <double> [#uses=1]
  %tmp373 = fdiv double %tmp372, %tmp371          ; <double> [#uses=1]
  store double %tmp373, double* %deltht, align 8
  %tmp374 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp375 = load double* %tmp374, align 8         ; <double> [#uses=1]
  %tmp376 = load double* %deltht, align 8         ; <double> [#uses=1]
  %tmp377 = fsub double %tmp375, %tmp376          ; <double> [#uses=1]
  %tmp378 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp377, double* %tmp378, align 8
  %tmp379 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp380 = load double* %tmp379, align 8         ; <double> [#uses=1]
  %tmp381 = call double @getGama(double %tmp380) nounwind ; <double> [#uses=1]
  %tmp382 = getelementptr [20 x double]* @gam, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp381, double* %tmp382, align 8
  %tmp383 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp384 = load double* %tmp383, align 8         ; <double> [#uses=1]
  %tmp385 = call double @getCp(double %tmp384) nounwind ; <double> [#uses=1]
  %tmp386 = getelementptr [20 x double]* @cp, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp385, double* %tmp386, align 8
  %tmp387 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp388 = load double* %tmp387, align 8         ; <double> [#uses=1]
  %tmp389 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp390 = load double* %tmp389, align 8         ; <double> [#uses=1]
  %tmp391 = fdiv double %tmp388, %tmp390          ; <double> [#uses=1]
  %tmp392 = getelementptr [20 x double]* @trat, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp391, double* %tmp392, align 8
  %tmp393 = getelementptr [20 x double]* @gam, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp394 = load double* %tmp393, align 8         ; <double> [#uses=1]
  %tmp395 = getelementptr [20 x double]* @gam, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp396 = load double* %tmp395, align 8         ; <double> [#uses=1]
  %tmp397 = fsub double %tmp396, 1.000000e+00     ; <double> [#uses=1]
  %tmp398 = fdiv double %tmp394, %tmp397          ; <double> [#uses=1]
  %tmp399 = getelementptr [20 x double]* @cp, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp400 = load double* %tmp399, align 8         ; <double> [#uses=1]
  %tmp401 = load double* %delhht, align 8         ; <double> [#uses=1]
  %tmp402 = fdiv double %tmp401, %tmp400          ; <double> [#uses=1]
  %tmp403 = getelementptr [20 x double]* @tt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp404 = load double* %tmp403, align 8         ; <double> [#uses=1]
  %tmp405 = fdiv double %tmp402, %tmp404          ; <double> [#uses=1]
  %tmp406 = getelementptr [20 x double]* @eta, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp407 = load double* %tmp406, align 8         ; <double> [#uses=1]
  %tmp408 = fdiv double %tmp405, %tmp407          ; <double> [#uses=1]
  %tmp409 = fsub double 1.000000e+00, %tmp408     ; <double> [#uses=1]
  %tmp410 = call double @fpow(double %tmp409, double %tmp398) nounwind ; <double> [#uses=1]
  %tmp411 = getelementptr [20 x double]* @prat, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp410, double* %tmp411, align 8
  %tmp412 = getelementptr [20 x double]* @pt, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp413 = load double* %tmp412, align 8         ; <double> [#uses=1]
  %tmp414 = getelementptr [20 x double]* @prat, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp415 = load double* %tmp414, align 8         ; <double> [#uses=1]
  %tmp416 = fmul double %tmp413, %tmp415          ; <double> [#uses=1]
  %tmp417 = getelementptr [20 x double]* @pt, i32 0, i32 5 ; <double*> [#uses=1]
  store double %tmp416, double* %tmp417, align 8
  %tmp418 = load double* @byprat, align 8         ; <double> [#uses=1]
  %tmp419 = fadd double %tmp418, 1.000000e+00     ; <double> [#uses=1]
  %tmp420 = load double* %delhf, align 8          ; <double> [#uses=1]
  %tmp421 = fmul double %tmp419, %tmp420          ; <double> [#uses=1]
  store double %tmp421, double* %delhlt, align 8
  %tmp422 = getelementptr [20 x double]* @cp, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp423 = load double* %tmp422, align 8         ; <double> [#uses=1]
  %tmp424 = load double* %delhlt, align 8         ; <double> [#uses=1]
  %tmp425 = fdiv double %tmp424, %tmp423          ; <double> [#uses=1]
  store double %tmp425, double* %deltlt, align 8
  %tmp426 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp427 = load double* %tmp426, align 8         ; <double> [#uses=1]
  %tmp428 = load double* %deltlt, align 8         ; <double> [#uses=1]
  %tmp429 = fsub double %tmp427, %tmp428          ; <double> [#uses=1]
  %tmp430 = getelementptr [20 x double]* @tt, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp429, double* %tmp430, align 8
  %tmp431 = getelementptr [20 x double]* @tt, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp432 = load double* %tmp431, align 8         ; <double> [#uses=1]
  %tmp433 = call double @getGama(double %tmp432) nounwind ; <double> [#uses=1]
  %tmp434 = getelementptr [20 x double]* @gam, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp433, double* %tmp434, align 8
  %tmp435 = getelementptr [20 x double]* @tt, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp436 = load double* %tmp435, align 8         ; <double> [#uses=1]
  %tmp437 = call double @getCp(double %tmp436) nounwind ; <double> [#uses=1]
  %tmp438 = getelementptr [20 x double]* @cp, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp437, double* %tmp438, align 8
  %tmp439 = getelementptr [20 x double]* @tt, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp440 = load double* %tmp439, align 8         ; <double> [#uses=1]
  %tmp441 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp442 = load double* %tmp441, align 8         ; <double> [#uses=1]
  %tmp443 = fdiv double %tmp440, %tmp442          ; <double> [#uses=1]
  %tmp444 = getelementptr [20 x double]* @trat, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp443, double* %tmp444, align 8
  %tmp445 = getelementptr [20 x double]* @gam, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp446 = load double* %tmp445, align 8         ; <double> [#uses=1]
  %tmp447 = getelementptr [20 x double]* @gam, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp448 = load double* %tmp447, align 8         ; <double> [#uses=1]
  %tmp449 = fsub double %tmp448, 1.000000e+00     ; <double> [#uses=1]
  %tmp450 = fdiv double %tmp446, %tmp449          ; <double> [#uses=1]
  %tmp451 = getelementptr [20 x double]* @cp, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp452 = load double* %tmp451, align 8         ; <double> [#uses=1]
  %tmp453 = load double* %delhlt, align 8         ; <double> [#uses=1]
  %tmp454 = fdiv double %tmp453, %tmp452          ; <double> [#uses=1]
  %tmp455 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp456 = load double* %tmp455, align 8         ; <double> [#uses=1]
  %tmp457 = fdiv double %tmp454, %tmp456          ; <double> [#uses=1]
  %tmp458 = getelementptr [20 x double]* @eta, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp459 = load double* %tmp458, align 8         ; <double> [#uses=1]
  %tmp460 = fdiv double %tmp457, %tmp459          ; <double> [#uses=1]
  %tmp461 = fsub double 1.000000e+00, %tmp460     ; <double> [#uses=1]
  %tmp462 = call double @fpow(double %tmp461, double %tmp450) nounwind ; <double> [#uses=1]
  %tmp463 = getelementptr [20 x double]* @prat, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp462, double* %tmp463, align 8
  %tmp464 = getelementptr [20 x double]* @pt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp465 = load double* %tmp464, align 8         ; <double> [#uses=1]
  %tmp466 = getelementptr [20 x double]* @prat, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp467 = load double* %tmp466, align 8         ; <double> [#uses=1]
  %tmp468 = fmul double %tmp465, %tmp467          ; <double> [#uses=1]
  %tmp469 = getelementptr [20 x double]* @pt, i32 0, i32 15 ; <double*> [#uses=1]
  store double %tmp468, double* %tmp469, align 8
  br label %bb470

bb470:                                            ; preds = %bb295, %bb222
  %tmp471 = load double* @tt7, align 8            ; <double> [#uses=1]
  %tmp472 = getelementptr [20 x double]* @tt, i32 0, i32 7 ; <double*> [#uses=1]
  store double %tmp471, double* %tmp472, align 8
  %tmp473 = getelementptr [20 x double]* @prat, i32 0, i32 6 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp473, align 8
  %tmp474 = getelementptr [20 x double]* @pt, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp475 = load double* %tmp474, align 8         ; <double> [#uses=1]
  %tmp476 = getelementptr [20 x double]* @pt, i32 0, i32 6 ; <double*> [#uses=1]
  store double %tmp475, double* %tmp476, align 8
  %tmp477 = getelementptr [20 x double]* @trat, i32 0, i32 6 ; <double*> [#uses=1]
  store double 1.000000e+00, double* %tmp477, align 8
  %tmp478 = getelementptr [20 x double]* @tt, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp479 = load double* %tmp478, align 8         ; <double> [#uses=1]
  %tmp480 = getelementptr [20 x double]* @tt, i32 0, i32 6 ; <double*> [#uses=1]
  store double %tmp479, double* %tmp480, align 8
  %tmp481 = getelementptr [20 x double]* @tt, i32 0, i32 6 ; <double*> [#uses=1]
  %tmp482 = load double* %tmp481, align 8         ; <double> [#uses=1]
  %tmp483 = call double @getGama(double %tmp482) nounwind ; <double> [#uses=1]
  %tmp484 = getelementptr [20 x double]* @gam, i32 0, i32 6 ; <double*> [#uses=1]
  store double %tmp483, double* %tmp484, align 8
  %tmp485 = getelementptr [20 x double]* @tt, i32 0, i32 6 ; <double*> [#uses=1]
  %tmp486 = load double* %tmp485, align 8         ; <double> [#uses=1]
  %tmp487 = call double @getCp(double %tmp486) nounwind ; <double> [#uses=1]
  %tmp488 = getelementptr [20 x double]* @cp, i32 0, i32 6 ; <double*> [#uses=1]
  store double %tmp487, double* %tmp488, align 8
  %tmp489 = load double* @abflag, align 8         ; <double> [#uses=1]
  %tmp490 = fcmp ogt double %tmp489, 0.000000e+00 ; <i1> [#uses=1]
  %tmp490491 = zext i1 %tmp490 to i8              ; <i8> [#uses=1]
  %toBool492 = icmp ne i8 %tmp490491, 0           ; <i1> [#uses=1]
  br i1 %toBool492, label %bb493, label %bb517

bb493:                                            ; preds = %bb470
  %tmp494 = getelementptr [20 x double]* @tt, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp495 = load double* %tmp494, align 8         ; <double> [#uses=1]
  %tmp496 = getelementptr [20 x double]* @tt, i32 0, i32 6 ; <double*> [#uses=1]
  %tmp497 = load double* %tmp496, align 8         ; <double> [#uses=1]
  %tmp498 = fdiv double %tmp495, %tmp497          ; <double> [#uses=1]
  %tmp499 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  store double %tmp498, double* %tmp499, align 8
  %tmp500 = getelementptr [20 x double]* @gam, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp501 = load double* %tmp500, align 8         ; <double> [#uses=1]
  %tmp502 = getelementptr [20 x double]* @gam, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp503 = load double* %tmp502, align 8         ; <double> [#uses=1]
  %tmp504 = call double @getAir(double 1.000000e+00, double %tmp503) nounwind ; <double> [#uses=1]
  %tmp505 = load double* @a4, align 8             ; <double> [#uses=1]
  %tmp506 = fmul double %tmp504, %tmp505          ; <double> [#uses=1]
  %tmp507 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp508 = fdiv double %tmp506, %tmp507          ; <double> [#uses=1]
  %tmp509 = call double @getMach(i32 0, double %tmp508, double %tmp501) nounwind ; <double> [#uses=1]
  store double %tmp509, double* %m5, align 8
  %tmp510 = getelementptr [20 x double]* @tt, i32 0, i32 6 ; <double*> [#uses=1]
  %tmp511 = load double* %tmp510, align 8         ; <double> [#uses=1]
  %tmp512 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp513 = load double* %tmp512, align 8         ; <double> [#uses=1]
  %tmp514 = load double* %m5, align 8             ; <double> [#uses=1]
  %tmp515 = call double @getRayleighLoss(double %tmp514, double %tmp513, double %tmp511) nounwind ; <double> [#uses=1]
  %tmp516 = getelementptr [20 x double]* @prat, i32 0, i32 7 ; <double*> [#uses=1]
  store double %tmp515, double* %tmp516, align 8
  br label %bb517

bb517:                                            ; preds = %bb493, %bb470
  %tmp518 = getelementptr [20 x double]* @tt, i32 0, i32 6 ; <double*> [#uses=1]
  %tmp519 = load double* %tmp518, align 8         ; <double> [#uses=1]
  %tmp520 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp521 = load double* %tmp520, align 8         ; <double> [#uses=1]
  %tmp522 = fmul double %tmp519, %tmp521          ; <double> [#uses=1]
  %tmp523 = getelementptr [20 x double]* @tt, i32 0, i32 7 ; <double*> [#uses=1]
  store double %tmp522, double* %tmp523, align 8
  %tmp524 = getelementptr [20 x double]* @pt, i32 0, i32 6 ; <double*> [#uses=1]
  %tmp525 = load double* %tmp524, align 8         ; <double> [#uses=1]
  %tmp526 = getelementptr [20 x double]* @prat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp527 = load double* %tmp526, align 8         ; <double> [#uses=1]
  %tmp528 = fmul double %tmp525, %tmp527          ; <double> [#uses=1]
  %tmp529 = getelementptr [20 x double]* @pt, i32 0, i32 7 ; <double*> [#uses=1]
  store double %tmp528, double* %tmp529, align 8
  %tmp530 = getelementptr [20 x double]* @tt, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp531 = load double* %tmp530, align 8         ; <double> [#uses=1]
  %tmp532 = call double @getGama(double %tmp531) nounwind ; <double> [#uses=1]
  %tmp533 = getelementptr [20 x double]* @gam, i32 0, i32 7 ; <double*> [#uses=1]
  store double %tmp532, double* %tmp533, align 8
  %tmp534 = getelementptr [20 x double]* @tt, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp535 = load double* %tmp534, align 8         ; <double> [#uses=1]
  %tmp536 = call double @getCp(double %tmp535) nounwind ; <double> [#uses=1]
  %tmp537 = getelementptr [20 x double]* @cp, i32 0, i32 7 ; <double*> [#uses=1]
  store double %tmp536, double* %tmp537, align 8
  %tmp538 = getelementptr [20 x double]* @prat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp539 = load double* %tmp538, align 8         ; <double> [#uses=1]
  %tmp540 = getelementptr [20 x double]* @prat, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp541 = load double* %tmp540, align 8         ; <double> [#uses=1]
  %tmp542 = fmul double %tmp539, %tmp541          ; <double> [#uses=1]
  %tmp543 = getelementptr [20 x double]* @prat, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp544 = load double* %tmp543, align 8         ; <double> [#uses=1]
  %tmp545 = fmul double %tmp542, %tmp544          ; <double> [#uses=1]
  %tmp546 = getelementptr [20 x double]* @prat, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp547 = load double* %tmp546, align 8         ; <double> [#uses=1]
  %tmp548 = fmul double %tmp545, %tmp547          ; <double> [#uses=1]
  %tmp549 = getelementptr [20 x double]* @prat, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp550 = load double* %tmp549, align 8         ; <double> [#uses=1]
  %tmp551 = fmul double %tmp548, %tmp550          ; <double> [#uses=1]
  %tmp552 = getelementptr [20 x double]* @prat, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp553 = load double* %tmp552, align 8         ; <double> [#uses=1]
  %tmp554 = fmul double %tmp551, %tmp553          ; <double> [#uses=1]
  store double %tmp554, double* @epr, align 8
  %tmp555 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp556 = load double* %tmp555, align 8         ; <double> [#uses=1]
  %tmp557 = getelementptr [20 x double]* @trat, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp558 = load double* %tmp557, align 8         ; <double> [#uses=1]
  %tmp559 = fmul double %tmp556, %tmp558          ; <double> [#uses=1]
  %tmp560 = getelementptr [20 x double]* @trat, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp561 = load double* %tmp560, align 8         ; <double> [#uses=1]
  %tmp562 = fmul double %tmp559, %tmp561          ; <double> [#uses=1]
  %tmp563 = getelementptr [20 x double]* @trat, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp564 = load double* %tmp563, align 8         ; <double> [#uses=1]
  %tmp565 = fmul double %tmp562, %tmp564          ; <double> [#uses=1]
  %tmp566 = getelementptr [20 x double]* @trat, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp567 = load double* %tmp566, align 8         ; <double> [#uses=1]
  %tmp568 = fmul double %tmp565, %tmp567          ; <double> [#uses=1]
  %tmp569 = getelementptr [20 x double]* @trat, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp570 = load double* %tmp569, align 8         ; <double> [#uses=1]
  %tmp571 = fmul double %tmp568, %tmp570          ; <double> [#uses=1]
  store double %tmp571, double* @etr, align 8
  br label %return

return:                                           ; preds = %bb517
  ret void
}

define void @calcPerf() {
entry:
  %rg1 = alloca double, align 8                   ; <double*> [#uses=1]
  %rg = alloca double, align 8                    ; <double*> [#uses=1]
  %cp3 = alloca double, align 8                   ; <double*> [#uses=2]
  %cpe = alloca double, align 8                   ; <double*> [#uses=2]
  %game = alloca double, align 8                  ; <double*> [#uses=4]
  %fac1 = alloca double, align 8                  ; <double*> [#uses=6]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double 5.330000e+01, double* %rg1, align 8
  %tmp = load double* @gama, align 8              ; <double> [#uses=1]
  %tmp1 = fsub double %tmp, 1.000000e+00          ; <double> [#uses=1]
  %tmp2 = load double* @cpair, align 8            ; <double> [#uses=1]
  %tmp3 = fmul double %tmp1, %tmp2                ; <double> [#uses=1]
  %tmp4 = load double* @gama, align 8             ; <double> [#uses=1]
  %tmp5 = fdiv double %tmp3, %tmp4                ; <double> [#uses=1]
  store double %tmp5, double* %rg, align 8
  %tmp6 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp7 = load double* %tmp6, align 8             ; <double> [#uses=1]
  %tmp8 = call double @getCp(double %tmp7) nounwind ; <double> [#uses=1]
  store double %tmp8, double* %cp3, align 8
  store double 3.220000e+01, double* @g0, align 8
  store double 0.000000e+00, double* @ues, align 8
  %tmp9 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp10 = load double* %tmp9, align 8            ; <double> [#uses=1]
  %tmp11 = call double @getGama(double %tmp10) nounwind ; <double> [#uses=1]
  store double %tmp11, double* %game, align 8
  %tmp12 = load double* %game, align 8            ; <double> [#uses=1]
  %tmp13 = fsub double %tmp12, 1.000000e+00       ; <double> [#uses=1]
  %tmp14 = load double* %game, align 8            ; <double> [#uses=1]
  %tmp15 = fdiv double %tmp13, %tmp14             ; <double> [#uses=1]
  store double %tmp15, double* %fac1, align 8
  %tmp16 = getelementptr [20 x double]* @tt, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp17 = load double* %tmp16, align 8           ; <double> [#uses=1]
  %tmp18 = call double @getCp(double %tmp17) nounwind ; <double> [#uses=1]
  store double %tmp18, double* %cpe, align 8
  %tmp19 = getelementptr [20 x double]* @eta, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp20 = load double* %tmp19, align 8           ; <double> [#uses=1]
  %tmp21 = fcmp olt double %tmp20, 8.000000e-01   ; <i1> [#uses=1]
  %tmp2122 = zext i1 %tmp21 to i8                 ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp2122, 0                ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb24

bb:                                               ; preds = %entry
  %tmp23 = getelementptr [20 x double]* @eta, i32 0, i32 7 ; <double*> [#uses=1]
  store double 8.000000e-01, double* %tmp23, align 8
  br label %bb24

bb24:                                             ; preds = %bb, %entry
  %tmp25 = getelementptr [20 x double]* @eta, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp26 = load double* %tmp25, align 8           ; <double> [#uses=1]
  %tmp27 = fcmp olt double %tmp26, 8.000000e-01   ; <i1> [#uses=1]
  %tmp2728 = zext i1 %tmp27 to i8                 ; <i8> [#uses=1]
  %toBool29 = icmp ne i8 %tmp2728, 0              ; <i1> [#uses=1]
  br i1 %toBool29, label %bb30, label %bb32

bb30:                                             ; preds = %bb24
  %tmp31 = getelementptr [20 x double]* @eta, i32 0, i32 4 ; <double*> [#uses=1]
  store double 8.000000e-01, double* %tmp31, align 8
  br label %bb32

bb32:                                             ; preds = %bb30, %bb24
  %tmp33 = getelementptr [20 x double]* @prat, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp34 = load double* %tmp33, align 8           ; <double> [#uses=1]
  %tmp35 = load double* @epr, align 8             ; <double> [#uses=1]
  %tmp36 = fmul double %tmp34, %tmp35             ; <double> [#uses=1]
  %tmp37 = getelementptr [20 x double]* @pt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp38 = load double* %tmp37, align 8           ; <double> [#uses=1]
  %tmp39 = fmul double %tmp36, %tmp38             ; <double> [#uses=1]
  %tmp40 = getelementptr [20 x double]* @pt, i32 0, i32 8 ; <double*> [#uses=1]
  store double %tmp39, double* %tmp40, align 8
  %tmp41 = load double* %game, align 8            ; <double> [#uses=1]
  %tmp42 = call double @getAir(double 1.000000e+00, double %tmp41) nounwind ; <double> [#uses=1]
  %tmp43 = fmul double %tmp42, 1.440000e+02       ; <double> [#uses=1]
  %tmp44 = load double* @a8, align 8              ; <double> [#uses=1]
  %tmp45 = fmul double %tmp43, %tmp44             ; <double> [#uses=1]
  %tmp46 = getelementptr [20 x double]* @pt, i32 0, i32 8 ; <double*> [#uses=1]
  %tmp47 = load double* %tmp46, align 8           ; <double> [#uses=1]
  %tmp48 = fmul double %tmp45, %tmp47             ; <double> [#uses=1]
  %tmp49 = fdiv double %tmp48, 1.470000e+01       ; <double> [#uses=1]
  %tmp50 = getelementptr [20 x double]* @tt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp51 = load double* %tmp50, align 8           ; <double> [#uses=1]
  %tmp52 = load double* @etr, align 8             ; <double> [#uses=1]
  %tmp53 = fmul double %tmp51, %tmp52             ; <double> [#uses=1]
  %tmp54 = fdiv double %tmp53, 5.180000e+02       ; <double> [#uses=1]
  %tmp55 = call double @sqroot(double %tmp54) nounwind ; <double> [#uses=1]
  %tmp56 = fdiv double %tmp49, %tmp55             ; <double> [#uses=1]
  store double %tmp56, double* @eair, align 8
  %tmp57 = load double* @gama, align 8            ; <double> [#uses=1]
  %tmp58 = getelementptr [20 x double]* @tt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp59 = load double* %tmp58, align 8           ; <double> [#uses=1]
  %tmp60 = fdiv double %tmp59, 5.180000e+02       ; <double> [#uses=1]
  %tmp61 = call double @sqroot(double %tmp60) nounwind ; <double> [#uses=1]
  %tmp62 = load double* @eair, align 8            ; <double> [#uses=1]
  %tmp63 = fmul double %tmp61, %tmp62             ; <double> [#uses=1]
  %tmp64 = getelementptr [20 x double]* @prat, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp65 = load double* %tmp64, align 8           ; <double> [#uses=1]
  %tmp66 = getelementptr [20 x double]* @pt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp67 = load double* %tmp66, align 8           ; <double> [#uses=1]
  %tmp68 = fmul double %tmp65, %tmp67             ; <double> [#uses=1]
  %tmp69 = fdiv double %tmp68, 1.470000e+01       ; <double> [#uses=1]
  %tmp70 = load double* @acore, align 8           ; <double> [#uses=1]
  %tmp71 = fmul double %tmp69, %tmp70             ; <double> [#uses=1]
  %tmp72 = fmul double %tmp71, 1.440000e+02       ; <double> [#uses=1]
  %tmp73 = fdiv double %tmp63, %tmp72             ; <double> [#uses=1]
  %tmp74 = call double @getMach(i32 0, double %tmp73, double %tmp57) nounwind ; <double> [#uses=1]
  store double %tmp74, double* @m2, align 8
  %tmp75 = getelementptr [20 x double]* @pt, i32 0, i32 8 ; <double*> [#uses=1]
  %tmp76 = load double* %tmp75, align 8           ; <double> [#uses=1]
  %tmp77 = load double* @ps0, align 8             ; <double> [#uses=1]
  %tmp78 = fdiv double %tmp76, %tmp77             ; <double> [#uses=1]
  store double %tmp78, double* @npr, align 8
  %tmp79 = load double* @Rgas, align 8            ; <double> [#uses=1]
  %tmp80 = fmul double %tmp79, 2.000000e+00       ; <double> [#uses=1]
  %tmp81 = load double* %fac1, align 8            ; <double> [#uses=1]
  %tmp82 = fdiv double %tmp80, %tmp81             ; <double> [#uses=1]
  %tmp83 = load double* @etr, align 8             ; <double> [#uses=1]
  %tmp84 = fmul double %tmp82, %tmp83             ; <double> [#uses=1]
  %tmp85 = getelementptr [20 x double]* @tt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp86 = load double* %tmp85, align 8           ; <double> [#uses=1]
  %tmp87 = fmul double %tmp84, %tmp86             ; <double> [#uses=1]
  %tmp88 = getelementptr [20 x double]* @eta, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp89 = load double* %tmp88, align 8           ; <double> [#uses=1]
  %tmp90 = fmul double %tmp87, %tmp89             ; <double> [#uses=1]
  %tmp91 = load double* @npr, align 8             ; <double> [#uses=1]
  %tmp92 = fdiv double 1.000000e+00, %tmp91       ; <double> [#uses=1]
  %tmp93 = load double* %fac1, align 8            ; <double> [#uses=1]
  %tmp94 = call double @fpow(double %tmp92, double %tmp93) nounwind ; <double> [#uses=1]
  %tmp95 = fsub double 1.000000e+00, %tmp94       ; <double> [#uses=1]
  %tmp96 = fmul double %tmp90, %tmp95             ; <double> [#uses=1]
  %tmp97 = call double @sqroot(double %tmp96) nounwind ; <double> [#uses=1]
  store double %tmp97, double* @uexit, align 8
  %tmp98 = load double* @npr, align 8             ; <double> [#uses=1]
  %tmp99 = fcmp ole double %tmp98, 1.893000e+00   ; <i1> [#uses=1]
  %tmp99100 = zext i1 %tmp99 to i8                ; <i8> [#uses=1]
  %toBool101 = icmp ne i8 %tmp99100, 0            ; <i1> [#uses=1]
  br i1 %toBool101, label %bb102, label %bb104

bb102:                                            ; preds = %bb32
  %tmp103 = load double* @ps0, align 8            ; <double> [#uses=1]
  store double %tmp103, double* @pexit, align 8
  br label %bb108

bb104:                                            ; preds = %bb32
  %tmp105 = getelementptr [20 x double]* @pt, i32 0, i32 8 ; <double*> [#uses=1]
  %tmp106 = load double* %tmp105, align 8         ; <double> [#uses=1]
  %tmp107 = fmul double %tmp106, 5.282800e-01     ; <double> [#uses=1]
  store double %tmp107, double* @pexit, align 8
  br label %bb108

bb108:                                            ; preds = %bb104, %bb102
  %tmp109 = load double* @pexit, align 8          ; <double> [#uses=1]
  %tmp110 = load double* @ps0, align 8            ; <double> [#uses=1]
  %tmp111 = fsub double %tmp109, %tmp110          ; <double> [#uses=1]
  %tmp112 = fmul double %tmp111, 1.440000e+02     ; <double> [#uses=1]
  %tmp113 = load double* @a8, align 8             ; <double> [#uses=1]
  %tmp114 = fmul double %tmp112, %tmp113          ; <double> [#uses=1]
  %tmp115 = load double* @eair, align 8           ; <double> [#uses=1]
  %tmp116 = fdiv double %tmp114, %tmp115          ; <double> [#uses=1]
  %tmp117 = load double* @uexit, align 8          ; <double> [#uses=1]
  %tmp118 = fadd double %tmp116, %tmp117          ; <double> [#uses=1]
  %tmp119 = load double* @g0, align 8             ; <double> [#uses=1]
  %tmp120 = fdiv double %tmp118, %tmp119          ; <double> [#uses=1]
  store double %tmp120, double* @fgros, align 8
  %tmp121 = load i32* @engine, align 4            ; <i32> [#uses=1]
  %tmp122 = icmp eq i32 %tmp121, 3                ; <i1> [#uses=1]
  %tmp122123 = zext i1 %tmp122 to i8              ; <i8> [#uses=1]
  %toBool124 = icmp ne i8 %tmp122123, 0           ; <i1> [#uses=1]
  br i1 %toBool124, label %bb125, label %bb201

bb125:                                            ; preds = %bb108
  %tmp126 = load double* @gama, align 8           ; <double> [#uses=1]
  %tmp127 = fsub double %tmp126, 1.000000e+00     ; <double> [#uses=1]
  %tmp128 = load double* @gama, align 8           ; <double> [#uses=1]
  %tmp129 = fdiv double %tmp127, %tmp128          ; <double> [#uses=1]
  store double %tmp129, double* %fac1, align 8
  %tmp130 = getelementptr [20 x double]* @pt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp131 = load double* %tmp130, align 8         ; <double> [#uses=1]
  %tmp132 = load double* @ps0, align 8            ; <double> [#uses=1]
  %tmp133 = fdiv double %tmp131, %tmp132          ; <double> [#uses=1]
  store double %tmp133, double* @snpr, align 8
  %tmp134 = load double* @Rgas, align 8           ; <double> [#uses=1]
  %tmp135 = fmul double %tmp134, 2.000000e+00     ; <double> [#uses=1]
  %tmp136 = load double* %fac1, align 8           ; <double> [#uses=1]
  %tmp137 = fdiv double %tmp135, %tmp136          ; <double> [#uses=1]
  %tmp138 = getelementptr [20 x double]* @tt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp139 = load double* %tmp138, align 8         ; <double> [#uses=1]
  %tmp140 = fmul double %tmp137, %tmp139          ; <double> [#uses=1]
  %tmp141 = getelementptr [20 x double]* @eta, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp142 = load double* %tmp141, align 8         ; <double> [#uses=1]
  %tmp143 = fmul double %tmp140, %tmp142          ; <double> [#uses=1]
  %tmp144 = load double* @snpr, align 8           ; <double> [#uses=1]
  %tmp145 = fdiv double 1.000000e+00, %tmp144     ; <double> [#uses=1]
  %tmp146 = load double* %fac1, align 8           ; <double> [#uses=1]
  %tmp147 = call double @fpow(double %tmp145, double %tmp146) nounwind ; <double> [#uses=1]
  %tmp148 = fsub double 1.000000e+00, %tmp147     ; <double> [#uses=1]
  %tmp149 = fmul double %tmp143, %tmp148          ; <double> [#uses=1]
  %tmp150 = call double @sqroot(double %tmp149) nounwind ; <double> [#uses=1]
  store double %tmp150, double* @ues, align 8
  %tmp151 = load double* @gama, align 8           ; <double> [#uses=1]
  %tmp152 = load double* @byprat, align 8         ; <double> [#uses=1]
  %tmp153 = fadd double %tmp152, 1.000000e+00     ; <double> [#uses=1]
  %tmp154 = load double* @eair, align 8           ; <double> [#uses=1]
  %tmp155 = fmul double %tmp153, %tmp154          ; <double> [#uses=1]
  %tmp156 = getelementptr [20 x double]* @tt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp157 = load double* %tmp156, align 8         ; <double> [#uses=1]
  %tmp158 = fdiv double %tmp157, 5.180000e+02     ; <double> [#uses=1]
  %tmp159 = call double @sqroot(double %tmp158) nounwind ; <double> [#uses=1]
  %tmp160 = fmul double %tmp155, %tmp159          ; <double> [#uses=1]
  %tmp161 = getelementptr [20 x double]* @prat, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp162 = load double* %tmp161, align 8         ; <double> [#uses=1]
  %tmp163 = getelementptr [20 x double]* @pt, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp164 = load double* %tmp163, align 8         ; <double> [#uses=1]
  %tmp165 = fmul double %tmp162, %tmp164          ; <double> [#uses=1]
  %tmp166 = fdiv double %tmp165, 1.470000e+01     ; <double> [#uses=1]
  %tmp167 = load double* @afan, align 8           ; <double> [#uses=1]
  %tmp168 = fmul double %tmp166, %tmp167          ; <double> [#uses=1]
  %tmp169 = fmul double %tmp168, 1.440000e+02     ; <double> [#uses=1]
  %tmp170 = fdiv double %tmp160, %tmp169          ; <double> [#uses=1]
  %tmp171 = call double @getMach(i32 0, double %tmp170, double %tmp151) nounwind ; <double> [#uses=1]
  store double %tmp171, double* @m2, align 8
  %tmp172 = load double* @snpr, align 8           ; <double> [#uses=1]
  %tmp173 = fcmp ole double %tmp172, 1.893000e+00 ; <i1> [#uses=1]
  %tmp173174 = zext i1 %tmp173 to i8              ; <i8> [#uses=1]
  %toBool175 = icmp ne i8 %tmp173174, 0           ; <i1> [#uses=1]
  br i1 %toBool175, label %bb176, label %bb178

bb176:                                            ; preds = %bb125
  %tmp177 = load double* @ps0, align 8            ; <double> [#uses=1]
  store double %tmp177, double* @pfexit, align 8
  br label %bb182

bb178:                                            ; preds = %bb125
  %tmp179 = getelementptr [20 x double]* @pt, i32 0, i32 13 ; <double*> [#uses=1]
  %tmp180 = load double* %tmp179, align 8         ; <double> [#uses=1]
  %tmp181 = fmul double %tmp180, 5.282800e-01     ; <double> [#uses=1]
  store double %tmp181, double* @pfexit, align 8
  br label %bb182

bb182:                                            ; preds = %bb178, %bb176
  %tmp183 = load double* @byprat, align 8         ; <double> [#uses=1]
  %tmp184 = load double* @ues, align 8            ; <double> [#uses=1]
  %tmp185 = fmul double %tmp183, %tmp184          ; <double> [#uses=1]
  %tmp186 = load double* @pfexit, align 8         ; <double> [#uses=1]
  %tmp187 = load double* @ps0, align 8            ; <double> [#uses=1]
  %tmp188 = fsub double %tmp186, %tmp187          ; <double> [#uses=1]
  %tmp189 = fmul double %tmp188, 1.440000e+02     ; <double> [#uses=1]
  %tmp190 = load double* @byprat, align 8         ; <double> [#uses=1]
  %tmp191 = fmul double %tmp189, %tmp190          ; <double> [#uses=1]
  %tmp192 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp193 = fmul double %tmp191, %tmp192          ; <double> [#uses=1]
  %tmp194 = load double* @eair, align 8           ; <double> [#uses=1]
  %tmp195 = fdiv double %tmp193, %tmp194          ; <double> [#uses=1]
  %tmp196 = fadd double %tmp185, %tmp195          ; <double> [#uses=1]
  %tmp197 = load double* @g0, align 8             ; <double> [#uses=1]
  %tmp198 = fdiv double %tmp196, %tmp197          ; <double> [#uses=1]
  %tmp199 = load double* @fgros, align 8          ; <double> [#uses=1]
  %tmp200 = fadd double %tmp198, %tmp199          ; <double> [#uses=1]
  store double %tmp200, double* @fgros, align 8
  br label %bb201

bb201:                                            ; preds = %bb182, %bb108
  %tmp202 = load double* @u0, align 8             ; <double> [#uses=1]
  %tmp203 = load double* @g0, align 8             ; <double> [#uses=1]
  %tmp204 = fdiv double %tmp202, %tmp203          ; <double> [#uses=1]
  store double %tmp204, double* @dram, align 8
  %tmp205 = load i32* @engine, align 4            ; <i32> [#uses=1]
  %tmp206 = icmp eq i32 %tmp205, 3                ; <i1> [#uses=1]
  %tmp206207 = zext i1 %tmp206 to i8              ; <i8> [#uses=1]
  %toBool208 = icmp ne i8 %tmp206207, 0           ; <i1> [#uses=1]
  br i1 %toBool208, label %bb209, label %bb217

bb209:                                            ; preds = %bb201
  %tmp210 = load double* @u0, align 8             ; <double> [#uses=1]
  %tmp211 = load double* @byprat, align 8         ; <double> [#uses=1]
  %tmp212 = fmul double %tmp210, %tmp211          ; <double> [#uses=1]
  %tmp213 = load double* @g0, align 8             ; <double> [#uses=1]
  %tmp214 = fdiv double %tmp212, %tmp213          ; <double> [#uses=1]
  %tmp215 = load double* @dram, align 8           ; <double> [#uses=1]
  %tmp216 = fadd double %tmp214, %tmp215          ; <double> [#uses=1]
  store double %tmp216, double* @dram, align 8
  br label %bb217

bb217:                                            ; preds = %bb209, %bb201
  %tmp218 = load double* @fsmach, align 8         ; <double> [#uses=1]
  %tmp219 = fcmp ogt double %tmp218, 1.000000e-02 ; <i1> [#uses=1]
  %tmp219220 = zext i1 %tmp219 to i8              ; <i8> [#uses=1]
  %toBool221 = icmp ne i8 %tmp219220, 0           ; <i1> [#uses=1]
  br i1 %toBool221, label %bb222, label %bb233

bb222:                                            ; preds = %bb217
  %tmp223 = load double* @gama, align 8           ; <double> [#uses=1]
  %tmp224 = load double* @m2, align 8             ; <double> [#uses=1]
  %tmp225 = call double @getAir(double %tmp224, double %tmp223) nounwind ; <double> [#uses=1]
  %tmp226 = getelementptr [20 x double]* @prat, i32 0, i32 2 ; <double*> [#uses=1]
  %tmp227 = load double* %tmp226, align 8         ; <double> [#uses=1]
  %tmp228 = fmul double %tmp225, %tmp227          ; <double> [#uses=1]
  %tmp229 = load double* @gama, align 8           ; <double> [#uses=1]
  %tmp230 = load double* @fsmach, align 8         ; <double> [#uses=1]
  %tmp231 = call double @getAir(double %tmp230, double %tmp229) nounwind ; <double> [#uses=1]
  %tmp232 = fdiv double %tmp228, %tmp231          ; <double> [#uses=1]
  store double %tmp232, double* @mfr, align 8
  br label %bb234

bb233:                                            ; preds = %bb217
  store double 5.000000e+00, double* @mfr, align 8
  br label %bb234

bb234:                                            ; preds = %bb233, %bb222
  %tmp235 = load double* @fgros, align 8          ; <double> [#uses=1]
  %tmp236 = load double* @dram, align 8           ; <double> [#uses=1]
  %tmp237 = fsub double %tmp235, %tmp236          ; <double> [#uses=1]
  store double %tmp237, double* @fnet, align 8
  %tmp238 = load double* @fnet, align 8           ; <double> [#uses=1]
  %tmp239 = load double* @eair, align 8           ; <double> [#uses=1]
  %tmp240 = fmul double %tmp238, %tmp239          ; <double> [#uses=1]
  store double %tmp240, double* @fnlb, align 8
  %tmp241 = load double* @fgros, align 8          ; <double> [#uses=1]
  %tmp242 = load double* @eair, align 8           ; <double> [#uses=1]
  %tmp243 = fmul double %tmp241, %tmp242          ; <double> [#uses=1]
  store double %tmp243, double* @fglb, align 8
  %tmp244 = load double* @dram, align 8           ; <double> [#uses=1]
  %tmp245 = load double* @eair, align 8           ; <double> [#uses=1]
  %tmp246 = fmul double %tmp244, %tmp245          ; <double> [#uses=1]
  store double %tmp246, double* @drlb, align 8
  %tmp247 = getelementptr [20 x double]* @trat, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp248 = load double* %tmp247, align 8         ; <double> [#uses=1]
  %tmp249 = fsub double %tmp248, 1.000000e+00     ; <double> [#uses=1]
  %tmp250 = getelementptr [20 x double]* @eta, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp251 = load double* %tmp250, align 8         ; <double> [#uses=1]
  %tmp252 = load double* @fhv, align 8            ; <double> [#uses=1]
  %tmp253 = fmul double %tmp251, %tmp252          ; <double> [#uses=1]
  %tmp254 = getelementptr [20 x double]* @tt, i32 0, i32 3 ; <double*> [#uses=1]
  %tmp255 = load double* %tmp254, align 8         ; <double> [#uses=1]
  %tmp256 = load double* %cp3, align 8            ; <double> [#uses=1]
  %tmp257 = fmul double %tmp255, %tmp256          ; <double> [#uses=1]
  %tmp258 = fdiv double %tmp253, %tmp257          ; <double> [#uses=1]
  %tmp259 = getelementptr [20 x double]* @trat, i32 0, i32 4 ; <double*> [#uses=1]
  %tmp260 = load double* %tmp259, align 8         ; <double> [#uses=1]
  %tmp261 = fsub double %tmp258, %tmp260          ; <double> [#uses=1]
  %tmp262 = fdiv double %tmp249, %tmp261          ; <double> [#uses=1]
  %tmp263 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp264 = load double* %tmp263, align 8         ; <double> [#uses=1]
  %tmp265 = fsub double %tmp264, 1.000000e+00     ; <double> [#uses=1]
  %tmp266 = load double* @fhv, align 8            ; <double> [#uses=1]
  %tmp267 = getelementptr [20 x double]* @tt, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp268 = load double* %tmp267, align 8         ; <double> [#uses=1]
  %tmp269 = load double* %cpe, align 8            ; <double> [#uses=1]
  %tmp270 = fmul double %tmp268, %tmp269          ; <double> [#uses=1]
  %tmp271 = fdiv double %tmp266, %tmp270          ; <double> [#uses=1]
  %tmp272 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp273 = load double* %tmp272, align 8         ; <double> [#uses=1]
  %tmp274 = fsub double %tmp271, %tmp273          ; <double> [#uses=1]
  %tmp275 = fdiv double %tmp265, %tmp274          ; <double> [#uses=1]
  %tmp276 = fadd double %tmp262, %tmp275          ; <double> [#uses=1]
  store double %tmp276, double* @fa, align 8
  %tmp277 = load double* @fnet, align 8           ; <double> [#uses=1]
  %tmp278 = fcmp ogt double %tmp277, 0.000000e+00 ; <i1> [#uses=1]
  %tmp278279 = zext i1 %tmp278 to i8              ; <i8> [#uses=1]
  %toBool280 = icmp ne i8 %tmp278279, 0           ; <i1> [#uses=1]
  br i1 %toBool280, label %bb281, label %bb299

bb281:                                            ; preds = %bb234
  %tmp282 = load double* @fa, align 8             ; <double> [#uses=1]
  %tmp283 = fmul double %tmp282, 3.600000e+03     ; <double> [#uses=1]
  %tmp284 = load double* @fnet, align 8           ; <double> [#uses=1]
  %tmp285 = fdiv double %tmp283, %tmp284          ; <double> [#uses=1]
  store double %tmp285, double* @sfc, align 8
  %tmp286 = load double* @sfc, align 8            ; <double> [#uses=1]
  %tmp287 = fcmp olt double %tmp286, 0.000000e+00 ; <i1> [#uses=1]
  %tmp287288 = zext i1 %tmp287 to i8              ; <i8> [#uses=1]
  %toBool289 = icmp ne i8 %tmp287288, 0           ; <i1> [#uses=1]
  br i1 %toBool289, label %bb290, label %bb291

bb290:                                            ; preds = %bb281
  store double 0.000000e+00, double* @sfc, align 8
  br label %bb291

bb291:                                            ; preds = %bb290, %bb281
  %tmp292 = load double* @sfc, align 8            ; <double> [#uses=1]
  %tmp293 = load double* @fnlb, align 8           ; <double> [#uses=1]
  %tmp294 = fmul double %tmp292, %tmp293          ; <double> [#uses=1]
  store double %tmp294, double* @flflo, align 8
  %tmp295 = load double* @fnlb, align 8           ; <double> [#uses=1]
  %tmp296 = load double* @flflo, align 8          ; <double> [#uses=1]
  %tmp297 = fdiv double %tmp295, %tmp296          ; <double> [#uses=1]
  %tmp298 = fmul double %tmp297, 3.600000e+03     ; <double> [#uses=1]
  store double %tmp298, double* @isp, align 8
  br label %bb300

bb299:                                            ; preds = %bb234
  store double 0.000000e+00, double* @fnlb, align 8
  store double 0.000000e+00, double* @flflo, align 8
  store double 0.000000e+00, double* @sfc, align 8
  store double 0.000000e+00, double* @isp, align 8
  br label %bb300

bb300:                                            ; preds = %bb299, %bb291
  %tmp301 = load i32* @engine, align 4            ; <i32> [#uses=1]
  %tmp302 = icmp eq i32 %tmp301, 1                ; <i1> [#uses=1]
  %tmp302303 = zext i1 %tmp302 to i8              ; <i8> [#uses=1]
  %toBool304 = icmp ne i8 %tmp302303, 0           ; <i1> [#uses=1]
  br i1 %toBool304, label %bb305, label %bb329

bb305:                                            ; preds = %bb300
  %tmp306 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp307 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp308 = fmul double %tmp306, %tmp307          ; <double> [#uses=1]
  %tmp309 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp310 = fmul double %tmp308, %tmp309          ; <double> [#uses=1]
  %tmp311 = call double @sqroot(double %tmp310) nounwind ; <double> [#uses=1]
  %tmp312 = fmul double %tmp311, 1.275400e-01     ; <double> [#uses=1]
  %tmp313 = load double* @dcomp, align 8          ; <double> [#uses=1]
  %tmp314 = load double* @lcomp, align 8          ; <double> [#uses=1]
  %tmp315 = fmul double %tmp313, %tmp314          ; <double> [#uses=1]
  %tmp316 = load double* @dburner, align 8        ; <double> [#uses=1]
  %tmp317 = load double* @lburn, align 8          ; <double> [#uses=1]
  %tmp318 = fmul double %tmp316, %tmp317          ; <double> [#uses=1]
  %tmp319 = fadd double %tmp315, %tmp318          ; <double> [#uses=1]
  %tmp320 = load double* @dturbin, align 8        ; <double> [#uses=1]
  %tmp321 = load double* @lturb, align 8          ; <double> [#uses=1]
  %tmp322 = fmul double %tmp320, %tmp321          ; <double> [#uses=1]
  %tmp323 = fadd double %tmp319, %tmp322          ; <double> [#uses=1]
  %tmp324 = load double* @dnozl, align 8          ; <double> [#uses=1]
  %tmp325 = load double* @lnoz, align 8           ; <double> [#uses=1]
  %tmp326 = fmul double %tmp324, %tmp325          ; <double> [#uses=1]
  %tmp327 = fadd double %tmp323, %tmp326          ; <double> [#uses=1]
  %tmp328 = fmul double %tmp312, %tmp327          ; <double> [#uses=1]
  store double %tmp328, double* @weight, align 8
  br label %bb329

bb329:                                            ; preds = %bb305, %bb300
  %tmp330 = load i32* @engine, align 4            ; <i32> [#uses=1]
  %tmp331 = icmp eq i32 %tmp330, 2                ; <i1> [#uses=1]
  %tmp331332 = zext i1 %tmp331 to i8              ; <i8> [#uses=1]
  %toBool333 = icmp ne i8 %tmp331332, 0           ; <i1> [#uses=1]
  br i1 %toBool333, label %bb334, label %bb358

bb334:                                            ; preds = %bb329
  %tmp335 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp336 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp337 = fmul double %tmp335, %tmp336          ; <double> [#uses=1]
  %tmp338 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp339 = fmul double %tmp337, %tmp338          ; <double> [#uses=1]
  %tmp340 = call double @sqroot(double %tmp339) nounwind ; <double> [#uses=1]
  %tmp341 = fmul double %tmp340, 8.533000e-02     ; <double> [#uses=1]
  %tmp342 = load double* @dcomp, align 8          ; <double> [#uses=1]
  %tmp343 = load double* @lcomp, align 8          ; <double> [#uses=1]
  %tmp344 = fmul double %tmp342, %tmp343          ; <double> [#uses=1]
  %tmp345 = load double* @dburner, align 8        ; <double> [#uses=1]
  %tmp346 = load double* @lburn, align 8          ; <double> [#uses=1]
  %tmp347 = fmul double %tmp345, %tmp346          ; <double> [#uses=1]
  %tmp348 = fadd double %tmp344, %tmp347          ; <double> [#uses=1]
  %tmp349 = load double* @dturbin, align 8        ; <double> [#uses=1]
  %tmp350 = load double* @lturb, align 8          ; <double> [#uses=1]
  %tmp351 = fmul double %tmp349, %tmp350          ; <double> [#uses=1]
  %tmp352 = fadd double %tmp348, %tmp351          ; <double> [#uses=1]
  %tmp353 = load double* @dnozl, align 8          ; <double> [#uses=1]
  %tmp354 = load double* @lnoz, align 8           ; <double> [#uses=1]
  %tmp355 = fmul double %tmp353, %tmp354          ; <double> [#uses=1]
  %tmp356 = fadd double %tmp352, %tmp355          ; <double> [#uses=1]
  %tmp357 = fmul double %tmp341, %tmp356          ; <double> [#uses=1]
  store double %tmp357, double* @weight, align 8
  br label %bb358

bb358:                                            ; preds = %bb334, %bb329
  %tmp359 = load i32* @engine, align 4            ; <i32> [#uses=1]
  %tmp360 = icmp eq i32 %tmp359, 3                ; <i1> [#uses=1]
  %tmp360361 = zext i1 %tmp360 to i8              ; <i8> [#uses=1]
  %toBool362 = icmp ne i8 %tmp360361, 0           ; <i1> [#uses=1]
  br i1 %toBool362, label %bb363, label %bb390

bb363:                                            ; preds = %bb358
  %tmp364 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp365 = fmul double %tmp364, 8.955000e-02     ; <double> [#uses=1]
  %tmp366 = load double* @byprat, align 8         ; <double> [#uses=1]
  %tmp367 = fadd double %tmp366, 1.000000e+00     ; <double> [#uses=1]
  %tmp368 = load double* @dfan, align 8           ; <double> [#uses=1]
  %tmp369 = fmul double %tmp367, %tmp368          ; <double> [#uses=1]
  %tmp370 = fmul double %tmp369, 4.000000e+00     ; <double> [#uses=1]
  %tmp371 = load double* @ncomp, align 8          ; <double> [#uses=1]
  %tmp372 = fsub double %tmp371, 3.000000e+00     ; <double> [#uses=1]
  %tmp373 = load double* @dcomp, align 8          ; <double> [#uses=1]
  %tmp374 = fmul double %tmp372, %tmp373          ; <double> [#uses=1]
  %tmp375 = fadd double %tmp370, %tmp374          ; <double> [#uses=1]
  %tmp376 = load double* @dburner, align 8        ; <double> [#uses=1]
  %tmp377 = fadd double %tmp375, %tmp376          ; <double> [#uses=1]
  %tmp378 = load double* @dturbin, align 8        ; <double> [#uses=1]
  %tmp379 = load double* @nturb, align 8          ; <double> [#uses=1]
  %tmp380 = fmul double %tmp378, %tmp379          ; <double> [#uses=1]
  %tmp381 = fadd double %tmp377, %tmp380          ; <double> [#uses=1]
  %tmp382 = load double* @dburner, align 8        ; <double> [#uses=1]
  %tmp383 = fmul double %tmp382, 2.000000e+00     ; <double> [#uses=1]
  %tmp384 = fadd double %tmp381, %tmp383          ; <double> [#uses=1]
  %tmp385 = fmul double %tmp365, %tmp384          ; <double> [#uses=1]
  %tmp386 = load double* @acore, align 8          ; <double> [#uses=1]
  %tmp387 = fdiv double %tmp386, 6.965000e+00     ; <double> [#uses=1]
  %tmp388 = call double @sqroot(double %tmp387) nounwind ; <double> [#uses=1]
  %tmp389 = fmul double %tmp385, %tmp388          ; <double> [#uses=1]
  store double %tmp389, double* @weight, align 8
  br label %bb390

bb390:                                            ; preds = %bb363, %bb358
  br label %return

return:                                           ; preds = %bb390
  ret void
}

define void @getGeo() {
entry:
  %tmp = load double* @afan, align 8              ; <double> [#uses=1]
  %tmp1 = load double* @acore, align 8            ; <double> [#uses=1]
  %tmp2 = fcmp olt double %tmp, %tmp1             ; <i1> [#uses=1]
  %tmp23 = zext i1 %tmp2 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp23, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb5

bb:                                               ; preds = %entry
  %tmp4 = load double* @acore, align 8            ; <double> [#uses=1]
  store double %tmp4, double* @afan, align 8
  br label %bb5

bb5:                                              ; preds = %bb, %entry
  %tmp6 = load double* @etr, align 8              ; <double> [#uses=1]
  %tmp7 = call double @sqroot(double %tmp6) nounwind ; <double> [#uses=1]
  %tmp8 = fmul double %tmp7, 7.500000e-01         ; <double> [#uses=1]
  %tmp9 = load double* @epr, align 8              ; <double> [#uses=1]
  %tmp10 = fdiv double %tmp8, %tmp9               ; <double> [#uses=1]
  store double %tmp10, double* @a8max, align 8
  %tmp11 = load double* @a8max, align 8           ; <double> [#uses=1]
  %tmp12 = fcmp ogt double %tmp11, 1.000000e+00   ; <i1> [#uses=1]
  %tmp1213 = zext i1 %tmp12 to i8                 ; <i8> [#uses=1]
  %toBool14 = icmp ne i8 %tmp1213, 0              ; <i1> [#uses=1]
  br i1 %toBool14, label %bb15, label %bb16

bb15:                                             ; preds = %bb5
  store double 1.000000e+00, double* @a8max, align 8
  br label %bb16

bb16:                                             ; preds = %bb15, %bb5
  %tmp17 = load double* @a8rat, align 8           ; <double> [#uses=1]
  %tmp18 = load double* @a8max, align 8           ; <double> [#uses=1]
  %tmp19 = fcmp ogt double %tmp17, %tmp18         ; <i1> [#uses=1]
  %tmp1920 = zext i1 %tmp19 to i8                 ; <i8> [#uses=1]
  %toBool21 = icmp ne i8 %tmp1920, 0              ; <i1> [#uses=1]
  br i1 %toBool21, label %bb22, label %bb25

bb22:                                             ; preds = %bb16
  %tmp24 = load double* @a8max, align 8           ; <double> [#uses=1]
  store double %tmp24, double* @a8rat, align 8
  br label %bb25

bb25:                                             ; preds = %bb22, %bb16
  %tmp26 = load double* @arsched, align 8         ; <double> [#uses=1]
  %tmp27 = fcmp oeq double %tmp26, 0.000000e+00   ; <i1> [#uses=1]
  %tmp2728 = zext i1 %tmp27 to i8                 ; <i8> [#uses=1]
  %toBool29 = icmp ne i8 %tmp2728, 0              ; <i1> [#uses=1]
  br i1 %toBool29, label %bb30, label %bb32

bb30:                                             ; preds = %bb25
  %tmp31 = load double* @a8max, align 8           ; <double> [#uses=1]
  store double %tmp31, double* @a8rat, align 8
  br label %bb32

bb32:                                             ; preds = %bb30, %bb25
  %tmp33 = load double* @a8rat, align 8           ; <double> [#uses=1]
  %tmp34 = load double* @acore, align 8           ; <double> [#uses=1]
  %tmp35 = fmul double %tmp33, %tmp34             ; <double> [#uses=1]
  store double %tmp35, double* @a8, align 8
  %tmp36 = getelementptr [20 x double]* @prat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp37 = load double* %tmp36, align 8           ; <double> [#uses=1]
  %tmp38 = load double* @a8, align 8              ; <double> [#uses=1]
  %tmp39 = fmul double %tmp37, %tmp38             ; <double> [#uses=1]
  %tmp40 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp41 = load double* %tmp40, align 8           ; <double> [#uses=1]
  %tmp42 = call double @sqroot(double %tmp41) nounwind ; <double> [#uses=1]
  %tmp43 = fdiv double %tmp39, %tmp42             ; <double> [#uses=1]
  store double %tmp43, double* @a8d, align 8
  %tmp44 = getelementptr [20 x double]* @prat, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp45 = load double* %tmp44, align 8           ; <double> [#uses=1]
  %tmp46 = load double* @a8, align 8              ; <double> [#uses=1]
  %tmp47 = fmul double %tmp45, %tmp46             ; <double> [#uses=1]
  %tmp48 = getelementptr [20 x double]* @prat, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp49 = load double* %tmp48, align 8           ; <double> [#uses=1]
  %tmp50 = fmul double %tmp47, %tmp49             ; <double> [#uses=1]
  %tmp51 = getelementptr [20 x double]* @prat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp52 = load double* %tmp51, align 8           ; <double> [#uses=1]
  %tmp53 = fmul double %tmp50, %tmp52             ; <double> [#uses=1]
  %tmp54 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp55 = load double* %tmp54, align 8           ; <double> [#uses=1]
  %tmp56 = getelementptr [20 x double]* @trat, i32 0, i32 5 ; <double*> [#uses=1]
  %tmp57 = load double* %tmp56, align 8           ; <double> [#uses=1]
  %tmp58 = fmul double %tmp55, %tmp57             ; <double> [#uses=1]
  %tmp59 = getelementptr [20 x double]* @trat, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp60 = load double* %tmp59, align 8           ; <double> [#uses=1]
  %tmp61 = fmul double %tmp58, %tmp60             ; <double> [#uses=1]
  %tmp62 = call double @sqroot(double %tmp61) nounwind ; <double> [#uses=1]
  %tmp63 = fdiv double %tmp53, %tmp62             ; <double> [#uses=1]
  store double %tmp63, double* @a4, align 8
  %tmp64 = getelementptr [20 x double]* @prat, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp65 = load double* %tmp64, align 8           ; <double> [#uses=1]
  %tmp66 = load double* @a8, align 8              ; <double> [#uses=1]
  %tmp67 = fmul double %tmp65, %tmp66             ; <double> [#uses=1]
  %tmp68 = getelementptr [20 x double]* @prat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp69 = load double* %tmp68, align 8           ; <double> [#uses=1]
  %tmp70 = fmul double %tmp67, %tmp69             ; <double> [#uses=1]
  %tmp71 = getelementptr [20 x double]* @trat, i32 0, i32 7 ; <double*> [#uses=1]
  %tmp72 = load double* %tmp71, align 8           ; <double> [#uses=1]
  %tmp73 = getelementptr [20 x double]* @trat, i32 0, i32 15 ; <double*> [#uses=1]
  %tmp74 = load double* %tmp73, align 8           ; <double> [#uses=1]
  %tmp75 = fmul double %tmp72, %tmp74             ; <double> [#uses=1]
  %tmp76 = call double @sqroot(double %tmp75) nounwind ; <double> [#uses=1]
  %tmp77 = fdiv double %tmp70, %tmp76             ; <double> [#uses=1]
  store double %tmp77, double* @a4p, align 8
  %tmp78 = load double* @a2, align 8              ; <double> [#uses=1]
  %tmp79 = fmul double %tmp78, 9.000000e-01       ; <double> [#uses=1]
  store double %tmp79, double* @acap, align 8
  %tmp80 = load double* @p3p2d, align 8           ; <double> [#uses=1]
  %tmp81 = fdiv double %tmp80, 1.500000e+00       ; <double> [#uses=1]
  %tmp82 = fadd double %tmp81, 1.000000e+00       ; <double> [#uses=1]
  %tmp8283 = fptosi double %tmp82 to i32          ; <i32> [#uses=1]
  %tmp828384 = sitofp i32 %tmp8283 to double      ; <double> [#uses=1]
  store double %tmp828384, double* @ncomp, align 8
  %tmp85 = load double* @ncomp, align 8           ; <double> [#uses=1]
  %tmp86 = fcmp ogt double %tmp85, 1.500000e+01   ; <i1> [#uses=1]
  %tmp8687 = zext i1 %tmp86 to i8                 ; <i8> [#uses=1]
  %toBool88 = icmp ne i8 %tmp8687, 0              ; <i1> [#uses=1]
  br i1 %toBool88, label %bb89, label %bb90

bb89:                                             ; preds = %bb32
  store double 1.500000e+01, double* @ncomp, align 8
  br label %bb90

bb90:                                             ; preds = %bb89, %bb32
  store double 2.000000e-02, double* @sblade, align 8
  %tmp91 = call double @sqroot(double 0x3FE45F30739E4F68) nounwind ; <double> [#uses=1]
  store double %tmp91, double* @hblade, align 8
  %tmp92 = load double* @hblade, align 8          ; <double> [#uses=1]
  %tmp93 = fmul double %tmp92, 2.000000e-01       ; <double> [#uses=1]
  store double %tmp93, double* @tblade, align 8
  %tmp94 = load double* @tblade, align 8          ; <double> [#uses=1]
  %tmp95 = load double* @sblade, align 8          ; <double> [#uses=1]
  %tmp96 = fadd double %tmp94, %tmp95             ; <double> [#uses=1]
  %tmp97 = load double* @ncomp, align 8           ; <double> [#uses=1]
  %tmp98 = fmul double %tmp96, %tmp97             ; <double> [#uses=1]
  store double %tmp98, double* @xcomp, align 8
  %tmp99 = load double* @ncomp, align 8           ; <double> [#uses=1]
  store double %tmp99, double* @ncompd, align 8
  %tmp100 = load i32* @engine, align 4            ; <i32> [#uses=1]
  %tmp101 = icmp eq i32 %tmp100, 3                ; <i1> [#uses=1]
  %tmp101102 = zext i1 %tmp101 to i8              ; <i8> [#uses=1]
  %toBool103 = icmp ne i8 %tmp101102, 0           ; <i1> [#uses=1]
  br i1 %toBool103, label %bb104, label %bb112

bb104:                                            ; preds = %bb90
  %tmp105 = load double* @ncomp, align 8          ; <double> [#uses=1]
  %tmp106 = fadd double %tmp105, 3.000000e+00     ; <double> [#uses=1]
  store double %tmp106, double* @ncompd, align 8
  %tmp107 = load double* @tblade, align 8         ; <double> [#uses=1]
  %tmp108 = load double* @sblade, align 8         ; <double> [#uses=1]
  %tmp109 = fadd double %tmp107, %tmp108          ; <double> [#uses=1]
  %tmp110 = load double* @ncompd, align 8         ; <double> [#uses=1]
  %tmp111 = fmul double %tmp109, %tmp110          ; <double> [#uses=1]
  store double %tmp111, double* @xcomp, align 8
  br label %bb112

bb112:                                            ; preds = %bb104, %bb90
  %tmp113 = load double* @xcomp, align 8          ; <double> [#uses=1]
  store double %tmp113, double* @lcomp, align 8
  %tmp114 = load double* @hblade, align 8         ; <double> [#uses=1]
  store double %tmp114, double* @lburn, align 8
  %tmp115 = load double* @ncomp, align 8          ; <double> [#uses=1]
  %tmp116 = fdiv double %tmp115, 4.000000e+00     ; <double> [#uses=1]
  %tmp117 = fadd double %tmp116, 1.000000e+00     ; <double> [#uses=1]
  store double %tmp117, double* @nturb, align 8
  %tmp118 = load i32* @engine, align 4            ; <i32> [#uses=1]
  %tmp119 = icmp eq i32 %tmp118, 3                ; <i1> [#uses=1]
  %tmp119120 = zext i1 %tmp119 to i8              ; <i8> [#uses=1]
  %toBool121 = icmp ne i8 %tmp119120, 0           ; <i1> [#uses=1]
  br i1 %toBool121, label %bb122, label %bb125

bb122:                                            ; preds = %bb112
  %tmp123 = load double* @nturb, align 8          ; <double> [#uses=1]
  %tmp124 = fadd double %tmp123, 1.000000e+00     ; <double> [#uses=1]
  store double %tmp124, double* @nturb, align 8
  br label %bb125

bb125:                                            ; preds = %bb122, %bb112
  %tmp126 = load double* @tblade, align 8         ; <double> [#uses=1]
  %tmp127 = load double* @sblade, align 8         ; <double> [#uses=1]
  %tmp128 = fadd double %tmp126, %tmp127          ; <double> [#uses=1]
  %tmp129 = load double* @nturb, align 8          ; <double> [#uses=1]
  %tmp130 = fmul double %tmp128, %tmp129          ; <double> [#uses=1]
  store double %tmp130, double* @lturb, align 8
  %tmp131 = load double* @lburn, align 8          ; <double> [#uses=1]
  store double %tmp131, double* @lnoz, align 8
  %tmp132 = load i32* @engine, align 4            ; <i32> [#uses=1]
  %tmp133 = icmp eq i32 %tmp132, 2                ; <i1> [#uses=1]
  %tmp133134 = zext i1 %tmp133 to i8              ; <i8> [#uses=1]
  %toBool135 = icmp ne i8 %tmp133134, 0           ; <i1> [#uses=1]
  br i1 %toBool135, label %bb136, label %bb139

bb136:                                            ; preds = %bb125
  %tmp137 = load double* @lburn, align 8          ; <double> [#uses=1]
  %tmp138 = fmul double %tmp137, 3.000000e+00     ; <double> [#uses=1]
  store double %tmp138, double* @lnoz, align 8
  br label %bb139

bb139:                                            ; preds = %bb136, %bb125
  br label %return

return:                                           ; preds = %bb139
  ret void
}

define double @sqroot(double %number) {
entry:
  %number_addr = alloca double                    ; <double*> [#uses=4]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %prec = alloca double, align 8                  ; <double*> [#uses=4]
  %x = alloca double, align 8                     ; <double*> [#uses=5]
  %x0 = alloca double, align 8                    ; <double*> [#uses=5]
  %tmp = alloca double, align 8                   ; <double*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %number, double* %number_addr
  store double 1.000000e+00, double* %prec, align 8
  %tmp1 = load double* %number_addr, align 8      ; <double> [#uses=1]
  %tmp2 = fcmp olt double %tmp1, 0.000000e+00     ; <i1> [#uses=1]
  %tmp23 = zext i1 %tmp2 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp23, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb4

bb:                                               ; preds = %entry
  store double 0.000000e+00, double* %tmp, align 8
  br label %bb34

bb4:                                              ; preds = %entry
  %tmp5 = load double* %number_addr, align 8      ; <double> [#uses=1]
  %tmp6 = fadd double %tmp5, 1.000000e+00         ; <double> [#uses=1]
  %tmp7 = fdiv double %tmp6, 2.000000e+00         ; <double> [#uses=1]
  store double %tmp7, double* %x, align 8
  br label %bb21

bb8:                                              ; preds = %bb27, %bb21
  %tmp9 = load double* %x, align 8                ; <double> [#uses=1]
  store double %tmp9, double* %x0, align 8
  %tmp10 = load double* %number_addr, align 8     ; <double> [#uses=1]
  %tmp11 = load double* %x0, align 8              ; <double> [#uses=1]
  %tmp12 = fdiv double %tmp10, %tmp11             ; <double> [#uses=1]
  %tmp13 = load double* %x0, align 8              ; <double> [#uses=1]
  %tmp14 = fadd double %tmp12, %tmp13             ; <double> [#uses=1]
  %tmp15 = fmul double %tmp14, 5.000000e-01       ; <double> [#uses=1]
  store double %tmp15, double* %x, align 8
  %tmp16 = load double* %x, align 8               ; <double> [#uses=1]
  %tmp17 = load double* %x0, align 8              ; <double> [#uses=1]
  %tmp18 = fsub double %tmp16, %tmp17             ; <double> [#uses=1]
  %tmp19 = load double* %x0, align 8              ; <double> [#uses=1]
  %tmp20 = fdiv double %tmp18, %tmp19             ; <double> [#uses=1]
  store double %tmp20, double* %prec, align 8
  br label %bb21

bb21:                                             ; preds = %bb8, %bb4
  %tmp22 = load double* %prec, align 8            ; <double> [#uses=1]
  %tmp24 = fcmp ogt double %tmp22, 1.000000e-04   ; <i1> [#uses=1]
  %tmp2425 = zext i1 %tmp24 to i8                 ; <i8> [#uses=1]
  %toBool26 = icmp ne i8 %tmp2425, 0              ; <i1> [#uses=1]
  br i1 %toBool26, label %bb8, label %bb27

bb27:                                             ; preds = %bb21
  %tmp28 = load double* %prec, align 8            ; <double> [#uses=1]
  %tmp29 = fcmp olt double %tmp28, -1.000000e-04  ; <i1> [#uses=1]
  %tmp2930 = zext i1 %tmp29 to i8                 ; <i8> [#uses=1]
  %toBool31 = icmp ne i8 %tmp2930, 0              ; <i1> [#uses=1]
  br i1 %toBool31, label %bb8, label %bb32

bb32:                                             ; preds = %bb27
  %tmp33 = load double* %x, align 8               ; <double> [#uses=1]
  store double %tmp33, double* %tmp, align 8
  br label %bb34

bb34:                                             ; preds = %bb32, %bb
  %tmp35 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp35, double* %retval, align 8
  br label %return

return:                                           ; preds = %bb34
  %retval36 = load double* %retval                ; <double> [#uses=1]
  ret double %retval36
}

define double @fabs(double %x) nounwind readnone {
entry:
  %x_addr = alloca double                         ; <double*> [#uses=4]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %tmp = alloca double, align 8                   ; <double*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %x, double* %x_addr
  %tmp1 = load double* %x_addr, align 8           ; <double> [#uses=1]
  %tmp2 = fcmp olt double %tmp1, 0.000000e+00     ; <i1> [#uses=1]
  %tmp23 = zext i1 %tmp2 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp23, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb6

bb:                                               ; preds = %entry
  %tmp4 = load double* %x_addr, align 8           ; <double> [#uses=1]
  %tmp5 = fsub double -0.000000e+00, %tmp4        ; <double> [#uses=1]
  store double %tmp5, double* %tmp, align 8
  br label %bb8

bb6:                                              ; preds = %entry
  %tmp7 = load double* %x_addr, align 8           ; <double> [#uses=1]
  store double %tmp7, double* %tmp, align 8
  br label %bb8

bb8:                                              ; preds = %bb6, %bb
  %tmp9 = load double* %tmp, align 8              ; <double> [#uses=1]
  store double %tmp9, double* %retval, align 8
  br label %return

return:                                           ; preds = %bb8
  %retval10 = load double* %retval                ; <double> [#uses=1]
  ret double %retval10
}

define double @log(double %x) nounwind {
entry:
  %x_addr = alloca double                         ; <double*> [#uses=6]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %i = alloca i32                                 ; <i32*> [#uses=4]
  %coeff = alloca double, align 8                 ; <double*> [#uses=5]
  %number = alloca double, align 8                ; <double*> [#uses=4]
  %tmp = alloca double, align 8                   ; <double*> [#uses=5]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %x, double* %x_addr
  store double 0.000000e+00, double* %number, align 8
  store double -1.000000e+00, double* %coeff, align 8
  store i32 1, i32* %i, align 4
  %tmp1 = load double* %x_addr, align 8           ; <double> [#uses=1]
  %tmp2 = fcmp ole double %tmp1, 0.000000e+00     ; <i1> [#uses=1]
  %tmp23 = zext i1 %tmp2 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp23, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb4

bb:                                               ; preds = %entry
  store double 0.000000e+00, double* %tmp, align 8
  br label %bb43

bb4:                                              ; preds = %entry
  %tmp5 = load double* %x_addr, align 8           ; <double> [#uses=1]
  %tmp6 = fcmp oeq double %tmp5, 1.000000e+00     ; <i1> [#uses=1]
  %tmp67 = zext i1 %tmp6 to i8                    ; <i8> [#uses=1]
  %toBool8 = icmp ne i8 %tmp67, 0                 ; <i1> [#uses=1]
  br i1 %toBool8, label %bb9, label %bb10

bb9:                                              ; preds = %bb4
  store double 0.000000e+00, double* %tmp, align 8
  br label %bb43

bb10:                                             ; preds = %bb4
  %tmp11 = load double* %x_addr, align 8          ; <double> [#uses=1]
  %tmp12 = fcmp ogt double %tmp11, 1.000000e+00   ; <i1> [#uses=1]
  %tmp1213 = zext i1 %tmp12 to i8                 ; <i8> [#uses=1]
  %toBool14 = icmp ne i8 %tmp1213, 0              ; <i1> [#uses=1]
  br i1 %toBool14, label %bb15, label %bb20

bb15:                                             ; preds = %bb10
  %tmp16 = load double* %x_addr, align 8          ; <double> [#uses=1]
  %tmp17 = fdiv double 1.000000e+00, %tmp16       ; <double> [#uses=1]
  %tmp18 = call double @log(double %tmp17) nounwind ; <double> [#uses=1]
  %tmp19 = fsub double -0.000000e+00, %tmp18      ; <double> [#uses=1]
  store double %tmp19, double* %tmp, align 8
  br label %bb43

bb20:                                             ; preds = %bb10
  br label %bb35

bb21:                                             ; preds = %bb35
  %tmp22 = load double* %x_addr, align 8          ; <double> [#uses=1]
  %tmp24 = fsub double 1.000000e+00, %tmp22       ; <double> [#uses=1]
  %tmp25 = load double* %coeff, align 8           ; <double> [#uses=1]
  %tmp26 = fmul double %tmp24, %tmp25             ; <double> [#uses=1]
  store double %tmp26, double* %coeff, align 8
  %tmp27 = load i32* %i, align 4                  ; <i32> [#uses=1]
  %tmp2728 = sitofp i32 %tmp27 to double          ; <double> [#uses=1]
  %tmp29 = load double* %coeff, align 8           ; <double> [#uses=1]
  %tmp30 = fdiv double %tmp29, %tmp2728           ; <double> [#uses=1]
  %tmp31 = load double* %number, align 8          ; <double> [#uses=1]
  %tmp32 = fadd double %tmp30, %tmp31             ; <double> [#uses=1]
  store double %tmp32, double* %number, align 8
  %tmp33 = load i32* %i, align 4                  ; <i32> [#uses=1]
  %tmp34 = add i32 %tmp33, 1                      ; <i32> [#uses=1]
  store i32 %tmp34, i32* %i, align 4
  br label %bb35

bb35:                                             ; preds = %bb21, %bb20
  %tmp36 = load double* %coeff, align 8           ; <double> [#uses=1]
  %tmp37 = call double @fabs(double %tmp36)       ; <double> [#uses=1]
  %tmp38 = fcmp ogt double %tmp37, 1.000000e-04   ; <i1> [#uses=1]
  %tmp3839 = zext i1 %tmp38 to i8                 ; <i8> [#uses=1]
  %toBool40 = icmp ne i8 %tmp3839, 0              ; <i1> [#uses=1]
  br i1 %toBool40, label %bb21, label %bb41

bb41:                                             ; preds = %bb35
  %tmp42 = load double* %number, align 8          ; <double> [#uses=1]
  store double %tmp42, double* %tmp, align 8
  br label %bb43

bb43:                                             ; preds = %bb41, %bb15, %bb9, %bb
  %tmp44 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp44, double* %retval, align 8
  br label %return

return:                                           ; preds = %bb43
  %retval45 = load double* %retval                ; <double> [#uses=1]
  ret double %retval45
}

define double @expo(double %x) {
entry:
  %x_addr = alloca double                         ; <double*> [#uses=3]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %i = alloca i32                                 ; <i32*> [#uses=4]
  %coeff = alloca double, align 8                 ; <double*> [#uses=5]
  %number = alloca double, align 8                ; <double*> [#uses=4]
  %tmp = alloca double, align 8                   ; <double*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %x, double* %x_addr
  store double 1.000000e+00, double* %number, align 8
  store double 1.000000e+00, double* %coeff, align 8
  store i32 1, i32* %i, align 4
  %tmp1 = load double* %x_addr, align 8           ; <double> [#uses=1]
  %tmp2 = fcmp ogt double %tmp1, 0x40862E42FEFA39EF ; <i1> [#uses=1]
  %tmp23 = zext i1 %tmp2 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp23, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb5

bb:                                               ; preds = %entry
  %tmp4 = call double @expo(double 7.097800e+02) nounwind ; <double> [#uses=1]
  store double %tmp4, double* %tmp, align 8
  br label %bb26

bb5:                                              ; preds = %entry
  br label %bb18

bb6:                                              ; preds = %bb18
  %tmp7 = load i32* %i, align 4                   ; <i32> [#uses=1]
  %tmp78 = sitofp i32 %tmp7 to double             ; <double> [#uses=1]
  %tmp9 = load double* %x_addr, align 8           ; <double> [#uses=1]
  %tmp10 = fdiv double %tmp9, %tmp78              ; <double> [#uses=1]
  %tmp11 = load double* %coeff, align 8           ; <double> [#uses=1]
  %tmp12 = fmul double %tmp10, %tmp11             ; <double> [#uses=1]
  store double %tmp12, double* %coeff, align 8
  %tmp13 = load double* %number, align 8          ; <double> [#uses=1]
  %tmp14 = load double* %coeff, align 8           ; <double> [#uses=1]
  %tmp15 = fadd double %tmp13, %tmp14             ; <double> [#uses=1]
  store double %tmp15, double* %number, align 8
  %tmp16 = load i32* %i, align 4                  ; <i32> [#uses=1]
  %tmp17 = add i32 %tmp16, 1                      ; <i32> [#uses=1]
  store i32 %tmp17, i32* %i, align 4
  br label %bb18

bb18:                                             ; preds = %bb6, %bb5
  %tmp19 = load double* %coeff, align 8           ; <double> [#uses=1]
  %tmp20 = call double @fabs(double %tmp19)       ; <double> [#uses=1]
  %tmp21 = fcmp ogt double %tmp20, 1.000000e-04   ; <i1> [#uses=1]
  %tmp2122 = zext i1 %tmp21 to i8                 ; <i8> [#uses=1]
  %toBool23 = icmp ne i8 %tmp2122, 0              ; <i1> [#uses=1]
  br i1 %toBool23, label %bb6, label %bb24

bb24:                                             ; preds = %bb18
  %tmp25 = load double* %number, align 8          ; <double> [#uses=1]
  store double %tmp25, double* %tmp, align 8
  br label %bb26

bb26:                                             ; preds = %bb24, %bb
  %tmp27 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp27, double* %retval, align 8
  br label %return

return:                                           ; preds = %bb26
  %retval28 = load double* %retval                ; <double> [#uses=1]
  ret double %retval28
}

define double @fpow(double %x, double %y) {
entry:
  %x_addr = alloca double                         ; <double*> [#uses=6]
  %y_addr = alloca double                         ; <double*> [#uses=4]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %partieEntiere = alloca i32                     ; <i32*> [#uses=5]
  %tmp = alloca double, align 8                   ; <double*> [#uses=4]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %x, double* %x_addr
  store double %y, double* %y_addr
  %tmp1 = load double* %y_addr, align 8           ; <double> [#uses=1]
  %tmp12 = fptosi double %tmp1 to i32             ; <i32> [#uses=1]
  store i32 %tmp12, i32* %partieEntiere, align 4
  %tmp3 = load double* %x_addr, align 8           ; <double> [#uses=1]
  %tmp4 = fcmp uge double %tmp3, 0.000000e+00     ; <i1> [#uses=1]
  %tmp45 = zext i1 %tmp4 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp45, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb13, label %bb

bb:                                               ; preds = %entry
  %tmp6 = load i32* %partieEntiere, align 4       ; <i32> [#uses=1]
  %tmp67 = sitofp i32 %tmp6 to double             ; <double> [#uses=1]
  %tmp8 = load double* %y_addr, align 8           ; <double> [#uses=1]
  %tmp9 = fcmp oeq double %tmp67, %tmp8           ; <i1> [#uses=1]
  %tmp910 = zext i1 %tmp9 to i8                   ; <i8> [#uses=1]
  %toBool11 = icmp ne i8 %tmp910, 0               ; <i1> [#uses=1]
  br i1 %toBool11, label %bb13, label %bb12

bb12:                                             ; preds = %bb
  store double 0.000000e+00, double* %tmp, align 8
  br label %bb35

bb13:                                             ; preds = %bb, %entry
  %tmp14 = load double* %x_addr, align 8          ; <double> [#uses=1]
  %tmp15 = fcmp olt double %tmp14, 0.000000e+00   ; <i1> [#uses=1]
  %tmp1516 = zext i1 %tmp15 to i8                 ; <i8> [#uses=1]
  %toBool17 = icmp ne i8 %tmp1516, 0              ; <i1> [#uses=1]
  br i1 %toBool17, label %bb18, label %bb22

bb18:                                             ; preds = %bb13
  %tmp19 = load double* %x_addr, align 8          ; <double> [#uses=1]
  %tmp20 = load i32* %partieEntiere, align 4      ; <i32> [#uses=1]
  %tmp21 = call double @power(double %tmp19, i32 %tmp20) nounwind ; <double> [#uses=1]
  store double %tmp21, double* %tmp, align 8
  br label %bb35

bb22:                                             ; preds = %bb13
  %tmp23 = load double* %x_addr, align 8          ; <double> [#uses=1]
  %tmp24 = load i32* %partieEntiere, align 4      ; <i32> [#uses=1]
  %tmp25 = call double @power(double %tmp23, i32 %tmp24) nounwind ; <double> [#uses=1]
  %tmp26 = load i32* %partieEntiere, align 4      ; <i32> [#uses=1]
  %tmp2627 = sitofp i32 %tmp26 to double          ; <double> [#uses=1]
  %tmp28 = load double* %y_addr, align 8          ; <double> [#uses=1]
  %tmp29 = fsub double %tmp28, %tmp2627           ; <double> [#uses=1]
  %tmp30 = load double* %x_addr, align 8          ; <double> [#uses=1]
  %tmp31 = call double @log(double %tmp30) nounwind ; <double> [#uses=1]
  %tmp32 = fmul double %tmp29, %tmp31             ; <double> [#uses=1]
  %tmp33 = call double @expo(double %tmp32) nounwind ; <double> [#uses=1]
  %tmp34 = fmul double %tmp25, %tmp33             ; <double> [#uses=1]
  store double %tmp34, double* %tmp, align 8
  br label %bb35

bb35:                                             ; preds = %bb22, %bb18, %bb12
  %tmp36 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp36, double* %retval, align 8
  br label %return

return:                                           ; preds = %bb35
  %retval37 = load double* %retval                ; <double> [#uses=1]
  ret double %retval37
}

define double @power(double %x, i32 %y) {
entry:
  %x_addr = alloca double                         ; <double*> [#uses=3]
  %y_addr = alloca i32                            ; <i32*> [#uses=4]
  %retval = alloca double, align 8                ; <double*> [#uses=2]
  %i = alloca i32                                 ; <i32*> [#uses=4]
  %number = alloca double, align 8                ; <double*> [#uses=4]
  %tmp = alloca double, align 8                   ; <double*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store double %x, double* %x_addr
  store i32 %y, i32* %y_addr
  store double 1.000000e+00, double* %number, align 8
  %tmp1 = load i32* %y_addr, align 4              ; <i32> [#uses=1]
  %tmp2 = icmp slt i32 %tmp1, 0                   ; <i1> [#uses=1]
  %tmp23 = zext i1 %tmp2 to i8                    ; <i8> [#uses=1]
  %toBool = icmp ne i8 %tmp23, 0                  ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb9

bb:                                               ; preds = %entry
  %tmp4 = load i32* %y_addr, align 4              ; <i32> [#uses=1]
  %tmp5 = sub i32 0, %tmp4                        ; <i32> [#uses=1]
  %tmp6 = load double* %x_addr, align 8           ; <double> [#uses=1]
  %tmp7 = call double @power(double %tmp6, i32 %tmp5) nounwind ; <double> [#uses=1]
  %tmp8 = fdiv double 1.000000e+00, %tmp7         ; <double> [#uses=1]
  store double %tmp8, double* %tmp, align 8
  br label %bb25

bb9:                                              ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %bb16

bb10:                                             ; preds = %bb16
  %tmp11 = load double* %number, align 8          ; <double> [#uses=1]
  %tmp12 = load double* %x_addr, align 8          ; <double> [#uses=1]
  %tmp13 = fmul double %tmp11, %tmp12             ; <double> [#uses=1]
  store double %tmp13, double* %number, align 8
  %tmp14 = load i32* %i, align 4                  ; <i32> [#uses=1]
  %tmp15 = add i32 %tmp14, 1                      ; <i32> [#uses=1]
  store i32 %tmp15, i32* %i, align 4
  br label %bb16

bb16:                                             ; preds = %bb10, %bb9
  %tmp17 = load i32* %i, align 4                  ; <i32> [#uses=1]
  %tmp18 = load i32* %y_addr, align 4             ; <i32> [#uses=1]
  %tmp19 = icmp slt i32 %tmp17, %tmp18            ; <i1> [#uses=1]
  %tmp1920 = zext i1 %tmp19 to i8                 ; <i8> [#uses=1]
  %toBool21 = icmp ne i8 %tmp1920, 0              ; <i1> [#uses=1]
  br i1 %toBool21, label %bb10, label %bb22

bb22:                                             ; preds = %bb16
  %tmp24 = load double* %number, align 8          ; <double> [#uses=1]
  store double %tmp24, double* %tmp, align 8
  br label %bb25

bb25:                                             ; preds = %bb22, %bb
  %tmp26 = load double* %tmp, align 8             ; <double> [#uses=1]
  store double %tmp26, double* %retval, align 8
  br label %return

return:                                           ; preds = %bb25
  %retval27 = load double* %retval                ; <double> [#uses=1]
  ret double %retval27
}
