; ModuleID = 'rc5_core.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-apple-darwin8"

%struct.RC5_32_KEY = type { i32, [34 x i32] }

@.str = private unnamed_addr constant [7 x i8] c"RC5key\00", align 1
@RC5plain = internal unnamed_addr global [5 x [8 x i8]] [[8 x i8] zeroinitializer, [8 x i8] c"!\A5\DB\EE\15K\8Fm", [8 x i8] c"\F7\C0\13\AC[+\89R", [8 x i8] c"/B\B3\B7\03i\FC\92", [8 x i8] c"e\C1x\B2\84\D1\97\CC"], align 32

define void @RC5_32_cbc_encrypt(i8* nocapture %in, i8* nocapture %out, i64 %length, %struct.RC5_32_KEY* %ks, i8* %iv, i32 %encrypt) nounwind {
entry:
  %tin = alloca [2 x i64], align 8
  %0 = icmp eq i32 %encrypt, 0
  %1 = load i8* %iv, align 1
  %2 = zext i8 %1 to i64
  %3 = getelementptr inbounds i8* %iv, i64 1
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i64
  %6 = shl nuw nsw i64 %5, 8
  %7 = getelementptr inbounds i8* %iv, i64 2
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i64
  %10 = shl nuw nsw i64 %9, 16
  %11 = getelementptr inbounds i8* %iv, i64 3
  %12 = load i8* %11, align 1
  %13 = zext i8 %12 to i64
  %14 = shl nuw nsw i64 %13, 24
  %15 = or i64 %6, %2
  %16 = or i64 %15, %10
  %17 = or i64 %16, %14
  %18 = getelementptr inbounds i8* %iv, i64 4
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i64
  %21 = getelementptr inbounds i8* %iv, i64 5
  %22 = load i8* %21, align 1
  %23 = zext i8 %22 to i64
  %24 = shl nuw nsw i64 %23, 8
  %25 = getelementptr inbounds i8* %iv, i64 6
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i64
  %28 = shl nuw nsw i64 %27, 16
  %29 = getelementptr inbounds i8* %iv, i64 7
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i64
  %32 = shl nuw nsw i64 %31, 24
  %33 = or i64 %24, %20
  %34 = or i64 %33, %28
  %35 = or i64 %34, %32
  %l.153 = add nsw i64 %length, -8
  %36 = icmp sgt i64 %l.153, -1
  br i1 %0, label %bb20.preheader, label %bb3.preheader

bb20.preheader:                                   ; preds = %entry
  br i1 %36, label %bb18.lr.ph, label %bb21

bb18.lr.ph:                                       ; preds = %bb20.preheader
  %37 = getelementptr inbounds [2 x i64]* %tin, i64 0, i64 0
  %38 = getelementptr inbounds [2 x i64]* %tin, i64 0, i64 1
  %tmp105 = add i64 %length, -16
  br label %bb18

bb3.preheader:                                    ; preds = %entry
  br i1 %36, label %bb1.lr.ph, label %bb4

bb1.lr.ph:                                        ; preds = %bb3.preheader
  %39 = getelementptr inbounds [2 x i64]* %tin, i64 0, i64 0
  %40 = getelementptr inbounds [2 x i64]* %tin, i64 0, i64 1
  %tmp69 = add i64 %length, -16
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.lr.ph
  %indvar = phi i64 [ 0, %bb1.lr.ph ], [ %indvar.next, %bb1 ]
  %tout0.045 = phi i64 [ %17, %bb1.lr.ph ], [ %71, %bb1 ]
  %tout1.044 = phi i64 [ %35, %bb1.lr.ph ], [ %79, %bb1 ]
  %tmp = mul i64 %indvar, -8
  %l.0 = add i64 %tmp69, %tmp
  %tmp71 = shl i64 %indvar, 3
  %in_addr.047 = getelementptr i8* %in, i64 %tmp71
  %tmp72134 = or i64 %tmp71, 1
  %scevgep = getelementptr i8* %in, i64 %tmp72134
  %tmp73135 = or i64 %tmp71, 2
  %scevgep74 = getelementptr i8* %in, i64 %tmp73135
  %tmp75136 = or i64 %tmp71, 3
  %scevgep76 = getelementptr i8* %in, i64 %tmp75136
  %tmp77137 = or i64 %tmp71, 4
  %scevgep78 = getelementptr i8* %in, i64 %tmp77137
  %tmp79138 = or i64 %tmp71, 5
  %scevgep80 = getelementptr i8* %in, i64 %tmp79138
  %tmp81139 = or i64 %tmp71, 6
  %scevgep82 = getelementptr i8* %in, i64 %tmp81139
  %tmp83140 = or i64 %tmp71, 7
  %scevgep84 = getelementptr i8* %in, i64 %tmp83140
  %tmp85 = add i64 %tmp71, 8
  %out_addr.046 = getelementptr i8* %out, i64 %tmp71
  %scevgep88 = getelementptr i8* %out, i64 %tmp72134
  %scevgep89 = getelementptr i8* %out, i64 %tmp73135
  %scevgep90 = getelementptr i8* %out, i64 %tmp75136
  %scevgep91 = getelementptr i8* %out, i64 %tmp77137
  %scevgep92 = getelementptr i8* %out, i64 %tmp79138
  %scevgep93 = getelementptr i8* %out, i64 %tmp81139
  %scevgep94 = getelementptr i8* %out, i64 %tmp83140
  %41 = load i8* %in_addr.047, align 1
  %42 = zext i8 %41 to i64
  %43 = load i8* %scevgep, align 1
  %44 = zext i8 %43 to i64
  %45 = shl nuw nsw i64 %44, 8
  %46 = load i8* %scevgep74, align 1
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 16
  %49 = load i8* %scevgep76, align 1
  %50 = zext i8 %49 to i64
  %51 = shl nuw nsw i64 %50, 24
  %52 = or i64 %45, %42
  %53 = or i64 %52, %48
  %54 = or i64 %53, %51
  %55 = load i8* %scevgep78, align 1
  %56 = zext i8 %55 to i64
  %57 = load i8* %scevgep80, align 1
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 8
  %60 = load i8* %scevgep82, align 1
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 16
  %63 = load i8* %scevgep84, align 1
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 24
  %66 = or i64 %59, %56
  %67 = or i64 %66, %62
  %68 = or i64 %67, %65
  %69 = xor i64 %54, %tout0.045
  %70 = xor i64 %68, %tout1.044
  store i64 %69, i64* %39, align 8
  store i64 %70, i64* %40, align 8
  call void @RC5_32_encrypt(i64* %39, %struct.RC5_32_KEY* %ks) nounwind
  %71 = load i64* %39, align 8
  %72 = trunc i64 %71 to i8
  store i8 %72, i8* %out_addr.046, align 1
  %73 = lshr i64 %71, 8
  %74 = trunc i64 %73 to i8
  store i8 %74, i8* %scevgep88, align 1
  %75 = lshr i64 %71, 16
  %76 = trunc i64 %75 to i8
  store i8 %76, i8* %scevgep89, align 1
  %77 = lshr i64 %71, 24
  %78 = trunc i64 %77 to i8
  store i8 %78, i8* %scevgep90, align 1
  %79 = load i64* %40, align 8
  %80 = trunc i64 %79 to i8
  store i8 %80, i8* %scevgep91, align 1
  %81 = lshr i64 %79, 8
  %82 = trunc i64 %81 to i8
  store i8 %82, i8* %scevgep92, align 1
  %83 = lshr i64 %79, 16
  %84 = trunc i64 %83 to i8
  store i8 %84, i8* %scevgep93, align 1
  %85 = lshr i64 %79, 24
  %86 = trunc i64 %85 to i8
  store i8 %86, i8* %scevgep94, align 1
  %87 = icmp sgt i64 %l.0, -1
  %indvar.next = add i64 %indvar, 1
  br i1 %87, label %bb1, label %bb3.bb4_crit_edge

bb3.bb4_crit_edge:                                ; preds = %bb1
  %l.048 = add i64 %l.153, %tmp
  %scevgep86 = getelementptr i8* %in, i64 %tmp85
  %scevgep95 = getelementptr i8* %out, i64 %tmp85
  br label %bb4

bb4:                                              ; preds = %bb3.bb4_crit_edge, %bb3.preheader
  %in_addr.0.lcssa = phi i8* [ %scevgep86, %bb3.bb4_crit_edge ], [ %in, %bb3.preheader ]
  %out_addr.0.lcssa = phi i8* [ %scevgep95, %bb3.bb4_crit_edge ], [ %out, %bb3.preheader ]
  %l.0.in.lcssa = phi i64 [ %l.048, %bb3.bb4_crit_edge ], [ %length, %bb3.preheader ]
  %tout0.0.lcssa = phi i64 [ %71, %bb3.bb4_crit_edge ], [ %17, %bb3.preheader ]
  %tout1.0.lcssa = phi i64 [ %79, %bb3.bb4_crit_edge ], [ %35, %bb3.preheader ]
  %88 = icmp eq i64 %l.0.in.lcssa, 0
  br i1 %88, label %bb34, label %bb5

bb5:                                              ; preds = %bb4
  %89 = getelementptr inbounds i8* %in_addr.0.lcssa, i64 %l.0.in.lcssa
  switch i64 %l.0.in.lcssa, label %bb14 [
    i64 1, label %bb13
    i64 2, label %bb12
    i64 3, label %bb11
    i64 4, label %bb10
    i64 5, label %bb9
    i64 6, label %bb8
    i64 7, label %bb7
    i64 8, label %bb6
  ]

bb6:                                              ; preds = %bb5
  %.sum35 = add i64 %l.0.in.lcssa, -1
  %90 = getelementptr inbounds i8* %in_addr.0.lcssa, i64 %.sum35
  %91 = load i8* %90, align 1
  %92 = zext i8 %91 to i64
  %93 = shl nuw nsw i64 %92, 24
  br label %bb7

bb7:                                              ; preds = %bb6, %bb5
  %tin1.0 = phi i64 [ %93, %bb6 ], [ 0, %bb5 ]
  %in_addr.1 = phi i8* [ %90, %bb6 ], [ %89, %bb5 ]
  %94 = getelementptr inbounds i8* %in_addr.1, i64 -1
  %95 = load i8* %94, align 1
  %96 = zext i8 %95 to i64
  %97 = shl nuw nsw i64 %96, 16
  %98 = or i64 %97, %tin1.0
  br label %bb8

bb8:                                              ; preds = %bb7, %bb5
  %tin1.1 = phi i64 [ %98, %bb7 ], [ 0, %bb5 ]
  %in_addr.2 = phi i8* [ %94, %bb7 ], [ %89, %bb5 ]
  %99 = getelementptr inbounds i8* %in_addr.2, i64 -1
  %100 = load i8* %99, align 1
  %101 = zext i8 %100 to i64
  %102 = shl nuw nsw i64 %101, 8
  %103 = or i64 %102, %tin1.1
  br label %bb9

bb9:                                              ; preds = %bb8, %bb5
  %tin1.2 = phi i64 [ %103, %bb8 ], [ 0, %bb5 ]
  %in_addr.3 = phi i8* [ %99, %bb8 ], [ %89, %bb5 ]
  %104 = getelementptr inbounds i8* %in_addr.3, i64 -1
  %105 = load i8* %104, align 1
  %106 = zext i8 %105 to i64
  %107 = or i64 %106, %tin1.2
  br label %bb10

bb10:                                             ; preds = %bb9, %bb5
  %tin1.3 = phi i64 [ %107, %bb9 ], [ 0, %bb5 ]
  %in_addr.4 = phi i8* [ %104, %bb9 ], [ %89, %bb5 ]
  %108 = getelementptr inbounds i8* %in_addr.4, i64 -1
  %109 = load i8* %108, align 1
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 24
  br label %bb11

bb11:                                             ; preds = %bb10, %bb5
  %tin1.4 = phi i64 [ %tin1.3, %bb10 ], [ 0, %bb5 ]
  %tin0.0 = phi i64 [ %111, %bb10 ], [ 0, %bb5 ]
  %in_addr.5 = phi i8* [ %108, %bb10 ], [ %89, %bb5 ]
  %112 = getelementptr inbounds i8* %in_addr.5, i64 -1
  %113 = load i8* %112, align 1
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 16
  %116 = or i64 %115, %tin0.0
  br label %bb12

bb12:                                             ; preds = %bb11, %bb5
  %tin1.5 = phi i64 [ %tin1.4, %bb11 ], [ 0, %bb5 ]
  %tin0.1 = phi i64 [ %116, %bb11 ], [ 0, %bb5 ]
  %in_addr.6 = phi i8* [ %112, %bb11 ], [ %89, %bb5 ]
  %117 = getelementptr inbounds i8* %in_addr.6, i64 -1
  %118 = load i8* %117, align 1
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 8
  %121 = or i64 %120, %tin0.1
  br label %bb13

bb13:                                             ; preds = %bb12, %bb5
  %tin1.6 = phi i64 [ %tin1.5, %bb12 ], [ 0, %bb5 ]
  %tin0.2 = phi i64 [ %121, %bb12 ], [ 0, %bb5 ]
  %in_addr.7 = phi i8* [ %117, %bb12 ], [ %89, %bb5 ]
  %122 = getelementptr inbounds i8* %in_addr.7, i64 -1
  %123 = load i8* %122, align 1
  %124 = zext i8 %123 to i64
  %125 = or i64 %124, %tin0.2
  br label %bb14

bb14:                                             ; preds = %bb13, %bb5
  %tin1.7 = phi i64 [ 0, %bb5 ], [ %tin1.6, %bb13 ]
  %tin0.3 = phi i64 [ 0, %bb5 ], [ %125, %bb13 ]
  %126 = xor i64 %tin0.3, %tout0.0.lcssa
  %127 = xor i64 %tin1.7, %tout1.0.lcssa
  %128 = getelementptr inbounds [2 x i64]* %tin, i64 0, i64 0
  store i64 %126, i64* %128, align 8
  %129 = getelementptr inbounds [2 x i64]* %tin, i64 0, i64 1
  store i64 %127, i64* %129, align 8
  call void @RC5_32_encrypt(i64* %128, %struct.RC5_32_KEY* %ks) nounwind
  %130 = load i64* %128, align 8
  %131 = trunc i64 %130 to i8
  store i8 %131, i8* %out_addr.0.lcssa, align 1
  %132 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 1
  %133 = lshr i64 %130, 8
  %134 = trunc i64 %133 to i8
  store i8 %134, i8* %132, align 1
  %135 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 2
  %136 = lshr i64 %130, 16
  %137 = trunc i64 %136 to i8
  store i8 %137, i8* %135, align 1
  %138 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 3
  %139 = lshr i64 %130, 24
  %140 = trunc i64 %139 to i8
  store i8 %140, i8* %138, align 1
  %141 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 4
  %142 = load i64* %129, align 8
  %143 = trunc i64 %142 to i8
  store i8 %143, i8* %141, align 1
  %144 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 5
  %145 = lshr i64 %142, 8
  %146 = trunc i64 %145 to i8
  store i8 %146, i8* %144, align 1
  %147 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 6
  %148 = lshr i64 %142, 16
  %149 = trunc i64 %148 to i8
  store i8 %149, i8* %147, align 1
  %150 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 7
  %151 = lshr i64 %142, 24
  %152 = trunc i64 %151 to i8
  store i8 %152, i8* %150, align 1
  br label %bb34

bb18:                                             ; preds = %bb18, %bb18.lr.ph
  %indvar100 = phi i64 [ 0, %bb18.lr.ph ], [ %indvar.next101, %bb18 ]
  %xor1.055 = phi i64 [ %35, %bb18.lr.ph ], [ %180, %bb18 ]
  %xor0.054 = phi i64 [ %17, %bb18.lr.ph ], [ %166, %bb18 ]
  %tmp102 = mul i64 %indvar100, -8
  %l.1 = add i64 %tmp105, %tmp102
  %tmp107 = shl i64 %indvar100, 3
  %in_addr.857 = getelementptr i8* %in, i64 %tmp107
  %tmp109141 = or i64 %tmp107, 1
  %scevgep110 = getelementptr i8* %in, i64 %tmp109141
  %tmp111142 = or i64 %tmp107, 2
  %scevgep112 = getelementptr i8* %in, i64 %tmp111142
  %tmp113143 = or i64 %tmp107, 3
  %scevgep114 = getelementptr i8* %in, i64 %tmp113143
  %tmp115144 = or i64 %tmp107, 4
  %scevgep116 = getelementptr i8* %in, i64 %tmp115144
  %tmp117145 = or i64 %tmp107, 5
  %scevgep118 = getelementptr i8* %in, i64 %tmp117145
  %tmp119146 = or i64 %tmp107, 6
  %scevgep120 = getelementptr i8* %in, i64 %tmp119146
  %tmp121147 = or i64 %tmp107, 7
  %scevgep122 = getelementptr i8* %in, i64 %tmp121147
  %tmp123 = add i64 %tmp107, 8
  %out_addr.156 = getelementptr i8* %out, i64 %tmp107
  %scevgep126 = getelementptr i8* %out, i64 %tmp109141
  %scevgep127 = getelementptr i8* %out, i64 %tmp111142
  %scevgep128 = getelementptr i8* %out, i64 %tmp113143
  %scevgep129 = getelementptr i8* %out, i64 %tmp115144
  %scevgep130 = getelementptr i8* %out, i64 %tmp117145
  %scevgep131 = getelementptr i8* %out, i64 %tmp119146
  %scevgep132 = getelementptr i8* %out, i64 %tmp121147
  %153 = load i8* %in_addr.857, align 1
  %154 = zext i8 %153 to i64
  %155 = load i8* %scevgep110, align 1
  %156 = zext i8 %155 to i64
  %157 = shl nuw nsw i64 %156, 8
  %158 = load i8* %scevgep112, align 1
  %159 = zext i8 %158 to i64
  %160 = shl nuw nsw i64 %159, 16
  %161 = load i8* %scevgep114, align 1
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 24
  %164 = or i64 %157, %154
  %165 = or i64 %164, %160
  %166 = or i64 %165, %163
  store i64 %166, i64* %37, align 8
  %167 = load i8* %scevgep116, align 1
  %168 = zext i8 %167 to i64
  %169 = load i8* %scevgep118, align 1
  %170 = zext i8 %169 to i64
  %171 = shl nuw nsw i64 %170, 8
  %172 = load i8* %scevgep120, align 1
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 16
  %175 = load i8* %scevgep122, align 1
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 24
  %178 = or i64 %171, %168
  %179 = or i64 %178, %174
  %180 = or i64 %179, %177
  store i64 %180, i64* %38, align 8
  call void @RC5_32_decrypt(i64* %37, %struct.RC5_32_KEY* %ks) nounwind
  %181 = load i64* %37, align 8
  %182 = xor i64 %181, %xor0.054
  %183 = load i64* %38, align 8
  %184 = xor i64 %183, %xor1.055
  %185 = trunc i64 %182 to i8
  store i8 %185, i8* %out_addr.156, align 1
  %186 = lshr i64 %182, 8
  %187 = trunc i64 %186 to i8
  store i8 %187, i8* %scevgep126, align 1
  %188 = lshr i64 %182, 16
  %189 = trunc i64 %188 to i8
  store i8 %189, i8* %scevgep127, align 1
  %190 = lshr i64 %182, 24
  %191 = trunc i64 %190 to i8
  store i8 %191, i8* %scevgep128, align 1
  %192 = trunc i64 %184 to i8
  store i8 %192, i8* %scevgep129, align 1
  %193 = lshr i64 %184, 8
  %194 = trunc i64 %193 to i8
  store i8 %194, i8* %scevgep130, align 1
  %195 = lshr i64 %184, 16
  %196 = trunc i64 %195 to i8
  store i8 %196, i8* %scevgep131, align 1
  %197 = lshr i64 %184, 24
  %198 = trunc i64 %197 to i8
  store i8 %198, i8* %scevgep132, align 1
  %199 = icmp sgt i64 %l.1, -1
  %indvar.next101 = add i64 %indvar100, 1
  br i1 %199, label %bb18, label %bb20.bb21_crit_edge

bb20.bb21_crit_edge:                              ; preds = %bb18
  %l.158 = add i64 %l.153, %tmp102
  %scevgep124 = getelementptr i8* %in, i64 %tmp123
  %scevgep133 = getelementptr i8* %out, i64 %tmp123
  br label %bb21

bb21:                                             ; preds = %bb20.bb21_crit_edge, %bb20.preheader
  %in_addr.8.lcssa = phi i8* [ %scevgep124, %bb20.bb21_crit_edge ], [ %in, %bb20.preheader ]
  %out_addr.1.lcssa = phi i8* [ %scevgep133, %bb20.bb21_crit_edge ], [ %out, %bb20.preheader ]
  %l.1.in.lcssa = phi i64 [ %l.158, %bb20.bb21_crit_edge ], [ %length, %bb20.preheader ]
  %xor1.0.lcssa = phi i64 [ %180, %bb20.bb21_crit_edge ], [ %35, %bb20.preheader ]
  %xor0.0.lcssa = phi i64 [ %166, %bb20.bb21_crit_edge ], [ %17, %bb20.preheader ]
  %200 = icmp eq i64 %l.1.in.lcssa, 0
  br i1 %200, label %bb34, label %bb22

bb22:                                             ; preds = %bb21
  %201 = load i8* %in_addr.8.lcssa, align 1
  %202 = zext i8 %201 to i64
  %203 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 1
  %204 = load i8* %203, align 1
  %205 = zext i8 %204 to i64
  %206 = shl nuw nsw i64 %205, 8
  %207 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 2
  %208 = load i8* %207, align 1
  %209 = zext i8 %208 to i64
  %210 = shl nuw nsw i64 %209, 16
  %211 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 3
  %212 = load i8* %211, align 1
  %213 = zext i8 %212 to i64
  %214 = shl nuw nsw i64 %213, 24
  %215 = or i64 %206, %202
  %216 = or i64 %215, %210
  %217 = or i64 %216, %214
  %218 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 4
  %219 = getelementptr inbounds [2 x i64]* %tin, i64 0, i64 0
  store i64 %217, i64* %219, align 8
  %220 = load i8* %218, align 1
  %221 = zext i8 %220 to i64
  %222 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 5
  %223 = load i8* %222, align 1
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 8
  %226 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 6
  %227 = load i8* %226, align 1
  %228 = zext i8 %227 to i64
  %229 = shl nuw nsw i64 %228, 16
  %230 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 7
  %231 = load i8* %230, align 1
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 24
  %234 = or i64 %225, %221
  %235 = or i64 %234, %229
  %236 = or i64 %235, %233
  %237 = getelementptr inbounds [2 x i64]* %tin, i64 0, i64 1
  store i64 %236, i64* %237, align 8
  call void @RC5_32_decrypt(i64* %219, %struct.RC5_32_KEY* %ks) nounwind
  %238 = load i64* %219, align 8
  %239 = xor i64 %238, %xor0.0.lcssa
  %240 = load i64* %237, align 8
  %241 = xor i64 %240, %xor1.0.lcssa
  %242 = getelementptr inbounds i8* %out_addr.1.lcssa, i64 %l.1.in.lcssa
  switch i64 %l.1.in.lcssa, label %bb34 [
    i64 1, label %bb31
    i64 2, label %bb30
    i64 3, label %bb29
    i64 4, label %bb28
    i64 5, label %bb27
    i64 6, label %bb26
    i64 7, label %bb25
    i64 8, label %bb24
  ]

bb24:                                             ; preds = %bb22
  %.sum = add i64 %l.1.in.lcssa, -1
  %243 = getelementptr inbounds i8* %out_addr.1.lcssa, i64 %.sum
  %244 = lshr i64 %241, 24
  %245 = trunc i64 %244 to i8
  store i8 %245, i8* %243, align 1
  br label %bb25

bb25:                                             ; preds = %bb24, %bb22
  %out_addr.2 = phi i8* [ %243, %bb24 ], [ %242, %bb22 ]
  %246 = getelementptr inbounds i8* %out_addr.2, i64 -1
  %247 = lshr i64 %241, 16
  %248 = trunc i64 %247 to i8
  store i8 %248, i8* %246, align 1
  br label %bb26

bb26:                                             ; preds = %bb25, %bb22
  %out_addr.3 = phi i8* [ %246, %bb25 ], [ %242, %bb22 ]
  %249 = getelementptr inbounds i8* %out_addr.3, i64 -1
  %250 = lshr i64 %241, 8
  %251 = trunc i64 %250 to i8
  store i8 %251, i8* %249, align 1
  br label %bb27

bb27:                                             ; preds = %bb26, %bb22
  %out_addr.4 = phi i8* [ %249, %bb26 ], [ %242, %bb22 ]
  %252 = getelementptr inbounds i8* %out_addr.4, i64 -1
  %253 = trunc i64 %241 to i8
  store i8 %253, i8* %252, align 1
  br label %bb28

bb28:                                             ; preds = %bb27, %bb22
  %out_addr.5 = phi i8* [ %252, %bb27 ], [ %242, %bb22 ]
  %254 = getelementptr inbounds i8* %out_addr.5, i64 -1
  %255 = lshr i64 %239, 24
  %256 = trunc i64 %255 to i8
  store i8 %256, i8* %254, align 1
  br label %bb29

bb29:                                             ; preds = %bb28, %bb22
  %out_addr.6 = phi i8* [ %254, %bb28 ], [ %242, %bb22 ]
  %257 = getelementptr inbounds i8* %out_addr.6, i64 -1
  %258 = lshr i64 %239, 16
  %259 = trunc i64 %258 to i8
  store i8 %259, i8* %257, align 1
  br label %bb30

bb30:                                             ; preds = %bb29, %bb22
  %out_addr.7 = phi i8* [ %257, %bb29 ], [ %242, %bb22 ]
  %260 = getelementptr inbounds i8* %out_addr.7, i64 -1
  %261 = lshr i64 %239, 8
  %262 = trunc i64 %261 to i8
  store i8 %262, i8* %260, align 1
  br label %bb31

bb31:                                             ; preds = %bb30, %bb22
  %out_addr.8 = phi i8* [ %260, %bb30 ], [ %242, %bb22 ]
  %263 = getelementptr inbounds i8* %out_addr.8, i64 -1
  %264 = trunc i64 %239 to i8
  store i8 %264, i8* %263, align 1
  br label %bb34

bb34:                                             ; preds = %bb31, %bb22, %bb21, %bb14, %bb4
  %storemerge42.in = phi i64 [ %130, %bb14 ], [ %tout0.0.lcssa, %bb4 ], [ %xor0.0.lcssa, %bb21 ], [ %217, %bb31 ], [ %217, %bb22 ]
  %storemerge38.in = phi i64 [ %142, %bb14 ], [ %tout1.0.lcssa, %bb4 ], [ %xor1.0.lcssa, %bb21 ], [ %236, %bb31 ], [ %236, %bb22 ]
  %storemerge42 = trunc i64 %storemerge42.in to i8
  store i8 %storemerge42, i8* %iv, align 1
  %storemerge41.in = lshr i64 %storemerge42.in, 8
  %storemerge41 = trunc i64 %storemerge41.in to i8
  store i8 %storemerge41, i8* %3, align 1
  %storemerge40.in = lshr i64 %storemerge42.in, 16
  %storemerge40 = trunc i64 %storemerge40.in to i8
  store i8 %storemerge40, i8* %7, align 1
  %storemerge39.in = lshr i64 %storemerge42.in, 24
  %storemerge39 = trunc i64 %storemerge39.in to i8
  store i8 %storemerge39, i8* %11, align 1
  %storemerge38 = trunc i64 %storemerge38.in to i8
  store i8 %storemerge38, i8* %18, align 1
  %storemerge37.in = lshr i64 %storemerge38.in, 8
  %storemerge37 = trunc i64 %storemerge37.in to i8
  store i8 %storemerge37, i8* %21, align 1
  %storemerge36.in = lshr i64 %storemerge38.in, 16
  %storemerge36 = trunc i64 %storemerge36.in to i8
  store i8 %storemerge36, i8* %25, align 1
  %storemerge.in = lshr i64 %storemerge38.in, 24
  %storemerge = trunc i64 %storemerge.in to i8
  store i8 %storemerge, i8* %29, align 1
  ret void
}

define void @RC5_32_encrypt(i64* nocapture %d, %struct.RC5_32_KEY* %key) nounwind {
entry:
  %0 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 0
  %1 = load i64* %d, align 8
  %2 = trunc i64 %1 to i32
  %3 = load i32* %0, align 4
  %4 = add i32 %2, %3
  %5 = getelementptr inbounds i64* %d, i64 1
  %6 = load i64* %5, align 8
  %7 = trunc i64 %6 to i32
  %8 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 1
  %9 = load i32* %8, align 4
  %10 = add i32 %7, %9
  %11 = xor i32 %10, %4
  %12 = and i32 %10, 31
  %13 = shl i32 %11, %12
  %14 = sub i32 0, %10
  %15 = and i32 %14, 31
  %16 = lshr i32 %11, %15
  %17 = or i32 %13, %16
  %18 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 2
  %19 = load i32* %18, align 4
  %20 = add i32 %17, %19
  %21 = xor i32 %20, %10
  %22 = and i32 %20, 31
  %23 = shl i32 %21, %22
  %24 = sub i32 0, %20
  %25 = and i32 %24, 31
  %26 = lshr i32 %21, %25
  %27 = or i32 %23, %26
  %28 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 3
  %29 = load i32* %28, align 4
  %30 = add i32 %27, %29
  %31 = xor i32 %30, %20
  %32 = and i32 %30, 31
  %33 = shl i32 %31, %32
  %34 = sub i32 0, %30
  %35 = and i32 %34, 31
  %36 = lshr i32 %31, %35
  %37 = or i32 %33, %36
  %38 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 4
  %39 = load i32* %38, align 4
  %40 = add i32 %37, %39
  %41 = xor i32 %40, %30
  %42 = and i32 %40, 31
  %43 = shl i32 %41, %42
  %44 = sub i32 0, %40
  %45 = and i32 %44, 31
  %46 = lshr i32 %41, %45
  %47 = or i32 %43, %46
  %48 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 5
  %49 = load i32* %48, align 4
  %50 = add i32 %47, %49
  %51 = xor i32 %50, %40
  %52 = and i32 %50, 31
  %53 = shl i32 %51, %52
  %54 = sub i32 0, %50
  %55 = and i32 %54, 31
  %56 = lshr i32 %51, %55
  %57 = or i32 %53, %56
  %58 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 6
  %59 = load i32* %58, align 4
  %60 = add i32 %57, %59
  %61 = xor i32 %60, %50
  %62 = and i32 %60, 31
  %63 = shl i32 %61, %62
  %64 = sub i32 0, %60
  %65 = and i32 %64, 31
  %66 = lshr i32 %61, %65
  %67 = or i32 %63, %66
  %68 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 7
  %69 = load i32* %68, align 4
  %70 = add i32 %67, %69
  %71 = xor i32 %70, %60
  %72 = and i32 %70, 31
  %73 = shl i32 %71, %72
  %74 = sub i32 0, %70
  %75 = and i32 %74, 31
  %76 = lshr i32 %71, %75
  %77 = or i32 %73, %76
  %78 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 8
  %79 = load i32* %78, align 4
  %80 = add i32 %77, %79
  %81 = xor i32 %80, %70
  %82 = and i32 %80, 31
  %83 = shl i32 %81, %82
  %84 = sub i32 0, %80
  %85 = and i32 %84, 31
  %86 = lshr i32 %81, %85
  %87 = or i32 %83, %86
  %88 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 9
  %89 = load i32* %88, align 4
  %90 = add i32 %87, %89
  %91 = xor i32 %90, %80
  %92 = and i32 %90, 31
  %93 = shl i32 %91, %92
  %94 = sub i32 0, %90
  %95 = and i32 %94, 31
  %96 = lshr i32 %91, %95
  %97 = or i32 %93, %96
  %98 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 10
  %99 = load i32* %98, align 4
  %100 = add i32 %97, %99
  %101 = xor i32 %100, %90
  %102 = and i32 %100, 31
  %103 = shl i32 %101, %102
  %104 = sub i32 0, %100
  %105 = and i32 %104, 31
  %106 = lshr i32 %101, %105
  %107 = or i32 %103, %106
  %108 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 11
  %109 = load i32* %108, align 4
  %110 = add i32 %107, %109
  %111 = xor i32 %110, %100
  %112 = and i32 %110, 31
  %113 = shl i32 %111, %112
  %114 = sub i32 0, %110
  %115 = and i32 %114, 31
  %116 = lshr i32 %111, %115
  %117 = or i32 %113, %116
  %118 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 12
  %119 = load i32* %118, align 4
  %120 = add i32 %117, %119
  %121 = xor i32 %120, %110
  %122 = and i32 %120, 31
  %123 = shl i32 %121, %122
  %124 = sub i32 0, %120
  %125 = and i32 %124, 31
  %126 = lshr i32 %121, %125
  %127 = or i32 %123, %126
  %128 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 13
  %129 = load i32* %128, align 4
  %130 = add i32 %127, %129
  %131 = xor i32 %130, %120
  %132 = and i32 %130, 31
  %133 = shl i32 %131, %132
  %134 = sub i32 0, %130
  %135 = and i32 %134, 31
  %136 = lshr i32 %131, %135
  %137 = or i32 %133, %136
  %138 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 14
  %139 = load i32* %138, align 4
  %140 = add i32 %137, %139
  %141 = xor i32 %140, %130
  %142 = and i32 %140, 31
  %143 = shl i32 %141, %142
  %144 = sub i32 0, %140
  %145 = and i32 %144, 31
  %146 = lshr i32 %141, %145
  %147 = or i32 %143, %146
  %148 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 15
  %149 = load i32* %148, align 4
  %150 = add i32 %147, %149
  %151 = xor i32 %150, %140
  %152 = and i32 %150, 31
  %153 = shl i32 %151, %152
  %154 = sub i32 0, %150
  %155 = and i32 %154, 31
  %156 = lshr i32 %151, %155
  %157 = or i32 %153, %156
  %158 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 16
  %159 = load i32* %158, align 4
  %160 = add i32 %157, %159
  %161 = xor i32 %160, %150
  %162 = and i32 %160, 31
  %163 = shl i32 %161, %162
  %164 = sub i32 0, %160
  %165 = and i32 %164, 31
  %166 = lshr i32 %161, %165
  %167 = or i32 %163, %166
  %168 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 17
  %169 = load i32* %168, align 4
  %170 = add i32 %167, %169
  %171 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 0
  %172 = load i32* %171, align 4
  switch i32 %172, label %bb3 [
    i32 12, label %bb
    i32 16, label %bb2
  ]

bb:                                               ; preds = %entry
  %173 = xor i32 %170, %160
  %174 = and i32 %170, 31
  %175 = shl i32 %173, %174
  %176 = sub i32 0, %170
  %177 = and i32 %176, 31
  %178 = lshr i32 %173, %177
  %179 = or i32 %175, %178
  %180 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 18
  %181 = load i32* %180, align 4
  %182 = add i32 %181, %179
  %183 = xor i32 %182, %170
  %184 = and i32 %182, 31
  %185 = shl i32 %183, %184
  %186 = sub i32 0, %182
  %187 = and i32 %186, 31
  %188 = lshr i32 %183, %187
  %189 = or i32 %185, %188
  %190 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 19
  %191 = load i32* %190, align 4
  %192 = add i32 %189, %191
  %193 = xor i32 %192, %182
  %194 = and i32 %192, 31
  %195 = shl i32 %193, %194
  %196 = sub i32 0, %192
  %197 = and i32 %196, 31
  %198 = lshr i32 %193, %197
  %199 = or i32 %195, %198
  %200 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 20
  %201 = load i32* %200, align 4
  %202 = add i32 %199, %201
  %203 = xor i32 %202, %192
  %204 = and i32 %202, 31
  %205 = shl i32 %203, %204
  %206 = sub i32 0, %202
  %207 = and i32 %206, 31
  %208 = lshr i32 %203, %207
  %209 = or i32 %205, %208
  %210 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 21
  %211 = load i32* %210, align 4
  %212 = add i32 %209, %211
  %213 = xor i32 %212, %202
  %214 = and i32 %212, 31
  %215 = shl i32 %213, %214
  %216 = sub i32 0, %212
  %217 = and i32 %216, 31
  %218 = lshr i32 %213, %217
  %219 = or i32 %215, %218
  %220 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 22
  %221 = load i32* %220, align 4
  %222 = add i32 %219, %221
  %223 = xor i32 %222, %212
  %224 = and i32 %222, 31
  %225 = shl i32 %223, %224
  %226 = sub i32 0, %222
  %227 = and i32 %226, 31
  %228 = lshr i32 %223, %227
  %229 = or i32 %225, %228
  %230 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 23
  %231 = load i32* %230, align 4
  %232 = add i32 %229, %231
  %233 = xor i32 %232, %222
  %234 = and i32 %232, 31
  %235 = shl i32 %233, %234
  %236 = sub i32 0, %232
  %237 = and i32 %236, 31
  %238 = lshr i32 %233, %237
  %239 = or i32 %235, %238
  %240 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 24
  %241 = load i32* %240, align 4
  %242 = add i32 %239, %241
  %243 = xor i32 %242, %232
  %244 = and i32 %242, 31
  %245 = shl i32 %243, %244
  %246 = sub i32 0, %242
  %247 = and i32 %246, 31
  %248 = lshr i32 %243, %247
  %249 = or i32 %245, %248
  %250 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 25
  %251 = load i32* %250, align 4
  %252 = add i32 %249, %251
  br label %bb3

bb2:                                              ; preds = %entry
  %253 = xor i32 %170, %160
  %254 = and i32 %170, 31
  %255 = shl i32 %253, %254
  %256 = sub i32 0, %170
  %257 = and i32 %256, 31
  %258 = lshr i32 %253, %257
  %259 = or i32 %255, %258
  %260 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 18
  %261 = load i32* %260, align 4
  %262 = add i32 %261, %259
  %263 = xor i32 %262, %170
  %264 = and i32 %262, 31
  %265 = shl i32 %263, %264
  %266 = sub i32 0, %262
  %267 = and i32 %266, 31
  %268 = lshr i32 %263, %267
  %269 = or i32 %265, %268
  %270 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 19
  %271 = load i32* %270, align 4
  %272 = add i32 %269, %271
  %273 = xor i32 %272, %262
  %274 = and i32 %272, 31
  %275 = shl i32 %273, %274
  %276 = sub i32 0, %272
  %277 = and i32 %276, 31
  %278 = lshr i32 %273, %277
  %279 = or i32 %275, %278
  %280 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 20
  %281 = load i32* %280, align 4
  %282 = add i32 %279, %281
  %283 = xor i32 %282, %272
  %284 = and i32 %282, 31
  %285 = shl i32 %283, %284
  %286 = sub i32 0, %282
  %287 = and i32 %286, 31
  %288 = lshr i32 %283, %287
  %289 = or i32 %285, %288
  %290 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 21
  %291 = load i32* %290, align 4
  %292 = add i32 %289, %291
  %293 = xor i32 %292, %282
  %294 = and i32 %292, 31
  %295 = shl i32 %293, %294
  %296 = sub i32 0, %292
  %297 = and i32 %296, 31
  %298 = lshr i32 %293, %297
  %299 = or i32 %295, %298
  %300 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 22
  %301 = load i32* %300, align 4
  %302 = add i32 %299, %301
  %303 = xor i32 %302, %292
  %304 = and i32 %302, 31
  %305 = shl i32 %303, %304
  %306 = sub i32 0, %302
  %307 = and i32 %306, 31
  %308 = lshr i32 %303, %307
  %309 = or i32 %305, %308
  %310 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 23
  %311 = load i32* %310, align 4
  %312 = add i32 %309, %311
  %313 = xor i32 %312, %302
  %314 = and i32 %312, 31
  %315 = shl i32 %313, %314
  %316 = sub i32 0, %312
  %317 = and i32 %316, 31
  %318 = lshr i32 %313, %317
  %319 = or i32 %315, %318
  %320 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 24
  %321 = load i32* %320, align 4
  %322 = add i32 %319, %321
  %323 = xor i32 %322, %312
  %324 = and i32 %322, 31
  %325 = shl i32 %323, %324
  %326 = sub i32 0, %322
  %327 = and i32 %326, 31
  %328 = lshr i32 %323, %327
  %329 = or i32 %325, %328
  %330 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 25
  %331 = load i32* %330, align 4
  %332 = add i32 %329, %331
  %333 = xor i32 %332, %322
  %334 = and i32 %332, 31
  %335 = shl i32 %333, %334
  %336 = sub i32 0, %332
  %337 = and i32 %336, 31
  %338 = lshr i32 %333, %337
  %339 = or i32 %335, %338
  %340 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 26
  %341 = load i32* %340, align 4
  %342 = add i32 %339, %341
  %343 = xor i32 %342, %332
  %344 = and i32 %342, 31
  %345 = shl i32 %343, %344
  %346 = sub i32 0, %342
  %347 = and i32 %346, 31
  %348 = lshr i32 %343, %347
  %349 = or i32 %345, %348
  %350 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 27
  %351 = load i32* %350, align 4
  %352 = add i32 %349, %351
  %353 = xor i32 %352, %342
  %354 = and i32 %352, 31
  %355 = shl i32 %353, %354
  %356 = sub i32 0, %352
  %357 = and i32 %356, 31
  %358 = lshr i32 %353, %357
  %359 = or i32 %355, %358
  %360 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 28
  %361 = load i32* %360, align 4
  %362 = add i32 %359, %361
  %363 = xor i32 %362, %352
  %364 = and i32 %362, 31
  %365 = shl i32 %363, %364
  %366 = sub i32 0, %362
  %367 = and i32 %366, 31
  %368 = lshr i32 %363, %367
  %369 = or i32 %365, %368
  %370 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 29
  %371 = load i32* %370, align 4
  %372 = add i32 %369, %371
  %373 = xor i32 %372, %362
  %374 = and i32 %372, 31
  %375 = shl i32 %373, %374
  %376 = sub i32 0, %372
  %377 = and i32 %376, 31
  %378 = lshr i32 %373, %377
  %379 = or i32 %375, %378
  %380 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 30
  %381 = load i32* %380, align 4
  %382 = add i32 %379, %381
  %383 = xor i32 %382, %372
  %384 = and i32 %382, 31
  %385 = shl i32 %383, %384
  %386 = sub i32 0, %382
  %387 = and i32 %386, 31
  %388 = lshr i32 %383, %387
  %389 = or i32 %385, %388
  %390 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 31
  %391 = load i32* %390, align 4
  %392 = add i32 %389, %391
  %393 = xor i32 %392, %382
  %394 = and i32 %392, 31
  %395 = shl i32 %393, %394
  %396 = sub i32 0, %392
  %397 = and i32 %396, 31
  %398 = lshr i32 %393, %397
  %399 = or i32 %395, %398
  %400 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 32
  %401 = load i32* %400, align 4
  %402 = add i32 %399, %401
  %403 = xor i32 %402, %392
  %404 = and i32 %402, 31
  %405 = shl i32 %403, %404
  %406 = sub i32 0, %402
  %407 = and i32 %406, 31
  %408 = lshr i32 %403, %407
  %409 = or i32 %405, %408
  %410 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 33
  %411 = load i32* %410, align 4
  %412 = add i32 %409, %411
  br label %bb3

bb3:                                              ; preds = %bb2, %bb, %entry
  %a.0 = phi i32 [ %242, %bb ], [ %402, %bb2 ], [ %160, %entry ]
  %b.0 = phi i32 [ %252, %bb ], [ %412, %bb2 ], [ %170, %entry ]
  %413 = zext i32 %a.0 to i64
  store i64 %413, i64* %d, align 8
  %414 = zext i32 %b.0 to i64
  store i64 %414, i64* %5, align 8
  ret void
}

define void @RC5_32_decrypt(i64* nocapture %d, %struct.RC5_32_KEY* %key) nounwind {
entry:
  %0 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 0
  %1 = load i64* %d, align 8
  %2 = trunc i64 %1 to i32
  %3 = getelementptr inbounds i64* %d, i64 1
  %4 = load i64* %3, align 8
  %5 = trunc i64 %4 to i32
  %6 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 0
  %7 = load i32* %6, align 4
  switch i32 %7, label %bb3 [
    i32 16, label %bb
    i32 12, label %bb2
  ]

bb:                                               ; preds = %entry
  %8 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 33
  %9 = load i32* %8, align 4
  %10 = sub i32 %5, %9
  %11 = sub i32 0, %2
  %12 = and i32 %11, 31
  %13 = shl i32 %10, %12
  %14 = and i32 %2, 31
  %15 = lshr i32 %10, %14
  %16 = or i32 %13, %15
  %17 = xor i32 %16, %2
  %18 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 32
  %19 = load i32* %18, align 4
  %20 = sub i32 %2, %19
  %21 = sub i32 0, %17
  %22 = and i32 %21, 31
  %23 = shl i32 %20, %22
  %24 = and i32 %17, 31
  %25 = lshr i32 %20, %24
  %26 = or i32 %23, %25
  %27 = xor i32 %26, %17
  %28 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 31
  %29 = load i32* %28, align 4
  %30 = sub i32 %17, %29
  %31 = sub i32 0, %27
  %32 = and i32 %31, 31
  %33 = shl i32 %30, %32
  %34 = and i32 %27, 31
  %35 = lshr i32 %30, %34
  %36 = or i32 %33, %35
  %37 = xor i32 %36, %27
  %38 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 30
  %39 = load i32* %38, align 4
  %40 = sub i32 %27, %39
  %41 = sub i32 0, %37
  %42 = and i32 %41, 31
  %43 = shl i32 %40, %42
  %44 = and i32 %37, 31
  %45 = lshr i32 %40, %44
  %46 = or i32 %43, %45
  %47 = xor i32 %46, %37
  %48 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 29
  %49 = load i32* %48, align 4
  %50 = sub i32 %37, %49
  %51 = sub i32 0, %47
  %52 = and i32 %51, 31
  %53 = shl i32 %50, %52
  %54 = and i32 %47, 31
  %55 = lshr i32 %50, %54
  %56 = or i32 %53, %55
  %57 = xor i32 %56, %47
  %58 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 28
  %59 = load i32* %58, align 4
  %60 = sub i32 %47, %59
  %61 = sub i32 0, %57
  %62 = and i32 %61, 31
  %63 = shl i32 %60, %62
  %64 = and i32 %57, 31
  %65 = lshr i32 %60, %64
  %66 = or i32 %63, %65
  %67 = xor i32 %66, %57
  %68 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 27
  %69 = load i32* %68, align 4
  %70 = sub i32 %57, %69
  %71 = sub i32 0, %67
  %72 = and i32 %71, 31
  %73 = shl i32 %70, %72
  %74 = and i32 %67, 31
  %75 = lshr i32 %70, %74
  %76 = or i32 %73, %75
  %77 = xor i32 %76, %67
  %78 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 26
  %79 = load i32* %78, align 4
  %80 = sub i32 %67, %79
  %81 = sub i32 0, %77
  %82 = and i32 %81, 31
  %83 = shl i32 %80, %82
  %84 = and i32 %77, 31
  %85 = lshr i32 %80, %84
  %86 = or i32 %83, %85
  %87 = xor i32 %86, %77
  %88 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 25
  %89 = load i32* %88, align 4
  %90 = sub i32 %77, %89
  %91 = sub i32 0, %87
  %92 = and i32 %91, 31
  %93 = shl i32 %90, %92
  %94 = and i32 %87, 31
  %95 = lshr i32 %90, %94
  %96 = or i32 %93, %95
  %97 = xor i32 %96, %87
  %98 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 24
  %99 = load i32* %98, align 4
  %100 = sub i32 %87, %99
  %101 = sub i32 0, %97
  %102 = and i32 %101, 31
  %103 = shl i32 %100, %102
  %104 = and i32 %97, 31
  %105 = lshr i32 %100, %104
  %106 = or i32 %103, %105
  %107 = xor i32 %106, %97
  %108 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 23
  %109 = load i32* %108, align 4
  %110 = sub i32 %97, %109
  %111 = sub i32 0, %107
  %112 = and i32 %111, 31
  %113 = shl i32 %110, %112
  %114 = and i32 %107, 31
  %115 = lshr i32 %110, %114
  %116 = or i32 %113, %115
  %117 = xor i32 %116, %107
  %118 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 22
  %119 = load i32* %118, align 4
  %120 = sub i32 %107, %119
  %121 = sub i32 0, %117
  %122 = and i32 %121, 31
  %123 = shl i32 %120, %122
  %124 = and i32 %117, 31
  %125 = lshr i32 %120, %124
  %126 = or i32 %123, %125
  %127 = xor i32 %126, %117
  %128 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 21
  %129 = load i32* %128, align 4
  %130 = sub i32 %117, %129
  %131 = sub i32 0, %127
  %132 = and i32 %131, 31
  %133 = shl i32 %130, %132
  %134 = and i32 %127, 31
  %135 = lshr i32 %130, %134
  %136 = or i32 %133, %135
  %137 = xor i32 %136, %127
  %138 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 20
  %139 = load i32* %138, align 4
  %140 = sub i32 %127, %139
  %141 = sub i32 0, %137
  %142 = and i32 %141, 31
  %143 = shl i32 %140, %142
  %144 = and i32 %137, 31
  %145 = lshr i32 %140, %144
  %146 = or i32 %143, %145
  %147 = xor i32 %146, %137
  %148 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 19
  %149 = load i32* %148, align 4
  %150 = sub i32 %137, %149
  %151 = sub i32 0, %147
  %152 = and i32 %151, 31
  %153 = shl i32 %150, %152
  %154 = and i32 %147, 31
  %155 = lshr i32 %150, %154
  %156 = or i32 %153, %155
  %157 = xor i32 %156, %147
  %158 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 18
  %159 = load i32* %158, align 4
  %160 = sub i32 %147, %159
  %161 = sub i32 0, %157
  %162 = and i32 %161, 31
  %163 = shl i32 %160, %162
  %164 = and i32 %157, 31
  %165 = lshr i32 %160, %164
  %166 = or i32 %163, %165
  %167 = xor i32 %166, %157
  br label %bb3

bb2:                                              ; preds = %entry
  %168 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 25
  %169 = load i32* %168, align 4
  %170 = sub i32 %5, %169
  %171 = sub i32 0, %2
  %172 = and i32 %171, 31
  %173 = shl i32 %170, %172
  %174 = and i32 %2, 31
  %175 = lshr i32 %170, %174
  %176 = or i32 %173, %175
  %177 = xor i32 %176, %2
  %178 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 24
  %179 = load i32* %178, align 4
  %180 = sub i32 %2, %179
  %181 = sub i32 0, %177
  %182 = and i32 %181, 31
  %183 = shl i32 %180, %182
  %184 = and i32 %177, 31
  %185 = lshr i32 %180, %184
  %186 = or i32 %183, %185
  %187 = xor i32 %186, %177
  %188 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 23
  %189 = load i32* %188, align 4
  %190 = sub i32 %177, %189
  %191 = sub i32 0, %187
  %192 = and i32 %191, 31
  %193 = shl i32 %190, %192
  %194 = and i32 %187, 31
  %195 = lshr i32 %190, %194
  %196 = or i32 %193, %195
  %197 = xor i32 %196, %187
  %198 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 22
  %199 = load i32* %198, align 4
  %200 = sub i32 %187, %199
  %201 = sub i32 0, %197
  %202 = and i32 %201, 31
  %203 = shl i32 %200, %202
  %204 = and i32 %197, 31
  %205 = lshr i32 %200, %204
  %206 = or i32 %203, %205
  %207 = xor i32 %206, %197
  %208 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 21
  %209 = load i32* %208, align 4
  %210 = sub i32 %197, %209
  %211 = sub i32 0, %207
  %212 = and i32 %211, 31
  %213 = shl i32 %210, %212
  %214 = and i32 %207, 31
  %215 = lshr i32 %210, %214
  %216 = or i32 %213, %215
  %217 = xor i32 %216, %207
  %218 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 20
  %219 = load i32* %218, align 4
  %220 = sub i32 %207, %219
  %221 = sub i32 0, %217
  %222 = and i32 %221, 31
  %223 = shl i32 %220, %222
  %224 = and i32 %217, 31
  %225 = lshr i32 %220, %224
  %226 = or i32 %223, %225
  %227 = xor i32 %226, %217
  %228 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 19
  %229 = load i32* %228, align 4
  %230 = sub i32 %217, %229
  %231 = sub i32 0, %227
  %232 = and i32 %231, 31
  %233 = shl i32 %230, %232
  %234 = and i32 %227, 31
  %235 = lshr i32 %230, %234
  %236 = or i32 %233, %235
  %237 = xor i32 %236, %227
  %238 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 18
  %239 = load i32* %238, align 4
  %240 = sub i32 %227, %239
  %241 = sub i32 0, %237
  %242 = and i32 %241, 31
  %243 = shl i32 %240, %242
  %244 = and i32 %237, 31
  %245 = lshr i32 %240, %244
  %246 = or i32 %243, %245
  %247 = xor i32 %246, %237
  br label %bb3

bb3:                                              ; preds = %bb2, %bb, %entry
  %a.0 = phi i32 [ %167, %bb ], [ %247, %bb2 ], [ %2, %entry ]
  %b.0 = phi i32 [ %157, %bb ], [ %237, %bb2 ], [ %5, %entry ]
  %248 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 17
  %249 = load i32* %248, align 4
  %250 = sub i32 %b.0, %249
  %251 = sub i32 0, %a.0
  %252 = and i32 %251, 31
  %253 = shl i32 %250, %252
  %254 = and i32 %a.0, 31
  %255 = lshr i32 %250, %254
  %256 = or i32 %253, %255
  %257 = xor i32 %256, %a.0
  %258 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 16
  %259 = load i32* %258, align 4
  %260 = sub i32 %a.0, %259
  %261 = sub i32 0, %257
  %262 = and i32 %261, 31
  %263 = shl i32 %260, %262
  %264 = and i32 %257, 31
  %265 = lshr i32 %260, %264
  %266 = or i32 %263, %265
  %267 = xor i32 %266, %257
  %268 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 15
  %269 = load i32* %268, align 4
  %270 = sub i32 %257, %269
  %271 = sub i32 0, %267
  %272 = and i32 %271, 31
  %273 = shl i32 %270, %272
  %274 = and i32 %267, 31
  %275 = lshr i32 %270, %274
  %276 = or i32 %273, %275
  %277 = xor i32 %276, %267
  %278 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 14
  %279 = load i32* %278, align 4
  %280 = sub i32 %267, %279
  %281 = sub i32 0, %277
  %282 = and i32 %281, 31
  %283 = shl i32 %280, %282
  %284 = and i32 %277, 31
  %285 = lshr i32 %280, %284
  %286 = or i32 %283, %285
  %287 = xor i32 %286, %277
  %288 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 13
  %289 = load i32* %288, align 4
  %290 = sub i32 %277, %289
  %291 = sub i32 0, %287
  %292 = and i32 %291, 31
  %293 = shl i32 %290, %292
  %294 = and i32 %287, 31
  %295 = lshr i32 %290, %294
  %296 = or i32 %293, %295
  %297 = xor i32 %296, %287
  %298 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 12
  %299 = load i32* %298, align 4
  %300 = sub i32 %287, %299
  %301 = sub i32 0, %297
  %302 = and i32 %301, 31
  %303 = shl i32 %300, %302
  %304 = and i32 %297, 31
  %305 = lshr i32 %300, %304
  %306 = or i32 %303, %305
  %307 = xor i32 %306, %297
  %308 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 11
  %309 = load i32* %308, align 4
  %310 = sub i32 %297, %309
  %311 = sub i32 0, %307
  %312 = and i32 %311, 31
  %313 = shl i32 %310, %312
  %314 = and i32 %307, 31
  %315 = lshr i32 %310, %314
  %316 = or i32 %313, %315
  %317 = xor i32 %316, %307
  %318 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 10
  %319 = load i32* %318, align 4
  %320 = sub i32 %307, %319
  %321 = sub i32 0, %317
  %322 = and i32 %321, 31
  %323 = shl i32 %320, %322
  %324 = and i32 %317, 31
  %325 = lshr i32 %320, %324
  %326 = or i32 %323, %325
  %327 = xor i32 %326, %317
  %328 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 9
  %329 = load i32* %328, align 4
  %330 = sub i32 %317, %329
  %331 = sub i32 0, %327
  %332 = and i32 %331, 31
  %333 = shl i32 %330, %332
  %334 = and i32 %327, 31
  %335 = lshr i32 %330, %334
  %336 = or i32 %333, %335
  %337 = xor i32 %336, %327
  %338 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 8
  %339 = load i32* %338, align 4
  %340 = sub i32 %327, %339
  %341 = sub i32 0, %337
  %342 = and i32 %341, 31
  %343 = shl i32 %340, %342
  %344 = and i32 %337, 31
  %345 = lshr i32 %340, %344
  %346 = or i32 %343, %345
  %347 = xor i32 %346, %337
  %348 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 7
  %349 = load i32* %348, align 4
  %350 = sub i32 %337, %349
  %351 = sub i32 0, %347
  %352 = and i32 %351, 31
  %353 = shl i32 %350, %352
  %354 = and i32 %347, 31
  %355 = lshr i32 %350, %354
  %356 = or i32 %353, %355
  %357 = xor i32 %356, %347
  %358 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 6
  %359 = load i32* %358, align 4
  %360 = sub i32 %347, %359
  %361 = sub i32 0, %357
  %362 = and i32 %361, 31
  %363 = shl i32 %360, %362
  %364 = and i32 %357, 31
  %365 = lshr i32 %360, %364
  %366 = or i32 %363, %365
  %367 = xor i32 %366, %357
  %368 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 5
  %369 = load i32* %368, align 4
  %370 = sub i32 %357, %369
  %371 = sub i32 0, %367
  %372 = and i32 %371, 31
  %373 = shl i32 %370, %372
  %374 = and i32 %367, 31
  %375 = lshr i32 %370, %374
  %376 = or i32 %373, %375
  %377 = xor i32 %376, %367
  %378 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 4
  %379 = load i32* %378, align 4
  %380 = sub i32 %367, %379
  %381 = sub i32 0, %377
  %382 = and i32 %381, 31
  %383 = shl i32 %380, %382
  %384 = and i32 %377, 31
  %385 = lshr i32 %380, %384
  %386 = or i32 %383, %385
  %387 = xor i32 %386, %377
  %388 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 3
  %389 = load i32* %388, align 4
  %390 = sub i32 %377, %389
  %391 = sub i32 0, %387
  %392 = and i32 %391, 31
  %393 = shl i32 %390, %392
  %394 = and i32 %387, 31
  %395 = lshr i32 %390, %394
  %396 = or i32 %393, %395
  %397 = xor i32 %396, %387
  %398 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 2
  %399 = load i32* %398, align 4
  %400 = sub i32 %387, %399
  %401 = sub i32 0, %397
  %402 = and i32 %401, 31
  %403 = shl i32 %400, %402
  %404 = and i32 %397, 31
  %405 = lshr i32 %400, %404
  %406 = or i32 %403, %405
  %407 = xor i32 %406, %397
  %408 = load i32* %0, align 4
  %409 = sub i32 %407, %408
  %410 = zext i32 %409 to i64
  store i64 %410, i64* %d, align 8
  %411 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 1
  %412 = load i32* %411, align 4
  %413 = sub i32 %397, %412
  %414 = zext i32 %413 to i64
  store i64 %414, i64* %3, align 8
  ret void
}

define void @RC5_32_ecb_encrypt(i8* nocapture %in, i8* nocapture %out, %struct.RC5_32_KEY* %ks, i32 %encrypt) nounwind {
entry:
  %d = alloca [2 x i64], align 8
  %0 = load i8* %in, align 1
  %1 = zext i8 %0 to i64
  %2 = getelementptr inbounds i8* %in, i64 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i64
  %5 = shl nuw nsw i64 %4, 8
  %6 = getelementptr inbounds i8* %in, i64 2
  %7 = load i8* %6, align 1
  %8 = zext i8 %7 to i64
  %9 = shl nuw nsw i64 %8, 16
  %10 = getelementptr inbounds i8* %in, i64 3
  %11 = load i8* %10, align 1
  %12 = zext i8 %11 to i64
  %13 = shl nuw nsw i64 %12, 24
  %14 = or i64 %5, %1
  %15 = or i64 %14, %9
  %16 = or i64 %15, %13
  %17 = getelementptr inbounds i8* %in, i64 4
  %18 = getelementptr inbounds [2 x i64]* %d, i64 0, i64 0
  store i64 %16, i64* %18, align 8
  %19 = load i8* %17, align 1
  %20 = zext i8 %19 to i64
  %21 = getelementptr inbounds i8* %in, i64 5
  %22 = load i8* %21, align 1
  %23 = zext i8 %22 to i64
  %24 = shl nuw nsw i64 %23, 8
  %25 = getelementptr inbounds i8* %in, i64 6
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i64
  %28 = shl nuw nsw i64 %27, 16
  %29 = getelementptr inbounds i8* %in, i64 7
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i64
  %32 = shl nuw nsw i64 %31, 24
  %33 = or i64 %24, %20
  %34 = or i64 %33, %28
  %35 = or i64 %34, %32
  %36 = getelementptr inbounds [2 x i64]* %d, i64 0, i64 1
  store i64 %35, i64* %36, align 8
  %37 = icmp eq i32 %encrypt, 0
  br i1 %37, label %bb2, label %bb

bb:                                               ; preds = %entry
  call void @RC5_32_encrypt(i64* %18, %struct.RC5_32_KEY* %ks) nounwind
  br label %bb4

bb2:                                              ; preds = %entry
  call void @RC5_32_decrypt(i64* %18, %struct.RC5_32_KEY* %ks) nounwind
  br label %bb4

bb4:                                              ; preds = %bb2, %bb
  %38 = load i64* %18, align 8
  %39 = trunc i64 %38 to i8
  store i8 %39, i8* %out, align 1
  %40 = getelementptr inbounds i8* %out, i64 1
  %41 = lshr i64 %38, 8
  %42 = trunc i64 %41 to i8
  store i8 %42, i8* %40, align 1
  %43 = getelementptr inbounds i8* %out, i64 2
  %44 = lshr i64 %38, 16
  %45 = trunc i64 %44 to i8
  store i8 %45, i8* %43, align 1
  %46 = getelementptr inbounds i8* %out, i64 3
  %47 = lshr i64 %38, 24
  %48 = trunc i64 %47 to i8
  store i8 %48, i8* %46, align 1
  %49 = getelementptr inbounds i8* %out, i64 4
  %50 = load i64* %36, align 8
  %51 = trunc i64 %50 to i8
  store i8 %51, i8* %49, align 1
  %52 = getelementptr inbounds i8* %out, i64 5
  %53 = lshr i64 %50, 8
  %54 = trunc i64 %53 to i8
  store i8 %54, i8* %52, align 1
  %55 = getelementptr inbounds i8* %out, i64 6
  %56 = lshr i64 %50, 16
  %57 = trunc i64 %56 to i8
  store i8 %57, i8* %55, align 1
  %58 = getelementptr inbounds i8* %out, i64 7
  %59 = lshr i64 %50, 24
  %60 = trunc i64 %59 to i8
  store i8 %60, i8* %58, align 1
  ret void
}

define void @RC5_32_set_key(%struct.RC5_32_KEY* nocapture %key, i32 %len, i8* nocapture %data, i32 %rounds) nounwind {
entry:
  %L = alloca [64 x i32], align 4
  switch i32 %rounds, label %bb3 [
    i32 16, label %bb4
    i32 12, label %bb4
    i32 8, label %bb4
  ]

bb3:                                              ; preds = %entry
  br label %bb4

bb4:                                              ; preds = %bb3, %entry, %entry, %entry
  %rounds_addr.0 = phi i32 [ 16, %bb3 ], [ %rounds, %entry ], [ %rounds, %entry ], [ %rounds, %entry ]
  %0 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 0
  store i32 %rounds_addr.0, i32* %0, align 4
  %1 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 0
  %2 = add nsw i32 %len, -8
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %bb7, label %bb5

bb5:                                              ; preds = %bb5, %bb4
  %indvar51 = phi i64 [ %indvar.next52, %bb5 ], [ 0, %bb4 ]
  %tmp53 = shl i64 %indvar51, 3
  %data_addr.037 = getelementptr i8* %data, i64 %tmp53
  %tmp5578 = or i64 %tmp53, 1
  %scevgep56 = getelementptr i8* %data, i64 %tmp5578
  %tmp5779 = or i64 %tmp53, 2
  %scevgep58 = getelementptr i8* %data, i64 %tmp5779
  %tmp5980 = or i64 %tmp53, 3
  %scevgep60 = getelementptr i8* %data, i64 %tmp5980
  %tmp6181 = or i64 %tmp53, 4
  %scevgep62 = getelementptr i8* %data, i64 %tmp6181
  %tmp6382 = or i64 %tmp53, 5
  %scevgep64 = getelementptr i8* %data, i64 %tmp6382
  %tmp6583 = or i64 %tmp53, 6
  %scevgep66 = getelementptr i8* %data, i64 %tmp6583
  %tmp6784 = or i64 %tmp53, 7
  %scevgep68 = getelementptr i8* %data, i64 %tmp6784
  %tmp69 = add i64 %tmp53, 8
  %tmp77 = trunc i64 %tmp69 to i32
  %4 = load i8* %data_addr.037, align 1
  %5 = zext i8 %4 to i32
  %6 = load i8* %scevgep56, align 1
  %7 = zext i8 %6 to i32
  %8 = shl nuw nsw i32 %7, 8
  %9 = load i8* %scevgep58, align 1
  %10 = zext i8 %9 to i32
  %11 = shl nuw nsw i32 %10, 16
  %12 = load i8* %scevgep60, align 1
  %13 = zext i8 %12 to i32
  %14 = shl nuw i32 %13, 24
  %15 = or i32 %8, %5
  %16 = or i32 %15, %11
  %17 = or i32 %16, %14
  %sext = shl i64 %indvar51, 33
  %18 = ashr exact i64 %sext, 32
  %19 = getelementptr inbounds [64 x i32]* %L, i64 0, i64 %18
  store i32 %17, i32* %19, align 4
  %20 = load i8* %scevgep62, align 1
  %21 = zext i8 %20 to i32
  %22 = load i8* %scevgep64, align 1
  %23 = zext i8 %22 to i32
  %24 = shl nuw nsw i32 %23, 8
  %25 = load i8* %scevgep66, align 1
  %26 = zext i8 %25 to i32
  %27 = shl nuw nsw i32 %26, 16
  %28 = load i8* %scevgep68, align 1
  %29 = zext i8 %28 to i32
  %30 = shl nuw i32 %29, 24
  %31 = or i32 %24, %21
  %32 = or i32 %31, %27
  %33 = or i32 %32, %30
  %34 = or i64 %18, 1
  %35 = getelementptr inbounds [64 x i32]* %L, i64 0, i64 %34
  store i32 %33, i32* %35, align 4
  %36 = icmp slt i32 %2, %tmp77
  %indvar.next52 = add i64 %indvar51, 1
  br i1 %36, label %bb6.bb7_crit_edge, label %bb5

bb6.bb7_crit_edge:                                ; preds = %bb5
  %tmp71 = shl i64 %indvar51, 1
  %tmp75 = add i64 %tmp71, 2
  %scevgep70 = getelementptr i8* %data, i64 %tmp69
  %tmp76 = trunc i64 %tmp75 to i32
  br label %bb7

bb7:                                              ; preds = %bb6.bb7_crit_edge, %bb4
  %data_addr.0.lcssa = phi i8* [ %scevgep70, %bb6.bb7_crit_edge ], [ %data, %bb4 ]
  %j.0.lcssa = phi i32 [ %tmp76, %bb6.bb7_crit_edge ], [ 0, %bb4 ]
  %i.0.lcssa = phi i32 [ %tmp77, %bb6.bb7_crit_edge ], [ 0, %bb4 ]
  %37 = icmp eq i32 %i.0.lcssa, %len
  br i1 %37, label %bb18, label %bb8

bb8:                                              ; preds = %bb7
  %38 = and i32 %len, 7
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i8* %data_addr.0.lcssa, i64 %39
  switch i32 %38, label %bb17 [
    i32 1, label %bb16
    i32 2, label %bb15
    i32 3, label %bb14
    i32 4, label %bb13
    i32 5, label %bb12
    i32 6, label %bb11
    i32 7, label %bb10
    i32 8, label %bb9
  ]

bb9:                                              ; preds = %bb8
  %.sum = add i64 %39, -1
  %41 = getelementptr inbounds i8* %data_addr.0.lcssa, i64 %.sum
  %42 = load i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = shl nuw i32 %43, 24
  br label %bb10

bb10:                                             ; preds = %bb9, %bb8
  %ll.0 = phi i32 [ %44, %bb9 ], [ 0, %bb8 ]
  %data_addr.1 = phi i8* [ %41, %bb9 ], [ %40, %bb8 ]
  %45 = getelementptr inbounds i8* %data_addr.1, i64 -1
  %46 = load i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = shl nuw nsw i32 %47, 16
  %49 = or i32 %48, %ll.0
  br label %bb11

bb11:                                             ; preds = %bb10, %bb8
  %ll.1 = phi i32 [ %49, %bb10 ], [ 0, %bb8 ]
  %data_addr.2 = phi i8* [ %45, %bb10 ], [ %40, %bb8 ]
  %50 = getelementptr inbounds i8* %data_addr.2, i64 -1
  %51 = load i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = shl nuw nsw i32 %52, 8
  %54 = or i32 %53, %ll.1
  br label %bb12

bb12:                                             ; preds = %bb11, %bb8
  %ll.2 = phi i32 [ %54, %bb11 ], [ 0, %bb8 ]
  %data_addr.3 = phi i8* [ %50, %bb11 ], [ %40, %bb8 ]
  %55 = getelementptr inbounds i8* %data_addr.3, i64 -1
  %56 = load i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = or i32 %57, %ll.2
  br label %bb13

bb13:                                             ; preds = %bb12, %bb8
  %ll.3 = phi i32 [ %58, %bb12 ], [ 0, %bb8 ]
  %data_addr.4 = phi i8* [ %55, %bb12 ], [ %40, %bb8 ]
  %59 = getelementptr inbounds i8* %data_addr.4, i64 -1
  %60 = load i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = shl nuw i32 %61, 24
  br label %bb14

bb14:                                             ; preds = %bb13, %bb8
  %ll.4 = phi i32 [ %ll.3, %bb13 ], [ 0, %bb8 ]
  %l.0 = phi i32 [ %62, %bb13 ], [ 0, %bb8 ]
  %data_addr.5 = phi i8* [ %59, %bb13 ], [ %40, %bb8 ]
  %63 = getelementptr inbounds i8* %data_addr.5, i64 -1
  %64 = load i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = shl nuw nsw i32 %65, 16
  %67 = or i32 %66, %l.0
  br label %bb15

bb15:                                             ; preds = %bb14, %bb8
  %ll.5 = phi i32 [ %ll.4, %bb14 ], [ 0, %bb8 ]
  %l.1 = phi i32 [ %67, %bb14 ], [ 0, %bb8 ]
  %data_addr.6 = phi i8* [ %63, %bb14 ], [ %40, %bb8 ]
  %68 = getelementptr inbounds i8* %data_addr.6, i64 -1
  %69 = load i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = shl nuw nsw i32 %70, 8
  %72 = or i32 %71, %l.1
  br label %bb16

bb16:                                             ; preds = %bb15, %bb8
  %ll.6 = phi i32 [ %ll.5, %bb15 ], [ 0, %bb8 ]
  %l.2 = phi i32 [ %72, %bb15 ], [ 0, %bb8 ]
  %data_addr.7 = phi i8* [ %68, %bb15 ], [ %40, %bb8 ]
  %73 = getelementptr inbounds i8* %data_addr.7, i64 -1
  %74 = load i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = or i32 %75, %l.2
  br label %bb17

bb17:                                             ; preds = %bb16, %bb8
  %ll.7 = phi i32 [ 0, %bb8 ], [ %ll.6, %bb16 ]
  %l.3 = phi i32 [ 0, %bb8 ], [ %76, %bb16 ]
  %77 = sext i32 %j.0.lcssa to i64
  %78 = getelementptr inbounds [64 x i32]* %L, i64 0, i64 %77
  store i32 %l.3, i32* %78, align 4
  %79 = or i32 %j.0.lcssa, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [64 x i32]* %L, i64 0, i64 %80
  store i32 %ll.7, i32* %81, align 4
  br label %bb18

bb18:                                             ; preds = %bb17, %bb7
  %82 = add nsw i32 %len, 3
  %83 = sdiv i32 %82, 4
  %84 = shl i32 %rounds_addr.0, 1
  %85 = add i32 %84, 2
  store i32 -1209970333, i32* %1, align 4
  %86 = icmp sgt i32 %85, 1
  br i1 %86, label %bb19.lr.ph, label %bb21

bb19.lr.ph:                                       ; preds = %bb18
  %tmp44 = zext i32 %84 to i64
  %tmp4587 = or i64 %tmp44, 1
  br label %bb19

bb19:                                             ; preds = %bb19.bb19_crit_edge, %bb19.lr.ph
  %87 = phi i32 [ 1444465436, %bb19.lr.ph ], [ %phitmp89, %bb19.bb19_crit_edge ]
  %indvar = phi i64 [ 1, %bb19.lr.ph ], [ %phitmp88, %bb19.bb19_crit_edge ]
  %scevgep = getelementptr %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 %indvar
  store i32 %87, i32* %scevgep, align 4
  %exitcond46 = icmp eq i64 %indvar, %tmp4587
  br i1 %exitcond46, label %bb21, label %bb19.bb19_crit_edge

bb19.bb19_crit_edge:                              ; preds = %bb19
  %phitmp88 = add i64 %indvar, 1
  %phitmp89 = add i32 %87, -1640531527
  br label %bb19

bb21:                                             ; preds = %bb19, %bb18
  %88 = icmp sge i32 %83, %85
  %max = select i1 %88, i32 %83, i32 %85
  %89 = mul nsw i32 %max, 3
  %90 = icmp sgt i32 %89, 0
  br i1 %90, label %bb22.lr.ph, label %return

bb22.lr.ph:                                       ; preds = %bb21
  %tmp41 = icmp sgt i32 %83, %85
  %smax = select i1 %tmp41, i32 %83, i32 %85
  %tmp42 = mul i32 %smax, 3
  br label %bb22

bb22:                                             ; preds = %bb22.bb22_crit_edge, %bb22.lr.ph
  %jj.133 = phi i32 [ 0, %bb22.lr.ph ], [ %jj.0, %bb22.bb22_crit_edge ]
  %ii.132 = phi i32 [ 0, %bb22.lr.ph ], [ %ii.0, %bb22.bb22_crit_edge ]
  %A.031 = phi i32 [ 0, %bb22.lr.ph ], [ %98, %bb22.bb22_crit_edge ]
  %B.030 = phi i32 [ 0, %bb22.lr.ph ], [ %110, %bb22.bb22_crit_edge ]
  %i.229 = phi i32 [ 1, %bb22.lr.ph ], [ %phitmp, %bb22.bb22_crit_edge ]
  %91 = sext i32 %ii.132 to i64
  %92 = getelementptr inbounds %struct.RC5_32_KEY* %key, i64 0, i32 1, i64 %91
  %93 = load i32* %92, align 4
  %94 = add i32 %A.031, %B.030
  %95 = add i32 %94, %93
  %96 = lshr i32 %95, 29
  %97 = shl i32 %95, 3
  %98 = or i32 %96, %97
  store i32 %98, i32* %92, align 4
  %99 = add i32 %98, %B.030
  %100 = sext i32 %jj.133 to i64
  %101 = getelementptr inbounds [64 x i32]* %L, i64 0, i64 %100
  %102 = load i32* %101, align 4
  %103 = add i32 %102, %B.030
  %104 = add i32 %103, %98
  %105 = and i32 %99, 31
  %106 = shl i32 %104, %105
  %107 = sub i32 0, %99
  %108 = and i32 %107, 31
  %109 = lshr i32 %104, %108
  %110 = or i32 %106, %109
  store i32 %110, i32* %101, align 4
  %111 = add nsw i32 %ii.132, 1
  %112 = add nsw i32 %jj.133, 1
  %exitcond = icmp eq i32 %i.229, %tmp42
  br i1 %exitcond, label %return, label %bb22.bb22_crit_edge

bb22.bb22_crit_edge:                              ; preds = %bb22
  %113 = icmp slt i32 %112, %83
  %114 = icmp slt i32 %111, %85
  %jj.0 = select i1 %113, i32 %112, i32 0
  %ii.0 = select i1 %114, i32 %111, i32 0
  %phitmp = add i32 %i.229, 1
  br label %bb22

return:                                           ; preds = %bb22, %bb21
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %key = alloca %struct.RC5_32_KEY, align 8
  %buf5 = alloca [8 x i8], align 1
  %RC5key = alloca [16 x i8], align 1
  %buf5.sub = getelementptr inbounds [8 x i8]* %buf5, i64 0, i64 0
  %RC5key1 = getelementptr inbounds [16 x i8]* %RC5key, i64 0, i64 0
  %0 = call i32 (...)* @klee_make_symbolic(i8* %RC5key1, i64 16, i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0)) nounwind
  call void @RC5_32_set_key(%struct.RC5_32_KEY* %key, i32 16, i8* %RC5key1, i32 12) nounwind
  call void @RC5_32_ecb_encrypt(i8* getelementptr inbounds ([5 x [8 x i8]]* @RC5plain, i64 0, i64 0, i64 0), i8* %buf5.sub, %struct.RC5_32_KEY* %key, i32 1) nounwind
  ret i32 0
}

declare i32 @klee_make_symbolic(...)
