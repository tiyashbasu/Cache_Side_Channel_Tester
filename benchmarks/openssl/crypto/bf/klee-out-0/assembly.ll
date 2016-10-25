; ModuleID = 'bf_core.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.BF_KEY = type { [18 x i32], [1024 x i32] }

@key = internal unnamed_addr constant %struct.BF_KEY { [18 x i32] [i32 608135816, i32 -2052912941, i32 320440878, i32 57701188, i32 -1542899678, i32 698298832, i32 137296536, i32 -330404727, i32 1160258022, i32 953160567, i32 -1101764913, i32 887688300, 
@.str = private unnamed_addr constant [7 x i8] c"bf_key\00", align 1
@.str1 = private constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str12 = private constant [15 x i8] c"divide by zero\00", align 1
@.str2 = private constant [8 x i8] c"div.err\00", align 1
@.str3 = private constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private constant [16 x i8] c"overshift error\00", align 1
@.str25 = private constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private constant [14 x i8] c"invalid range\00", align 1
@.str28 = private constant [5 x i8] c"user\00", align 1

define void @BF_encrypt(i32* nocapture %data, %struct.BF_KEY* %key) nounwind {
entry:
  %0 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 0
  %1 = load i32* %data, align 4
  %2 = getelementptr inbounds i32* %data, i64 1
  %3 = load i32* %2, align 4
  %4 = load i32* %0, align 4
  %5 = xor i32 %4, %1
  %6 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 1
  %7 = load i32* %6, align 4
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64)
  %8 = lshr i32 %5, 24
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %9
  %11 = load i32* %10, align 4
  %int_cast_to_i641 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641)
  %12 = lshr i32 %5, 16
  %13 = and i32 %12, 255
  %14 = or i32 %13, 256
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %15
  %17 = load i32* %16, align 4
  %18 = add i32 %17, %11
  %int_cast_to_i642 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642)
  %19 = lshr i32 %5, 8
  %20 = and i32 %19, 255
  %21 = or i32 %20, 512
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %22
  %24 = load i32* %23, align 4
  %25 = xor i32 %18, %24
  %26 = and i32 %5, 255
  %27 = or i32 %26, 768
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %28
  %30 = load i32* %29, align 4
  %31 = add i32 %25, %30
  %32 = xor i32 %7, %3
  %33 = xor i32 %32, %31
  %34 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 2
  %35 = load i32* %34, align 4
  %int_cast_to_i643 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i643)
  %36 = lshr i32 %33, 24
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %37
  %39 = load i32* %38, align 4
  %int_cast_to_i644 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i644)
  %40 = lshr i32 %33, 16
  %41 = and i32 %40, 255
  %42 = or i32 %41, 256
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %43
  %45 = load i32* %44, align 4
  %46 = add i32 %45, %39
  %int_cast_to_i645 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i645)
  %47 = lshr i32 %33, 8
  %48 = and i32 %47, 255
  %49 = or i32 %48, 512
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %50
  %52 = load i32* %51, align 4
  %53 = xor i32 %46, %52
  %54 = and i32 %33, 255
  %55 = or i32 %54, 768
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %56
  %58 = load i32* %57, align 4
  %59 = add i32 %53, %58
  %60 = xor i32 %35, %5
  %61 = xor i32 %60, %59
  %62 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 3
  %63 = load i32* %62, align 4
  %int_cast_to_i646 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i646)
  %64 = lshr i32 %61, 24
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %65
  %67 = load i32* %66, align 4
  %int_cast_to_i647 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i647)
  %68 = lshr i32 %61, 16
  %69 = and i32 %68, 255
  %70 = or i32 %69, 256
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %71
  %73 = load i32* %72, align 4
  %74 = add i32 %73, %67
  %int_cast_to_i648 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i648)
  %75 = lshr i32 %61, 8
  %76 = and i32 %75, 255
  %77 = or i32 %76, 512
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %78
  %80 = load i32* %79, align 4
  %81 = xor i32 %74, %80
  %82 = and i32 %61, 255
  %83 = or i32 %82, 768
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %84
  %86 = load i32* %85, align 4
  %87 = add i32 %81, %86
  %88 = xor i32 %63, %33
  %89 = xor i32 %88, %87
  %90 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 4
  %91 = load i32* %90, align 4
  %int_cast_to_i649 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i649)
  %92 = lshr i32 %89, 24
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %93
  %95 = load i32* %94, align 4
  %int_cast_to_i6410 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6410)
  %96 = lshr i32 %89, 16
  %97 = and i32 %96, 255
  %98 = or i32 %97, 256
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %99
  %101 = load i32* %100, align 4
  %102 = add i32 %101, %95
  %int_cast_to_i6411 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6411)
  %103 = lshr i32 %89, 8
  %104 = and i32 %103, 255
  %105 = or i32 %104, 512
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %106
  %108 = load i32* %107, align 4
  %109 = xor i32 %102, %108
  %110 = and i32 %89, 255
  %111 = or i32 %110, 768
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %112
  %114 = load i32* %113, align 4
  %115 = add i32 %109, %114
  %116 = xor i32 %91, %61
  %117 = xor i32 %116, %115
  %118 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 5
  %119 = load i32* %118, align 4
  %int_cast_to_i6412 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6412)
  %120 = lshr i32 %117, 24
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %121
  %123 = load i32* %122, align 4
  %int_cast_to_i6413 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6413)
  %124 = lshr i32 %117, 16
  %125 = and i32 %124, 255
  %126 = or i32 %125, 256
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %127
  %129 = load i32* %128, align 4
  %130 = add i32 %129, %123
  %int_cast_to_i6414 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6414)
  %131 = lshr i32 %117, 8
  %132 = and i32 %131, 255
  %133 = or i32 %132, 512
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %134
  %136 = load i32* %135, align 4
  %137 = xor i32 %130, %136
  %138 = and i32 %117, 255
  %139 = or i32 %138, 768
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %140
  %142 = load i32* %141, align 4
  %143 = add i32 %137, %142
  %144 = xor i32 %119, %89
  %145 = xor i32 %144, %143
  %146 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 6
  %147 = load i32* %146, align 4
  %int_cast_to_i6415 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6415)
  %148 = lshr i32 %145, 24
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %149
  %151 = load i32* %150, align 4
  %int_cast_to_i6416 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6416)
  %152 = lshr i32 %145, 16
  %153 = and i32 %152, 255
  %154 = or i32 %153, 256
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %155
  %157 = load i32* %156, align 4
  %158 = add i32 %157, %151
  %int_cast_to_i6417 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6417)
  %159 = lshr i32 %145, 8
  %160 = and i32 %159, 255
  %161 = or i32 %160, 512
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %162
  %164 = load i32* %163, align 4
  %165 = xor i32 %158, %164
  %166 = and i32 %145, 255
  %167 = or i32 %166, 768
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %168
  %170 = load i32* %169, align 4
  %171 = add i32 %165, %170
  %172 = xor i32 %147, %117
  %173 = xor i32 %172, %171
  %174 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 7
  %175 = load i32* %174, align 4
  %int_cast_to_i6418 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6418)
  %176 = lshr i32 %173, 24
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %177
  %179 = load i32* %178, align 4
  %int_cast_to_i6419 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6419)
  %180 = lshr i32 %173, 16
  %181 = and i32 %180, 255
  %182 = or i32 %181, 256
  %183 = zext i32 %182 to i64
  %184 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %183
  %185 = load i32* %184, align 4
  %186 = add i32 %185, %179
  %int_cast_to_i6420 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6420)
  %187 = lshr i32 %173, 8
  %188 = and i32 %187, 255
  %189 = or i32 %188, 512
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %190
  %192 = load i32* %191, align 4
  %193 = xor i32 %186, %192
  %194 = and i32 %173, 255
  %195 = or i32 %194, 768
  %196 = zext i32 %195 to i64
  %197 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %196
  %198 = load i32* %197, align 4
  %199 = add i32 %193, %198
  %200 = xor i32 %175, %145
  %201 = xor i32 %200, %199
  %202 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 8
  %203 = load i32* %202, align 4
  %int_cast_to_i6421 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6421)
  %204 = lshr i32 %201, 24
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %205
  %207 = load i32* %206, align 4
  %int_cast_to_i6422 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6422)
  %208 = lshr i32 %201, 16
  %209 = and i32 %208, 255
  %210 = or i32 %209, 256
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %211
  %213 = load i32* %212, align 4
  %214 = add i32 %213, %207
  %int_cast_to_i6423 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6423)
  %215 = lshr i32 %201, 8
  %216 = and i32 %215, 255
  %217 = or i32 %216, 512
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %218
  %220 = load i32* %219, align 4
  %221 = xor i32 %214, %220
  %222 = and i32 %201, 255
  %223 = or i32 %222, 768
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %224
  %226 = load i32* %225, align 4
  %227 = add i32 %221, %226
  %228 = xor i32 %203, %173
  %229 = xor i32 %228, %227
  %230 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 9
  %231 = load i32* %230, align 4
  %int_cast_to_i6424 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6424)
  %232 = lshr i32 %229, 24
  %233 = zext i32 %232 to i64
  %234 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %233
  %235 = load i32* %234, align 4
  %int_cast_to_i6425 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6425)
  %236 = lshr i32 %229, 16
  %237 = and i32 %236, 255
  %238 = or i32 %237, 256
  %239 = zext i32 %238 to i64
  %240 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %239
  %241 = load i32* %240, align 4
  %242 = add i32 %241, %235
  %int_cast_to_i6426 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6426)
  %243 = lshr i32 %229, 8
  %244 = and i32 %243, 255
  %245 = or i32 %244, 512
  %246 = zext i32 %245 to i64
  %247 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %246
  %248 = load i32* %247, align 4
  %249 = xor i32 %242, %248
  %250 = and i32 %229, 255
  %251 = or i32 %250, 768
  %252 = zext i32 %251 to i64
  %253 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %252
  %254 = load i32* %253, align 4
  %255 = add i32 %249, %254
  %256 = xor i32 %231, %201
  %257 = xor i32 %256, %255
  %258 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 10
  %259 = load i32* %258, align 4
  %int_cast_to_i6427 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6427)
  %260 = lshr i32 %257, 24
  %261 = zext i32 %260 to i64
  %262 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %261
  %263 = load i32* %262, align 4
  %int_cast_to_i6428 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6428)
  %264 = lshr i32 %257, 16
  %265 = and i32 %264, 255
  %266 = or i32 %265, 256
  %267 = zext i32 %266 to i64
  %268 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %267
  %269 = load i32* %268, align 4
  %270 = add i32 %269, %263
  %int_cast_to_i6429 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6429)
  %271 = lshr i32 %257, 8
  %272 = and i32 %271, 255
  %273 = or i32 %272, 512
  %274 = zext i32 %273 to i64
  %275 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %274
  %276 = load i32* %275, align 4
  %277 = xor i32 %270, %276
  %278 = and i32 %257, 255
  %279 = or i32 %278, 768
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %280
  %282 = load i32* %281, align 4
  %283 = add i32 %277, %282
  %284 = xor i32 %259, %229
  %285 = xor i32 %284, %283
  %286 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 11
  %287 = load i32* %286, align 4
  %int_cast_to_i6430 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6430)
  %288 = lshr i32 %285, 24
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %289
  %291 = load i32* %290, align 4
  %int_cast_to_i6431 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6431)
  %292 = lshr i32 %285, 16
  %293 = and i32 %292, 255
  %294 = or i32 %293, 256
  %295 = zext i32 %294 to i64
  %296 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %295
  %297 = load i32* %296, align 4
  %298 = add i32 %297, %291
  %int_cast_to_i6432 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6432)
  %299 = lshr i32 %285, 8
  %300 = and i32 %299, 255
  %301 = or i32 %300, 512
  %302 = zext i32 %301 to i64
  %303 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %302
  %304 = load i32* %303, align 4
  %305 = xor i32 %298, %304
  %306 = and i32 %285, 255
  %307 = or i32 %306, 768
  %308 = zext i32 %307 to i64
  %309 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %308
  %310 = load i32* %309, align 4
  %311 = add i32 %305, %310
  %312 = xor i32 %287, %257
  %313 = xor i32 %312, %311
  %314 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 12
  %315 = load i32* %314, align 4
  %int_cast_to_i6433 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6433)
  %316 = lshr i32 %313, 24
  %317 = zext i32 %316 to i64
  %318 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %317
  %319 = load i32* %318, align 4
  %int_cast_to_i6434 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6434)
  %320 = lshr i32 %313, 16
  %321 = and i32 %320, 255
  %322 = or i32 %321, 256
  %323 = zext i32 %322 to i64
  %324 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %323
  %325 = load i32* %324, align 4
  %326 = add i32 %325, %319
  %int_cast_to_i6435 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6435)
  %327 = lshr i32 %313, 8
  %328 = and i32 %327, 255
  %329 = or i32 %328, 512
  %330 = zext i32 %329 to i64
  %331 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %330
  %332 = load i32* %331, align 4
  %333 = xor i32 %326, %332
  %334 = and i32 %313, 255
  %335 = or i32 %334, 768
  %336 = zext i32 %335 to i64
  %337 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %336
  %338 = load i32* %337, align 4
  %339 = add i32 %333, %338
  %340 = xor i32 %315, %285
  %341 = xor i32 %340, %339
  %342 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 13
  %343 = load i32* %342, align 4
  %int_cast_to_i6436 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6436)
  %344 = lshr i32 %341, 24
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %345
  %347 = load i32* %346, align 4
  %int_cast_to_i6437 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6437)
  %348 = lshr i32 %341, 16
  %349 = and i32 %348, 255
  %350 = or i32 %349, 256
  %351 = zext i32 %350 to i64
  %352 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %351
  %353 = load i32* %352, align 4
  %354 = add i32 %353, %347
  %int_cast_to_i6438 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6438)
  %355 = lshr i32 %341, 8
  %356 = and i32 %355, 255
  %357 = or i32 %356, 512
  %358 = zext i32 %357 to i64
  %359 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %358
  %360 = load i32* %359, align 4
  %361 = xor i32 %354, %360
  %362 = and i32 %341, 255
  %363 = or i32 %362, 768
  %364 = zext i32 %363 to i64
  %365 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %364
  %366 = load i32* %365, align 4
  %367 = add i32 %361, %366
  %368 = xor i32 %343, %313
  %369 = xor i32 %368, %367
  %370 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 14
  %371 = load i32* %370, align 4
  %int_cast_to_i6439 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6439)
  %372 = lshr i32 %369, 24
  %373 = zext i32 %372 to i64
  %374 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %373
  %375 = load i32* %374, align 4
  %int_cast_to_i6440 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6440)
  %376 = lshr i32 %369, 16
  %377 = and i32 %376, 255
  %378 = or i32 %377, 256
  %379 = zext i32 %378 to i64
  %380 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %379
  %381 = load i32* %380, align 4
  %382 = add i32 %381, %375
  %int_cast_to_i6441 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6441)
  %383 = lshr i32 %369, 8
  %384 = and i32 %383, 255
  %385 = or i32 %384, 512
  %386 = zext i32 %385 to i64
  %387 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %386
  %388 = load i32* %387, align 4
  %389 = xor i32 %382, %388
  %390 = and i32 %369, 255
  %391 = or i32 %390, 768
  %392 = zext i32 %391 to i64
  %393 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %392
  %394 = load i32* %393, align 4
  %395 = add i32 %389, %394
  %396 = xor i32 %371, %341
  %397 = xor i32 %396, %395
  %398 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 15
  %399 = load i32* %398, align 4
  %int_cast_to_i6442 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6442)
  %400 = lshr i32 %397, 24
  %401 = zext i32 %400 to i64
  %402 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %401
  %403 = load i32* %402, align 4
  %int_cast_to_i6443 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6443)
  %404 = lshr i32 %397, 16
  %405 = and i32 %404, 255
  %406 = or i32 %405, 256
  %407 = zext i32 %406 to i64
  %408 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %407
  %409 = load i32* %408, align 4
  %410 = add i32 %409, %403
  %int_cast_to_i6444 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6444)
  %411 = lshr i32 %397, 8
  %412 = and i32 %411, 255
  %413 = or i32 %412, 512
  %414 = zext i32 %413 to i64
  %415 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %414
  %416 = load i32* %415, align 4
  %417 = xor i32 %410, %416
  %418 = and i32 %397, 255
  %419 = or i32 %418, 768
  %420 = zext i32 %419 to i64
  %421 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %420
  %422 = load i32* %421, align 4
  %423 = add i32 %417, %422
  %424 = xor i32 %399, %369
  %425 = xor i32 %424, %423
  %426 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 16
  %427 = load i32* %426, align 4
  %int_cast_to_i6445 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6445)
  %428 = lshr i32 %425, 24
  %429 = zext i32 %428 to i64
  %430 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %429
  %431 = load i32* %430, align 4
  %int_cast_to_i6446 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6446)
  %432 = lshr i32 %425, 16
  %433 = and i32 %432, 255
  %434 = or i32 %433, 256
  %435 = zext i32 %434 to i64
  %436 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %435
  %437 = load i32* %436, align 4
  %438 = add i32 %437, %431
  %int_cast_to_i6447 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6447)
  %439 = lshr i32 %425, 8
  %440 = and i32 %439, 255
  %441 = or i32 %440, 512
  %442 = zext i32 %441 to i64
  %443 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %442
  %444 = load i32* %443, align 4
  %445 = xor i32 %438, %444
  %446 = and i32 %425, 255
  %447 = or i32 %446, 768
  %448 = zext i32 %447 to i64
  %449 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %448
  %450 = load i32* %449, align 4
  %451 = add i32 %445, %450
  %452 = xor i32 %427, %397
  %453 = xor i32 %452, %451
  %454 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 17
  %455 = load i32* %454, align 4
  %456 = xor i32 %455, %425
  store i32 %453, i32* %2, align 4
  store i32 %456, i32* %data, align 4
  ret void
}

define void @BF_set_key_mod(i32 %len, i8* %data) nounwind {
entry:
  %in = alloca [2 x i32], align 4
  %0 = icmp sgt i32 %len, 72
  %1 = sext i32 %len to i64
  %2 = select i1 %0, i64 72, i64 %1
  %3 = getelementptr inbounds i8* %data, i64 %2
  br label %bb2

bb2:                                              ; preds = %bb2, %entry
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %bb2 ]
  %d.415 = phi i8* [ %data, %entry ], [ %d.3, %bb2 ]
  %scevgep = getelementptr %struct.BF_KEY* @key, i64 0, i32 0, i64 %indvar
  %4 = load i8* %d.415, align 1
  %5 = zext i8 %4 to i32
  %6 = getelementptr inbounds i8* %d.415, i64 1
  %7 = icmp ult i8* %6, %3
  %d.0 = select i1 %7, i8* %6, i8* %data
  %int_cast_to_i64 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64)
  %8 = shl nuw nsw i32 %5, 8
  %9 = load i8* %d.0, align 1
  %10 = zext i8 %9 to i32
  %11 = or i32 %10, %8
  %12 = getelementptr inbounds i8* %d.0, i64 1
  %13 = icmp ult i8* %12, %3
  %d.1 = select i1 %13, i8* %12, i8* %data
  %int_cast_to_i641 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641)
  %14 = shl nuw nsw i32 %11, 8
  %15 = load i8* %d.1, align 1
  %16 = zext i8 %15 to i32
  %17 = or i32 %14, %16
  %18 = getelementptr inbounds i8* %d.1, i64 1
  %19 = icmp ult i8* %18, %3
  %d.2 = select i1 %19, i8* %18, i8* %data
  %int_cast_to_i642 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642)
  %20 = shl nuw i32 %17, 8
  %21 = load i8* %d.2, align 1
  %22 = zext i8 %21 to i32
  %23 = or i32 %20, %22
  %24 = getelementptr inbounds i8* %d.2, i64 1
  %25 = icmp ult i8* %24, %3
  %d.3 = select i1 %25, i8* %24, i8* %data
  %26 = load i32* %scevgep, align 4
  %27 = xor i32 %23, %26
  store i32 %27, i32* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 18
  br i1 %exitcond, label %bb12, label %bb2

bb12:                                             ; preds = %bb2
  %28 = getelementptr inbounds [2 x i32]* %in, i64 0, i64 0
  store i32 0, i32* %28, align 4
  %29 = getelementptr inbounds [2 x i32]* %in, i64 0, i64 1
  store i32 0, i32* %29, align 4
  call void @BF_encrypt(i32* %28, %struct.BF_KEY* @key) nounwind
  %30 = load i32* %28, align 4
  store i32 %30, i32* getelementptr inbounds (%struct.BF_KEY* @key, i64 0, i32 0, i64 0), align 32
  %31 = load i32* %29, align 4
  store i32 %31, i32* getelementptr inbounds (%struct.BF_KEY* @key, i64 0, i32 0, i64 1), align 4
  ret void
}

define void @BF_decrypt(i32* nocapture %data, %struct.BF_KEY* %key) nounwind {
entry:
  %0 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 0
  %1 = load i32* %data, align 4
  %2 = getelementptr inbounds i32* %data, i64 1
  %3 = load i32* %2, align 4
  %4 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 17
  %5 = load i32* %4, align 4
  %6 = xor i32 %5, %1
  %7 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 16
  %8 = load i32* %7, align 4
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64)
  %9 = lshr i32 %6, 24
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %10
  %12 = load i32* %11, align 4
  %int_cast_to_i641 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641)
  %13 = lshr i32 %6, 16
  %14 = and i32 %13, 255
  %15 = or i32 %14, 256
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %16
  %18 = load i32* %17, align 4
  %19 = add i32 %18, %12
  %int_cast_to_i642 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642)
  %20 = lshr i32 %6, 8
  %21 = and i32 %20, 255
  %22 = or i32 %21, 512
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %23
  %25 = load i32* %24, align 4
  %26 = xor i32 %19, %25
  %27 = and i32 %6, 255
  %28 = or i32 %27, 768
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %29
  %31 = load i32* %30, align 4
  %32 = add i32 %26, %31
  %33 = xor i32 %8, %3
  %34 = xor i32 %33, %32
  %35 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 15
  %36 = load i32* %35, align 4
  %int_cast_to_i643 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i643)
  %37 = lshr i32 %34, 24
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %38
  %40 = load i32* %39, align 4
  %int_cast_to_i644 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i644)
  %41 = lshr i32 %34, 16
  %42 = and i32 %41, 255
  %43 = or i32 %42, 256
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %44
  %46 = load i32* %45, align 4
  %47 = add i32 %46, %40
  %int_cast_to_i645 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i645)
  %48 = lshr i32 %34, 8
  %49 = and i32 %48, 255
  %50 = or i32 %49, 512
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %51
  %53 = load i32* %52, align 4
  %54 = xor i32 %47, %53
  %55 = and i32 %34, 255
  %56 = or i32 %55, 768
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %57
  %59 = load i32* %58, align 4
  %60 = add i32 %54, %59
  %61 = xor i32 %36, %6
  %62 = xor i32 %61, %60
  %63 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 14
  %64 = load i32* %63, align 4
  %int_cast_to_i646 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i646)
  %65 = lshr i32 %62, 24
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %66
  %68 = load i32* %67, align 4
  %int_cast_to_i647 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i647)
  %69 = lshr i32 %62, 16
  %70 = and i32 %69, 255
  %71 = or i32 %70, 256
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %72
  %74 = load i32* %73, align 4
  %75 = add i32 %74, %68
  %int_cast_to_i648 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i648)
  %76 = lshr i32 %62, 8
  %77 = and i32 %76, 255
  %78 = or i32 %77, 512
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %79
  %81 = load i32* %80, align 4
  %82 = xor i32 %75, %81
  %83 = and i32 %62, 255
  %84 = or i32 %83, 768
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %85
  %87 = load i32* %86, align 4
  %88 = add i32 %82, %87
  %89 = xor i32 %64, %34
  %90 = xor i32 %89, %88
  %91 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 13
  %92 = load i32* %91, align 4
  %int_cast_to_i649 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i649)
  %93 = lshr i32 %90, 24
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %94
  %96 = load i32* %95, align 4
  %int_cast_to_i6410 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6410)
  %97 = lshr i32 %90, 16
  %98 = and i32 %97, 255
  %99 = or i32 %98, 256
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %100
  %102 = load i32* %101, align 4
  %103 = add i32 %102, %96
  %int_cast_to_i6411 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6411)
  %104 = lshr i32 %90, 8
  %105 = and i32 %104, 255
  %106 = or i32 %105, 512
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %107
  %109 = load i32* %108, align 4
  %110 = xor i32 %103, %109
  %111 = and i32 %90, 255
  %112 = or i32 %111, 768
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %113
  %115 = load i32* %114, align 4
  %116 = add i32 %110, %115
  %117 = xor i32 %92, %62
  %118 = xor i32 %117, %116
  %119 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 12
  %120 = load i32* %119, align 4
  %int_cast_to_i6412 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6412)
  %121 = lshr i32 %118, 24
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %122
  %124 = load i32* %123, align 4
  %int_cast_to_i6413 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6413)
  %125 = lshr i32 %118, 16
  %126 = and i32 %125, 255
  %127 = or i32 %126, 256
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %128
  %130 = load i32* %129, align 4
  %131 = add i32 %130, %124
  %int_cast_to_i6414 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6414)
  %132 = lshr i32 %118, 8
  %133 = and i32 %132, 255
  %134 = or i32 %133, 512
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %135
  %137 = load i32* %136, align 4
  %138 = xor i32 %131, %137
  %139 = and i32 %118, 255
  %140 = or i32 %139, 768
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %141
  %143 = load i32* %142, align 4
  %144 = add i32 %138, %143
  %145 = xor i32 %120, %90
  %146 = xor i32 %145, %144
  %147 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 11
  %148 = load i32* %147, align 4
  %int_cast_to_i6415 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6415)
  %149 = lshr i32 %146, 24
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %150
  %152 = load i32* %151, align 4
  %int_cast_to_i6416 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6416)
  %153 = lshr i32 %146, 16
  %154 = and i32 %153, 255
  %155 = or i32 %154, 256
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %156
  %158 = load i32* %157, align 4
  %159 = add i32 %158, %152
  %int_cast_to_i6417 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6417)
  %160 = lshr i32 %146, 8
  %161 = and i32 %160, 255
  %162 = or i32 %161, 512
  %163 = zext i32 %162 to i64
  %164 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %163
  %165 = load i32* %164, align 4
  %166 = xor i32 %159, %165
  %167 = and i32 %146, 255
  %168 = or i32 %167, 768
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %169
  %171 = load i32* %170, align 4
  %172 = add i32 %166, %171
  %173 = xor i32 %148, %118
  %174 = xor i32 %173, %172
  %175 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 10
  %176 = load i32* %175, align 4
  %int_cast_to_i6418 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6418)
  %177 = lshr i32 %174, 24
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %178
  %180 = load i32* %179, align 4
  %int_cast_to_i6419 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6419)
  %181 = lshr i32 %174, 16
  %182 = and i32 %181, 255
  %183 = or i32 %182, 256
  %184 = zext i32 %183 to i64
  %185 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %184
  %186 = load i32* %185, align 4
  %187 = add i32 %186, %180
  %int_cast_to_i6420 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6420)
  %188 = lshr i32 %174, 8
  %189 = and i32 %188, 255
  %190 = or i32 %189, 512
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %191
  %193 = load i32* %192, align 4
  %194 = xor i32 %187, %193
  %195 = and i32 %174, 255
  %196 = or i32 %195, 768
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %197
  %199 = load i32* %198, align 4
  %200 = add i32 %194, %199
  %201 = xor i32 %176, %146
  %202 = xor i32 %201, %200
  %203 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 9
  %204 = load i32* %203, align 4
  %int_cast_to_i6421 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6421)
  %205 = lshr i32 %202, 24
  %206 = zext i32 %205 to i64
  %207 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %206
  %208 = load i32* %207, align 4
  %int_cast_to_i6422 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6422)
  %209 = lshr i32 %202, 16
  %210 = and i32 %209, 255
  %211 = or i32 %210, 256
  %212 = zext i32 %211 to i64
  %213 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %212
  %214 = load i32* %213, align 4
  %215 = add i32 %214, %208
  %int_cast_to_i6423 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6423)
  %216 = lshr i32 %202, 8
  %217 = and i32 %216, 255
  %218 = or i32 %217, 512
  %219 = zext i32 %218 to i64
  %220 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %219
  %221 = load i32* %220, align 4
  %222 = xor i32 %215, %221
  %223 = and i32 %202, 255
  %224 = or i32 %223, 768
  %225 = zext i32 %224 to i64
  %226 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %225
  %227 = load i32* %226, align 4
  %228 = add i32 %222, %227
  %229 = xor i32 %204, %174
  %230 = xor i32 %229, %228
  %231 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 8
  %232 = load i32* %231, align 4
  %int_cast_to_i6424 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6424)
  %233 = lshr i32 %230, 24
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %234
  %236 = load i32* %235, align 4
  %int_cast_to_i6425 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6425)
  %237 = lshr i32 %230, 16
  %238 = and i32 %237, 255
  %239 = or i32 %238, 256
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %240
  %242 = load i32* %241, align 4
  %243 = add i32 %242, %236
  %int_cast_to_i6426 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6426)
  %244 = lshr i32 %230, 8
  %245 = and i32 %244, 255
  %246 = or i32 %245, 512
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %247
  %249 = load i32* %248, align 4
  %250 = xor i32 %243, %249
  %251 = and i32 %230, 255
  %252 = or i32 %251, 768
  %253 = zext i32 %252 to i64
  %254 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %253
  %255 = load i32* %254, align 4
  %256 = add i32 %250, %255
  %257 = xor i32 %232, %202
  %258 = xor i32 %257, %256
  %259 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 7
  %260 = load i32* %259, align 4
  %int_cast_to_i6427 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6427)
  %261 = lshr i32 %258, 24
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %262
  %264 = load i32* %263, align 4
  %int_cast_to_i6428 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6428)
  %265 = lshr i32 %258, 16
  %266 = and i32 %265, 255
  %267 = or i32 %266, 256
  %268 = zext i32 %267 to i64
  %269 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %268
  %270 = load i32* %269, align 4
  %271 = add i32 %270, %264
  %int_cast_to_i6429 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6429)
  %272 = lshr i32 %258, 8
  %273 = and i32 %272, 255
  %274 = or i32 %273, 512
  %275 = zext i32 %274 to i64
  %276 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %275
  %277 = load i32* %276, align 4
  %278 = xor i32 %271, %277
  %279 = and i32 %258, 255
  %280 = or i32 %279, 768
  %281 = zext i32 %280 to i64
  %282 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %281
  %283 = load i32* %282, align 4
  %284 = add i32 %278, %283
  %285 = xor i32 %260, %230
  %286 = xor i32 %285, %284
  %287 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 6
  %288 = load i32* %287, align 4
  %int_cast_to_i6430 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6430)
  %289 = lshr i32 %286, 24
  %290 = zext i32 %289 to i64
  %291 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %290
  %292 = load i32* %291, align 4
  %int_cast_to_i6431 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6431)
  %293 = lshr i32 %286, 16
  %294 = and i32 %293, 255
  %295 = or i32 %294, 256
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %296
  %298 = load i32* %297, align 4
  %299 = add i32 %298, %292
  %int_cast_to_i6432 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6432)
  %300 = lshr i32 %286, 8
  %301 = and i32 %300, 255
  %302 = or i32 %301, 512
  %303 = zext i32 %302 to i64
  %304 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %303
  %305 = load i32* %304, align 4
  %306 = xor i32 %299, %305
  %307 = and i32 %286, 255
  %308 = or i32 %307, 768
  %309 = zext i32 %308 to i64
  %310 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %309
  %311 = load i32* %310, align 4
  %312 = add i32 %306, %311
  %313 = xor i32 %288, %258
  %314 = xor i32 %313, %312
  %315 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 5
  %316 = load i32* %315, align 4
  %int_cast_to_i6433 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6433)
  %317 = lshr i32 %314, 24
  %318 = zext i32 %317 to i64
  %319 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %318
  %320 = load i32* %319, align 4
  %int_cast_to_i6434 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6434)
  %321 = lshr i32 %314, 16
  %322 = and i32 %321, 255
  %323 = or i32 %322, 256
  %324 = zext i32 %323 to i64
  %325 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %324
  %326 = load i32* %325, align 4
  %327 = add i32 %326, %320
  %int_cast_to_i6435 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6435)
  %328 = lshr i32 %314, 8
  %329 = and i32 %328, 255
  %330 = or i32 %329, 512
  %331 = zext i32 %330 to i64
  %332 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %331
  %333 = load i32* %332, align 4
  %334 = xor i32 %327, %333
  %335 = and i32 %314, 255
  %336 = or i32 %335, 768
  %337 = zext i32 %336 to i64
  %338 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %337
  %339 = load i32* %338, align 4
  %340 = add i32 %334, %339
  %341 = xor i32 %316, %286
  %342 = xor i32 %341, %340
  %343 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 4
  %344 = load i32* %343, align 4
  %int_cast_to_i6436 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6436)
  %345 = lshr i32 %342, 24
  %346 = zext i32 %345 to i64
  %347 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %346
  %348 = load i32* %347, align 4
  %int_cast_to_i6437 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6437)
  %349 = lshr i32 %342, 16
  %350 = and i32 %349, 255
  %351 = or i32 %350, 256
  %352 = zext i32 %351 to i64
  %353 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %352
  %354 = load i32* %353, align 4
  %355 = add i32 %354, %348
  %int_cast_to_i6438 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6438)
  %356 = lshr i32 %342, 8
  %357 = and i32 %356, 255
  %358 = or i32 %357, 512
  %359 = zext i32 %358 to i64
  %360 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %359
  %361 = load i32* %360, align 4
  %362 = xor i32 %355, %361
  %363 = and i32 %342, 255
  %364 = or i32 %363, 768
  %365 = zext i32 %364 to i64
  %366 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %365
  %367 = load i32* %366, align 4
  %368 = add i32 %362, %367
  %369 = xor i32 %344, %314
  %370 = xor i32 %369, %368
  %371 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 3
  %372 = load i32* %371, align 4
  %int_cast_to_i6439 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6439)
  %373 = lshr i32 %370, 24
  %374 = zext i32 %373 to i64
  %375 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %374
  %376 = load i32* %375, align 4
  %int_cast_to_i6440 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6440)
  %377 = lshr i32 %370, 16
  %378 = and i32 %377, 255
  %379 = or i32 %378, 256
  %380 = zext i32 %379 to i64
  %381 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %380
  %382 = load i32* %381, align 4
  %383 = add i32 %382, %376
  %int_cast_to_i6441 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6441)
  %384 = lshr i32 %370, 8
  %385 = and i32 %384, 255
  %386 = or i32 %385, 512
  %387 = zext i32 %386 to i64
  %388 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %387
  %389 = load i32* %388, align 4
  %390 = xor i32 %383, %389
  %391 = and i32 %370, 255
  %392 = or i32 %391, 768
  %393 = zext i32 %392 to i64
  %394 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %393
  %395 = load i32* %394, align 4
  %396 = add i32 %390, %395
  %397 = xor i32 %372, %342
  %398 = xor i32 %397, %396
  %399 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 2
  %400 = load i32* %399, align 4
  %int_cast_to_i6442 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6442)
  %401 = lshr i32 %398, 24
  %402 = zext i32 %401 to i64
  %403 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %402
  %404 = load i32* %403, align 4
  %int_cast_to_i6443 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6443)
  %405 = lshr i32 %398, 16
  %406 = and i32 %405, 255
  %407 = or i32 %406, 256
  %408 = zext i32 %407 to i64
  %409 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %408
  %410 = load i32* %409, align 4
  %411 = add i32 %410, %404
  %int_cast_to_i6444 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6444)
  %412 = lshr i32 %398, 8
  %413 = and i32 %412, 255
  %414 = or i32 %413, 512
  %415 = zext i32 %414 to i64
  %416 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %415
  %417 = load i32* %416, align 4
  %418 = xor i32 %411, %417
  %419 = and i32 %398, 255
  %420 = or i32 %419, 768
  %421 = zext i32 %420 to i64
  %422 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %421
  %423 = load i32* %422, align 4
  %424 = add i32 %418, %423
  %425 = xor i32 %400, %370
  %426 = xor i32 %425, %424
  %427 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 0, i64 1
  %428 = load i32* %427, align 4
  %int_cast_to_i6445 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6445)
  %429 = lshr i32 %426, 24
  %430 = zext i32 %429 to i64
  %431 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %430
  %432 = load i32* %431, align 4
  %int_cast_to_i6446 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6446)
  %433 = lshr i32 %426, 16
  %434 = and i32 %433, 255
  %435 = or i32 %434, 256
  %436 = zext i32 %435 to i64
  %437 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %436
  %438 = load i32* %437, align 4
  %439 = add i32 %438, %432
  %int_cast_to_i6447 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6447)
  %440 = lshr i32 %426, 8
  %441 = and i32 %440, 255
  %442 = or i32 %441, 512
  %443 = zext i32 %442 to i64
  %444 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %443
  %445 = load i32* %444, align 4
  %446 = xor i32 %439, %445
  %447 = and i32 %426, 255
  %448 = or i32 %447, 768
  %449 = zext i32 %448 to i64
  %450 = getelementptr inbounds %struct.BF_KEY* %key, i64 0, i32 1, i64 %449
  %451 = load i32* %450, align 4
  %452 = add i32 %446, %451
  %453 = xor i32 %428, %398
  %454 = xor i32 %453, %452
  %455 = load i32* %0, align 4
  %456 = xor i32 %455, %426
  store i32 %454, i32* %2, align 4
  store i32 %456, i32* %data, align 4
  ret void
}

define void @BF_cbc_encrypt(i8* nocapture %in, i8* nocapture %out, i64 %length, %struct.BF_KEY* %schedule, i8* %ivec, i32 %encrypt) nounwind {
entry:
  %tin = alloca [2 x i32], align 4
  %0 = icmp eq i32 %encrypt, 0
  %1 = load i8* %ivec, align 1
  %2 = zext i8 %1 to i32
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64)
  %3 = shl nuw i32 %2, 24
  %4 = getelementptr inbounds i8* %ivec, i64 1
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %int_cast_to_i641 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641)
  %7 = shl nuw nsw i32 %6, 16
  %8 = getelementptr inbounds i8* %ivec, i64 2
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %int_cast_to_i642 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642)
  %11 = shl nuw nsw i32 %10, 8
  %12 = getelementptr inbounds i8* %ivec, i64 3
  %13 = load i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = or i32 %7, %3
  %16 = or i32 %15, %14
  %17 = or i32 %16, %11
  %18 = getelementptr inbounds i8* %ivec, i64 4
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %int_cast_to_i643 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i643)
  %21 = shl nuw i32 %20, 24
  %22 = getelementptr inbounds i8* %ivec, i64 5
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %int_cast_to_i644 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i644)
  %25 = shl nuw nsw i32 %24, 16
  %26 = getelementptr inbounds i8* %ivec, i64 6
  %27 = load i8* %26, align 1
  %28 = zext i8 %27 to i32
  %int_cast_to_i645 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i645)
  %29 = shl nuw nsw i32 %28, 8
  %30 = getelementptr inbounds i8* %ivec, i64 7
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = or i32 %25, %21
  %34 = or i32 %33, %32
  %35 = or i32 %34, %29
  %l.153 = add nsw i64 %length, -8
  %36 = icmp sgt i64 %l.153, -1
  br i1 %0, label %bb20.preheader, label %bb3.preheader

bb20.preheader:                                   ; preds = %entry
  br i1 %36, label %bb18.lr.ph, label %bb21

bb18.lr.ph:                                       ; preds = %bb20.preheader
  %37 = getelementptr inbounds [2 x i32]* %tin, i64 0, i64 0
  %38 = getelementptr inbounds [2 x i32]* %tin, i64 0, i64 1
  %tmp105 = add i64 %length, -16
  br label %bb18

bb3.preheader:                                    ; preds = %entry
  br i1 %36, label %bb1.lr.ph, label %bb4

bb1.lr.ph:                                        ; preds = %bb3.preheader
  %39 = getelementptr inbounds [2 x i32]* %tin, i64 0, i64 0
  %40 = getelementptr inbounds [2 x i32]* %tin, i64 0, i64 1
  %tmp69 = add i64 %length, -16
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.lr.ph
  %indvar = phi i64 [ 0, %bb1.lr.ph ], [ %indvar.next, %bb1 ]
  %tout0.045 = phi i32 [ %17, %bb1.lr.ph ], [ %71, %bb1 ]
  %tout1.044 = phi i32 [ %35, %bb1.lr.ph ], [ %72, %bb1 ]
  %tmp = mul i64 %indvar, -8
  %l.0 = add i64 %tmp69, %tmp
  %int_cast_to_i646 = bitcast i64 3 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i646)
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
  %42 = zext i8 %41 to i32
  %int_cast_to_i647 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i647)
  %43 = shl nuw i32 %42, 24
  %44 = load i8* %scevgep, align 1
  %45 = zext i8 %44 to i32
  %int_cast_to_i648 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i648)
  %46 = shl nuw nsw i32 %45, 16
  %47 = load i8* %scevgep74, align 1
  %48 = zext i8 %47 to i32
  %int_cast_to_i649 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i649)
  %49 = shl nuw nsw i32 %48, 8
  %50 = load i8* %scevgep76, align 1
  %51 = zext i8 %50 to i32
  %52 = or i32 %46, %43
  %53 = or i32 %52, %51
  %54 = or i32 %53, %49
  %55 = load i8* %scevgep78, align 1
  %56 = zext i8 %55 to i32
  %int_cast_to_i6410 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6410)
  %57 = shl nuw i32 %56, 24
  %58 = load i8* %scevgep80, align 1
  %59 = zext i8 %58 to i32
  %int_cast_to_i6411 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6411)
  %60 = shl nuw nsw i32 %59, 16
  %61 = load i8* %scevgep82, align 1
  %62 = zext i8 %61 to i32
  %int_cast_to_i6412 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6412)
  %63 = shl nuw nsw i32 %62, 8
  %64 = load i8* %scevgep84, align 1
  %65 = zext i8 %64 to i32
  %66 = or i32 %60, %57
  %67 = or i32 %66, %65
  %68 = or i32 %67, %63
  %69 = xor i32 %54, %tout0.045
  %70 = xor i32 %68, %tout1.044
  store i32 %69, i32* %39, align 4
  store i32 %70, i32* %40, align 4
  call void @BF_encrypt(i32* %39, %struct.BF_KEY* %schedule) nounwind
  %71 = load i32* %39, align 4
  %72 = load i32* %40, align 4
  %int_cast_to_i6413 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6413)
  %73 = lshr i32 %71, 24
  %74 = trunc i32 %73 to i8
  store i8 %74, i8* %out_addr.046, align 1
  %int_cast_to_i6414 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6414)
  %75 = lshr i32 %71, 16
  %76 = trunc i32 %75 to i8
  store i8 %76, i8* %scevgep88, align 1
  %int_cast_to_i6415 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6415)
  %77 = lshr i32 %71, 8
  %78 = trunc i32 %77 to i8
  store i8 %78, i8* %scevgep89, align 1
  %79 = trunc i32 %71 to i8
  store i8 %79, i8* %scevgep90, align 1
  %int_cast_to_i6416 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6416)
  %80 = lshr i32 %72, 24
  %81 = trunc i32 %80 to i8
  store i8 %81, i8* %scevgep91, align 1
  %int_cast_to_i6417 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6417)
  %82 = lshr i32 %72, 16
  %83 = trunc i32 %82 to i8
  store i8 %83, i8* %scevgep92, align 1
  %int_cast_to_i6418 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6418)
  %84 = lshr i32 %72, 8
  %85 = trunc i32 %84 to i8
  store i8 %85, i8* %scevgep93, align 1
  %86 = trunc i32 %72 to i8
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
  %tout0.0.lcssa = phi i32 [ %71, %bb3.bb4_crit_edge ], [ %17, %bb3.preheader ]
  %tout1.0.lcssa = phi i32 [ %72, %bb3.bb4_crit_edge ], [ %35, %bb3.preheader ]
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
  %92 = zext i8 %91 to i32
  br label %bb7

bb7:                                              ; preds = %bb6, %bb5
  %tin1.0 = phi i32 [ %92, %bb6 ], [ 0, %bb5 ]
  %in_addr.1 = phi i8* [ %90, %bb6 ], [ %89, %bb5 ]
  %93 = getelementptr inbounds i8* %in_addr.1, i64 -1
  %94 = load i8* %93, align 1
  %95 = zext i8 %94 to i32
  %int_cast_to_i6419 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6419)
  %96 = shl nuw nsw i32 %95, 8
  %97 = or i32 %96, %tin1.0
  br label %bb8

bb8:                                              ; preds = %bb7, %bb5
  %tin1.1 = phi i32 [ %97, %bb7 ], [ 0, %bb5 ]
  %in_addr.2 = phi i8* [ %93, %bb7 ], [ %89, %bb5 ]
  %98 = getelementptr inbounds i8* %in_addr.2, i64 -1
  %99 = load i8* %98, align 1
  %100 = zext i8 %99 to i32
  %int_cast_to_i6420 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6420)
  %101 = shl nuw nsw i32 %100, 16
  %102 = or i32 %101, %tin1.1
  br label %bb9

bb9:                                              ; preds = %bb8, %bb5
  %tin1.2 = phi i32 [ %102, %bb8 ], [ 0, %bb5 ]
  %in_addr.3 = phi i8* [ %98, %bb8 ], [ %89, %bb5 ]
  %103 = getelementptr inbounds i8* %in_addr.3, i64 -1
  %104 = load i8* %103, align 1
  %105 = zext i8 %104 to i32
  %int_cast_to_i6421 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6421)
  %106 = shl nuw i32 %105, 24
  %107 = or i32 %106, %tin1.2
  br label %bb10

bb10:                                             ; preds = %bb9, %bb5
  %tin1.3 = phi i32 [ %107, %bb9 ], [ 0, %bb5 ]
  %in_addr.4 = phi i8* [ %103, %bb9 ], [ %89, %bb5 ]
  %108 = getelementptr inbounds i8* %in_addr.4, i64 -1
  %109 = load i8* %108, align 1
  %110 = zext i8 %109 to i32
  br label %bb11

bb11:                                             ; preds = %bb10, %bb5
  %tin1.4 = phi i32 [ %tin1.3, %bb10 ], [ 0, %bb5 ]
  %tin0.0 = phi i32 [ %110, %bb10 ], [ 0, %bb5 ]
  %in_addr.5 = phi i8* [ %108, %bb10 ], [ %89, %bb5 ]
  %111 = getelementptr inbounds i8* %in_addr.5, i64 -1
  %112 = load i8* %111, align 1
  %113 = zext i8 %112 to i32
  %int_cast_to_i6422 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6422)
  %114 = shl nuw nsw i32 %113, 8
  %115 = or i32 %114, %tin0.0
  br label %bb12

bb12:                                             ; preds = %bb11, %bb5
  %tin1.5 = phi i32 [ %tin1.4, %bb11 ], [ 0, %bb5 ]
  %tin0.1 = phi i32 [ %115, %bb11 ], [ 0, %bb5 ]
  %in_addr.6 = phi i8* [ %111, %bb11 ], [ %89, %bb5 ]
  %116 = getelementptr inbounds i8* %in_addr.6, i64 -1
  %117 = load i8* %116, align 1
  %118 = zext i8 %117 to i32
  %int_cast_to_i6423 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6423)
  %119 = shl nuw nsw i32 %118, 16
  %120 = or i32 %119, %tin0.1
  br label %bb13

bb13:                                             ; preds = %bb12, %bb5
  %tin1.6 = phi i32 [ %tin1.5, %bb12 ], [ 0, %bb5 ]
  %tin0.2 = phi i32 [ %120, %bb12 ], [ 0, %bb5 ]
  %in_addr.7 = phi i8* [ %116, %bb12 ], [ %89, %bb5 ]
  %121 = getelementptr inbounds i8* %in_addr.7, i64 -1
  %122 = load i8* %121, align 1
  %123 = zext i8 %122 to i32
  %int_cast_to_i6424 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6424)
  %124 = shl nuw i32 %123, 24
  %125 = or i32 %124, %tin0.2
  br label %bb14

bb14:                                             ; preds = %bb13, %bb5
  %tin1.7 = phi i32 [ 0, %bb5 ], [ %tin1.6, %bb13 ]
  %tin0.3 = phi i32 [ 0, %bb5 ], [ %125, %bb13 ]
  %126 = xor i32 %tin0.3, %tout0.0.lcssa
  %127 = xor i32 %tin1.7, %tout1.0.lcssa
  %128 = getelementptr inbounds [2 x i32]* %tin, i64 0, i64 0
  store i32 %126, i32* %128, align 4
  %129 = getelementptr inbounds [2 x i32]* %tin, i64 0, i64 1
  store i32 %127, i32* %129, align 4
  call void @BF_encrypt(i32* %128, %struct.BF_KEY* %schedule) nounwind
  %130 = load i32* %128, align 4
  %131 = load i32* %129, align 4
  %int_cast_to_i6425 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6425)
  %132 = lshr i32 %130, 24
  %133 = trunc i32 %132 to i8
  store i8 %133, i8* %out_addr.0.lcssa, align 1
  %134 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 1
  %int_cast_to_i6426 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6426)
  %135 = lshr i32 %130, 16
  %136 = trunc i32 %135 to i8
  store i8 %136, i8* %134, align 1
  %137 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 2
  %int_cast_to_i6427 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6427)
  %138 = lshr i32 %130, 8
  %139 = trunc i32 %138 to i8
  store i8 %139, i8* %137, align 1
  %140 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 3
  %141 = trunc i32 %130 to i8
  store i8 %141, i8* %140, align 1
  %142 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 4
  %int_cast_to_i6428 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6428)
  %143 = lshr i32 %131, 24
  %144 = trunc i32 %143 to i8
  store i8 %144, i8* %142, align 1
  %145 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 5
  %int_cast_to_i6429 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6429)
  %146 = lshr i32 %131, 16
  %147 = trunc i32 %146 to i8
  store i8 %147, i8* %145, align 1
  %148 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 6
  %int_cast_to_i6430 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6430)
  %149 = lshr i32 %131, 8
  %150 = trunc i32 %149 to i8
  store i8 %150, i8* %148, align 1
  %151 = getelementptr inbounds i8* %out_addr.0.lcssa, i64 7
  %152 = trunc i32 %131 to i8
  store i8 %152, i8* %151, align 1
  br label %bb34

bb18:                                             ; preds = %bb18, %bb18.lr.ph
  %indvar100 = phi i64 [ 0, %bb18.lr.ph ], [ %indvar.next101, %bb18 ]
  %xor1.055 = phi i32 [ %35, %bb18.lr.ph ], [ %180, %bb18 ]
  %xor0.054 = phi i32 [ %17, %bb18.lr.ph ], [ %166, %bb18 ]
  %tmp102 = mul i64 %indvar100, -8
  %l.1 = add i64 %tmp105, %tmp102
  %int_cast_to_i6431 = bitcast i64 3 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i6431)
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
  %154 = zext i8 %153 to i32
  %int_cast_to_i6432 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6432)
  %155 = shl nuw i32 %154, 24
  %156 = load i8* %scevgep110, align 1
  %157 = zext i8 %156 to i32
  %int_cast_to_i6433 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6433)
  %158 = shl nuw nsw i32 %157, 16
  %159 = load i8* %scevgep112, align 1
  %160 = zext i8 %159 to i32
  %int_cast_to_i6434 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6434)
  %161 = shl nuw nsw i32 %160, 8
  %162 = load i8* %scevgep114, align 1
  %163 = zext i8 %162 to i32
  %164 = or i32 %158, %155
  %165 = or i32 %164, %163
  %166 = or i32 %165, %161
  %167 = load i8* %scevgep116, align 1
  %168 = zext i8 %167 to i32
  %int_cast_to_i6435 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6435)
  %169 = shl nuw i32 %168, 24
  %170 = load i8* %scevgep118, align 1
  %171 = zext i8 %170 to i32
  %int_cast_to_i6436 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6436)
  %172 = shl nuw nsw i32 %171, 16
  %173 = load i8* %scevgep120, align 1
  %174 = zext i8 %173 to i32
  %int_cast_to_i6437 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6437)
  %175 = shl nuw nsw i32 %174, 8
  %176 = load i8* %scevgep122, align 1
  %177 = zext i8 %176 to i32
  %178 = or i32 %172, %169
  %179 = or i32 %178, %177
  %180 = or i32 %179, %175
  store i32 %166, i32* %37, align 4
  store i32 %180, i32* %38, align 4
  call void @BF_decrypt(i32* %37, %struct.BF_KEY* %schedule) nounwind
  %181 = load i32* %37, align 4
  %182 = xor i32 %181, %xor0.054
  %183 = load i32* %38, align 4
  %184 = xor i32 %183, %xor1.055
  %int_cast_to_i6438 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6438)
  %185 = lshr i32 %182, 24
  %186 = trunc i32 %185 to i8
  store i8 %186, i8* %out_addr.156, align 1
  %int_cast_to_i6439 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6439)
  %187 = lshr i32 %182, 16
  %188 = trunc i32 %187 to i8
  store i8 %188, i8* %scevgep126, align 1
  %int_cast_to_i6440 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6440)
  %189 = lshr i32 %182, 8
  %190 = trunc i32 %189 to i8
  store i8 %190, i8* %scevgep127, align 1
  %191 = trunc i32 %182 to i8
  store i8 %191, i8* %scevgep128, align 1
  %int_cast_to_i6441 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6441)
  %192 = lshr i32 %184, 24
  %193 = trunc i32 %192 to i8
  store i8 %193, i8* %scevgep129, align 1
  %int_cast_to_i6442 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6442)
  %194 = lshr i32 %184, 16
  %195 = trunc i32 %194 to i8
  store i8 %195, i8* %scevgep130, align 1
  %int_cast_to_i6443 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6443)
  %196 = lshr i32 %184, 8
  %197 = trunc i32 %196 to i8
  store i8 %197, i8* %scevgep131, align 1
  %198 = trunc i32 %184 to i8
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
  %xor1.0.lcssa = phi i32 [ %180, %bb20.bb21_crit_edge ], [ %35, %bb20.preheader ]
  %xor0.0.lcssa = phi i32 [ %166, %bb20.bb21_crit_edge ], [ %17, %bb20.preheader ]
  %200 = icmp eq i64 %l.1.in.lcssa, 0
  br i1 %200, label %bb34, label %bb22

bb22:                                             ; preds = %bb21
  %201 = load i8* %in_addr.8.lcssa, align 1
  %202 = zext i8 %201 to i32
  %int_cast_to_i6444 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6444)
  %203 = shl nuw i32 %202, 24
  %204 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 1
  %205 = load i8* %204, align 1
  %206 = zext i8 %205 to i32
  %int_cast_to_i6445 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6445)
  %207 = shl nuw nsw i32 %206, 16
  %208 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 2
  %209 = load i8* %208, align 1
  %210 = zext i8 %209 to i32
  %int_cast_to_i6446 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6446)
  %211 = shl nuw nsw i32 %210, 8
  %212 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 3
  %213 = load i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = or i32 %207, %203
  %216 = or i32 %215, %214
  %217 = or i32 %216, %211
  %218 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 4
  %219 = load i8* %218, align 1
  %220 = zext i8 %219 to i32
  %int_cast_to_i6447 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6447)
  %221 = shl nuw i32 %220, 24
  %222 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 5
  %223 = load i8* %222, align 1
  %224 = zext i8 %223 to i32
  %int_cast_to_i6448 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6448)
  %225 = shl nuw nsw i32 %224, 16
  %226 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 6
  %227 = load i8* %226, align 1
  %228 = zext i8 %227 to i32
  %int_cast_to_i6449 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6449)
  %229 = shl nuw nsw i32 %228, 8
  %230 = getelementptr inbounds i8* %in_addr.8.lcssa, i64 7
  %231 = load i8* %230, align 1
  %232 = zext i8 %231 to i32
  %233 = or i32 %225, %221
  %234 = or i32 %233, %232
  %235 = or i32 %234, %229
  %236 = getelementptr inbounds [2 x i32]* %tin, i64 0, i64 0
  store i32 %217, i32* %236, align 4
  %237 = getelementptr inbounds [2 x i32]* %tin, i64 0, i64 1
  store i32 %235, i32* %237, align 4
  call void @BF_decrypt(i32* %236, %struct.BF_KEY* %schedule) nounwind
  %238 = load i32* %236, align 4
  %239 = xor i32 %238, %xor0.0.lcssa
  %240 = load i32* %237, align 4
  %241 = xor i32 %240, %xor1.0.lcssa
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
  %244 = trunc i32 %241 to i8
  store i8 %244, i8* %243, align 1
  br label %bb25

bb25:                                             ; preds = %bb24, %bb22
  %out_addr.2 = phi i8* [ %243, %bb24 ], [ %242, %bb22 ]
  %245 = getelementptr inbounds i8* %out_addr.2, i64 -1
  %int_cast_to_i6450 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6450)
  %246 = lshr i32 %241, 8
  %247 = trunc i32 %246 to i8
  store i8 %247, i8* %245, align 1
  br label %bb26

bb26:                                             ; preds = %bb25, %bb22
  %out_addr.3 = phi i8* [ %245, %bb25 ], [ %242, %bb22 ]
  %248 = getelementptr inbounds i8* %out_addr.3, i64 -1
  %int_cast_to_i6451 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6451)
  %249 = lshr i32 %241, 16
  %250 = trunc i32 %249 to i8
  store i8 %250, i8* %248, align 1
  br label %bb27

bb27:                                             ; preds = %bb26, %bb22
  %out_addr.4 = phi i8* [ %248, %bb26 ], [ %242, %bb22 ]
  %251 = getelementptr inbounds i8* %out_addr.4, i64 -1
  %int_cast_to_i6452 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6452)
  %252 = lshr i32 %241, 24
  %253 = trunc i32 %252 to i8
  store i8 %253, i8* %251, align 1
  br label %bb28

bb28:                                             ; preds = %bb27, %bb22
  %out_addr.5 = phi i8* [ %251, %bb27 ], [ %242, %bb22 ]
  %254 = getelementptr inbounds i8* %out_addr.5, i64 -1
  %255 = trunc i32 %239 to i8
  store i8 %255, i8* %254, align 1
  br label %bb29

bb29:                                             ; preds = %bb28, %bb22
  %out_addr.6 = phi i8* [ %254, %bb28 ], [ %242, %bb22 ]
  %256 = getelementptr inbounds i8* %out_addr.6, i64 -1
  %int_cast_to_i6453 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6453)
  %257 = lshr i32 %239, 8
  %258 = trunc i32 %257 to i8
  store i8 %258, i8* %256, align 1
  br label %bb30

bb30:                                             ; preds = %bb29, %bb22
  %out_addr.7 = phi i8* [ %256, %bb29 ], [ %242, %bb22 ]
  %259 = getelementptr inbounds i8* %out_addr.7, i64 -1
  %int_cast_to_i6454 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6454)
  %260 = lshr i32 %239, 16
  %261 = trunc i32 %260 to i8
  store i8 %261, i8* %259, align 1
  br label %bb31

bb31:                                             ; preds = %bb30, %bb22
  %out_addr.8 = phi i8* [ %259, %bb30 ], [ %242, %bb22 ]
  %262 = getelementptr inbounds i8* %out_addr.8, i64 -1
  %int_cast_to_i6455 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6455)
  %263 = lshr i32 %239, 24
  %264 = trunc i32 %263 to i8
  store i8 %264, i8* %262, align 1
  br label %bb34

bb34:                                             ; preds = %bb31, %bb22, %bb21, %bb14, %bb4
  %storemerge42.in.in = phi i32 [ %130, %bb14 ], [ %tout0.0.lcssa, %bb4 ], [ %xor0.0.lcssa, %bb21 ], [ %217, %bb31 ], [ %217, %bb22 ]
  %storemerge38.in.in = phi i32 [ %131, %bb14 ], [ %tout1.0.lcssa, %bb4 ], [ %xor1.0.lcssa, %bb21 ], [ %235, %bb31 ], [ %235, %bb22 ]
  %int_cast_to_i6456 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6456)
  %storemerge42.in = lshr i32 %storemerge42.in.in, 24
  %storemerge42 = trunc i32 %storemerge42.in to i8
  store i8 %storemerge42, i8* %ivec, align 1
  %int_cast_to_i6457 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6457)
  %storemerge41.in = lshr i32 %storemerge42.in.in, 16
  %storemerge41 = trunc i32 %storemerge41.in to i8
  store i8 %storemerge41, i8* %4, align 1
  %int_cast_to_i6458 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6458)
  %storemerge40.in = lshr i32 %storemerge42.in.in, 8
  %storemerge40 = trunc i32 %storemerge40.in to i8
  store i8 %storemerge40, i8* %8, align 1
  %storemerge39 = trunc i32 %storemerge42.in.in to i8
  store i8 %storemerge39, i8* %12, align 1
  %int_cast_to_i6459 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6459)
  %storemerge38.in = lshr i32 %storemerge38.in.in, 24
  %storemerge38 = trunc i32 %storemerge38.in to i8
  store i8 %storemerge38, i8* %18, align 1
  %int_cast_to_i6460 = zext i32 16 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6460)
  %storemerge37.in = lshr i32 %storemerge38.in.in, 16
  %storemerge37 = trunc i32 %storemerge37.in to i8
  store i8 %storemerge37, i8* %22, align 1
  %int_cast_to_i6461 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6461)
  %storemerge36.in = lshr i32 %storemerge38.in.in, 8
  %storemerge36 = trunc i32 %storemerge36.in to i8
  store i8 %storemerge36, i8* %26, align 1
  %storemerge = trunc i32 %storemerge38.in.in to i8
  store i8 %storemerge, i8* %30, align 1
  ret void
}

define i32 @main() nounwind {
entry:
  %in.i = alloca [2 x i32], align 4
  %bf_key = alloca [8 x i8], align 1
  %bf_key1 = getelementptr inbounds [8 x i8]* %bf_key, i64 0, i64 0
  %0 = call i32 (...)* @klee_make_symbolic(i8* %bf_key1, i64 8, i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0)) nounwind
  %1 = getelementptr inbounds [8 x i8]* %bf_key, i64 0, i64 8
  br label %bb2.i

bb2.i:                                            ; preds = %bb2.i, %entry
  %indvar.i = phi i64 [ 0, %entry ], [ %indvar.next.i, %bb2.i ]
  %d.415.i = phi i8* [ %bf_key1, %entry ], [ %d.3.i, %bb2.i ]
  %scevgep.i = getelementptr %struct.BF_KEY* @key, i64 0, i32 0, i64 %indvar.i
  %2 = load i8* %d.415.i, align 1
  %3 = zext i8 %2 to i32
  %4 = getelementptr inbounds i8* %d.415.i, i64 1
  %5 = icmp ult i8* %4, %1
  %d.0.i = select i1 %5, i8* %4, i8* %bf_key1
  %int_cast_to_i64 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64)
  %6 = shl nuw nsw i32 %3, 8
  %7 = load i8* %d.0.i, align 1
  %8 = zext i8 %7 to i32
  %9 = or i32 %8, %6
  %10 = getelementptr inbounds i8* %d.0.i, i64 1
  %11 = icmp ult i8* %10, %1
  %d.1.i = select i1 %11, i8* %10, i8* %bf_key1
  %int_cast_to_i641 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641)
  %12 = shl nuw nsw i32 %9, 8
  %13 = load i8* %d.1.i, align 1
  %14 = zext i8 %13 to i32
  %15 = or i32 %12, %14
  %16 = getelementptr inbounds i8* %d.1.i, i64 1
  %17 = icmp ult i8* %16, %1
  %d.2.i = select i1 %17, i8* %16, i8* %bf_key1
  %int_cast_to_i642 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642)
  %18 = shl nuw i32 %15, 8
  %19 = load i8* %d.2.i, align 1
  %20 = zext i8 %19 to i32
  %21 = or i32 %18, %20
  %22 = getelementptr inbounds i8* %d.2.i, i64 1
  %23 = icmp ult i8* %22, %1
  %d.3.i = select i1 %23, i8* %22, i8* %bf_key1
  %24 = load i32* %scevgep.i, align 4
  %25 = xor i32 %21, %24
  store i32 %25, i32* %scevgep.i, align 4
  %indvar.next.i = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %indvar.next.i, 18
  br i1 %exitcond, label %BF_set_key_mod.exit, label %bb2.i

BF_set_key_mod.exit:                              ; preds = %bb2.i
  %26 = getelementptr inbounds [2 x i32]* %in.i, i64 0, i64 0
  store i32 0, i32* %26, align 4
  %27 = getelementptr inbounds [2 x i32]* %in.i, i64 0, i64 1
  store i32 0, i32* %27, align 4
  call void @BF_encrypt(i32* %26, %struct.BF_KEY* @key) nounwind
  %28 = load i32* %26, align 4
  store i32 %28, i32* getelementptr inbounds (%struct.BF_KEY* @key, i64 0, i32 0, i64 0), align 32
  %29 = load i32* %27, align 4
  store i32 %29, i32* getelementptr inbounds (%struct.BF_KEY* @key, i64 0, i32 0, i64 1), align 4
  ret i32 undef
}

declare i32 @klee_make_symbolic(...)

define void @klee_div_zero_check(i64 %z) nounwind {
entry:
  %0 = icmp eq i64 %z, 0, !dbg !116
  br i1 %0, label %bb, label %return, !dbg !116

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0)) noreturn nounwind, !dbg 
  unreachable, !dbg !118

return:                                           ; preds = %entry
  ret void, !dbg !119
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @klee_int(i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %x1 = bitcast i32* %x to i8*, !dbg !120
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %x1, i64 4, i8* %name) nounwind, !dbg !120
  %0 = load i32* %x, align 4, !dbg !121
  ret i32 %0, !dbg !121
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @klee_overshift_check(i64 %bitWidth, i64 %shift) nounwind {
entry:
  %0 = icmp ult i64 %shift, %bitWidth, !dbg !122
  br i1 %0, label %return, label %bb, !dbg !122

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) noreturn nounwind, !dbg 
  unreachable, !dbg !124

return:                                           ; preds = %entry
  ret void, !dbg !125
}

define i32 @klee_range(i32 %start, i32 %end, i8* %name) nounwind {
entry:
  %x = alloca i32, align 4
  %0 = icmp slt i32 %start, %end, !dbg !126
  br i1 %0, label %bb1, label %bb, !dbg !126

bb:                                               ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) noreturn nounwind, !dbg !127
  unreachable, !dbg !127

bb1:                                              ; preds = %entry
  %1 = add nsw i32 %start, 1, !dbg !128
  %2 = icmp eq i32 %1, %end, !dbg !128
  br i1 %2, label %bb8, label %bb3, !dbg !128

bb3:                                              ; preds = %bb1
  %x4 = bitcast i32* %x to i8*, !dbg !129
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %x4, i64 4, i8* %name) nounwind, !dbg !129
  %3 = icmp eq i32 %start, 0, !dbg !130
  %4 = load i32* %x, align 4, !dbg !131
  br i1 %3, label %bb5, label %bb6, !dbg !130

bb5:                                              ; preds = %bb3
  %5 = icmp ult i32 %4, %end, !dbg !131
  %6 = zext i1 %5 to i64, !dbg !131
  call void @klee_assume(i64 %6) nounwind, !dbg !131
  br label %bb7, !dbg !131

bb6:                                              ; preds = %bb3
  %7 = icmp sge i32 %4, %start, !dbg !132
  %8 = zext i1 %7 to i64, !dbg !132
  call void @klee_assume(i64 %8) nounwind, !dbg !132
  %9 = load i32* %x, align 4, !dbg !133
  %10 = icmp slt i32 %9, %end, !dbg !133
  %11 = zext i1 %10 to i64, !dbg !133
  call void @klee_assume(i64 %11) nounwind, !dbg !133
  br label %bb7, !dbg !133

bb7:                                              ; preds = %bb6, %bb5
  %12 = load i32* %x, align 4, !dbg !134
  br label %bb8, !dbg !134

bb8:                                              ; preds = %bb7, %bb1
  %.0 = phi i32 [ %12, %bb7 ], [ %start, %bb1 ]
  ret i32 %.0, !dbg !135
}

declare void @klee_assume(i64)

define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) nounwind {
entry:
  %0 = icmp eq i64 %len, 0, !dbg !136
  br i1 %0, label %bb2, label %bb, !dbg !136

bb:                                               ; preds = %bb, %entry
  %indvar = phi i64 [ %indvar.next, %bb ], [ 0, %entry ]
  %dest.05 = getelementptr i8* %destaddr, i64 %indvar
  %src.06 = getelementptr i8* %srcaddr, i64 %indvar
  %1 = load i8* %src.06, align 1, !dbg !137
  store i8 %1, i8* %dest.05, align 1, !dbg !137
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %len
  br i1 %exitcond1, label %bb1.bb2_crit_edge, label %bb, !dbg !136

bb1.bb2_crit_edge:                                ; preds = %bb
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %bb2

bb2:                                              ; preds = %bb1.bb2_crit_edge, %entry
  %dest.0.lcssa = phi i8* [ %scevgep, %bb1.bb2_crit_edge ], [ %destaddr, %entry ]
  ret i8* %dest.0.lcssa, !dbg !138
}

!llvm.dbg.sp = !{!0, !6, !15, !21, !30, !39, !48, !57}
!llvm.dbg.lv.klee_div_zero_check = !{!67}
!llvm.dbg.lv.klee_int = !{!68, !69}
!llvm.dbg.lv.klee_overshift_check = !{!71, !72}
!llvm.dbg.lv.klee_range = !{!73, !74, !75, !76}
!llvm.dbg.lv.memcpy = !{!78, !79, !80, !81, !85}
!llvm.dbg.lv.memmove = !{!88, !89, !90, !91, !95}
!llvm.dbg.lv.mempcpy = !{!98, !99, !100, !101, !105}
!llvm.dbg.lv.memset = !{!108, !109, !110, !111}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !1, i32 12, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @kle
!1 = metadata !{i32 589865, metadata !"klee_div_zero_check.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_div_zero_check.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metada
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{null, metadata !5}
!5 = metadata !{i32 589860, metadata !1, metadata !"long long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"klee_int", metadata !"klee_int", metadata !"klee_int", metadata !7, i32 13, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589865, metadata !"klee_int.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !8} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_int.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32
!9 = metadata !{i32 589845, metadata !7, metadata !"", metadata !7, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{metadata !11, metadata !12}
!11 = metadata !{i32 589860, metadata !7, metadata !"int", metadata !7, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 589839, metadata !7, metadata !"", metadata !7, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 589862, metadata !7, metadata !"", metadata !7, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ]
!14 = metadata !{i32 589860, metadata !7, metadata !"char", metadata !7, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 589870, i32 0, metadata !16, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !16, i32 20, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64
!16 = metadata !{i32 589865, metadata !"klee_overshift_check.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !17} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_overshift_check.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, meta
!18 = metadata !{i32 589845, metadata !16, metadata !"", metadata !16, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{null, metadata !20, metadata !20}
!20 = metadata !{i32 589860, metadata !16, metadata !"long long unsigned int", metadata !16, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 589870, i32 0, metadata !22, metadata !"klee_range", metadata !"klee_range", metadata !"klee_range", metadata !22, i32 13, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range} ; [ D
!22 = metadata !{i32 589865, metadata !"klee_range.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !23} ; [ DW_TAG_file_type ]
!23 = metadata !{i32 589841, i32 0, i32 1, metadata !"klee_range.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", 
!24 = metadata !{i32 589845, metadata !22, metadata !"", metadata !22, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null} ; [ DW_TAG_subroutine_type ]
!25 = metadata !{metadata !26, metadata !26, metadata !26, metadata !27}
!26 = metadata !{i32 589860, metadata !22, metadata !"int", metadata !22, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!27 = metadata !{i32 589839, metadata !22, metadata !"", metadata !22, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ]
!28 = metadata !{i32 589862, metadata !22, metadata !"", metadata !22, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !29} ; [ DW_TAG_const_type ]
!29 = metadata !{i32 589860, metadata !22, metadata !"char", metadata !22, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!30 = metadata !{i32 589870, i32 0, metadata !31, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !31, i32 12, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!31 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !32} ; [ DW_TAG_file_type ]
!32 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 
!33 = metadata !{i32 589845, metadata !31, metadata !"", metadata !31, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null} ; [ DW_TAG_subroutine_type ]
!34 = metadata !{metadata !35, metadata !35, metadata !35, metadata !36}
!35 = metadata !{i32 589839, metadata !31, metadata !"", metadata !31, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!36 = metadata !{i32 589846, metadata !37, metadata !"size_t", metadata !37, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_typedef ]
!37 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/home/sudipta/work/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !32} ; [ DW_TAG_file_type ]
!38 = metadata !{i32 589860, metadata !31, metadata !"long unsigned int", metadata !31, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!39 = metadata !{i32 589870, i32 0, metadata !40, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !40, i32 12, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!40 = metadata !{i32 589865, metadata !"memmove.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !41} ; [ DW_TAG_file_type ]
!41 = metadata !{i32 589841, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32
!42 = metadata !{i32 589845, metadata !40, metadata !"", metadata !40, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null} ; [ DW_TAG_subroutine_type ]
!43 = metadata !{metadata !44, metadata !44, metadata !44, metadata !45}
!44 = metadata !{i32 589839, metadata !40, metadata !"", metadata !40, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!45 = metadata !{i32 589846, metadata !46, metadata !"size_t", metadata !46, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !47} ; [ DW_TAG_typedef ]
!46 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/home/sudipta/work/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !41} ; [ DW_TAG_file_type ]
!47 = metadata !{i32 589860, metadata !40, metadata !"long unsigned int", metadata !40, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!48 = metadata !{i32 589870, i32 0, metadata !49, metadata !"mempcpy", metadata !"mempcpy", metadata !"mempcpy", metadata !49, i32 11, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy} ; [ DW_TAG_subpro
!49 = metadata !{i32 589865, metadata !"mempcpy.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !50} ; [ DW_TAG_file_type ]
!50 = metadata !{i32 589841, i32 0, i32 1, metadata !"mempcpy.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32
!51 = metadata !{i32 589845, metadata !49, metadata !"", metadata !49, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null} ; [ DW_TAG_subroutine_type ]
!52 = metadata !{metadata !53, metadata !53, metadata !53, metadata !54}
!53 = metadata !{i32 589839, metadata !49, metadata !"", metadata !49, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!54 = metadata !{i32 589846, metadata !55, metadata !"size_t", metadata !55, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !56} ; [ DW_TAG_typedef ]
!55 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/home/sudipta/work/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !50} ; [ DW_TAG_file_type ]
!56 = metadata !{i32 589860, metadata !49, metadata !"long unsigned int", metadata !49, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!57 = metadata !{i32 589870, i32 0, metadata !58, metadata !"memset", metadata !"memset", metadata !"memset", metadata !58, i32 11, metadata !60, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!58 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !59} ; [ DW_TAG_file_type ]
!59 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/sudipta/work/cache-side-channel/klee-aes/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 
!60 = metadata !{i32 589845, metadata !58, metadata !"", metadata !58, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null} ; [ DW_TAG_subroutine_type ]
!61 = metadata !{metadata !62, metadata !62, metadata !63, metadata !64}
!62 = metadata !{i32 589839, metadata !58, metadata !"", metadata !58, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!63 = metadata !{i32 589860, metadata !58, metadata !"int", metadata !58, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!64 = metadata !{i32 589846, metadata !65, metadata !"size_t", metadata !65, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ]
!65 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/home/sudipta/work/llvm-gcc4.2-2.9-x86_64-linux/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !59} ; [ DW_TAG_file_type ]
!66 = metadata !{i32 589860, metadata !58, metadata !"long unsigned int", metadata !58, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!67 = metadata !{i32 590081, metadata !0, metadata !"z", metadata !1, i32 12, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!68 = metadata !{i32 590081, metadata !6, metadata !"name", metadata !7, i32 13, metadata !12, i32 0} ; [ DW_TAG_arg_variable ]
!69 = metadata !{i32 590080, metadata !70, metadata !"x", metadata !7, i32 14, metadata !11, i32 0} ; [ DW_TAG_auto_variable ]
!70 = metadata !{i32 589835, metadata !6, i32 13, i32 0, metadata !7, i32 0} ; [ DW_TAG_lexical_block ]
!71 = metadata !{i32 590081, metadata !15, metadata !"bitWidth", metadata !16, i32 20, metadata !20, i32 0} ; [ DW_TAG_arg_variable ]
!72 = metadata !{i32 590081, metadata !15, metadata !"shift", metadata !16, i32 20, metadata !20, i32 0} ; [ DW_TAG_arg_variable ]
!73 = metadata !{i32 590081, metadata !21, metadata !"start", metadata !22, i32 13, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!74 = metadata !{i32 590081, metadata !21, metadata !"end", metadata !22, i32 13, metadata !26, i32 0} ; [ DW_TAG_arg_variable ]
!75 = metadata !{i32 590081, metadata !21, metadata !"name", metadata !22, i32 13, metadata !27, i32 0} ; [ DW_TAG_arg_variable ]
!76 = metadata !{i32 590080, metadata !77, metadata !"x", metadata !22, i32 14, metadata !26, i32 0} ; [ DW_TAG_auto_variable ]
!77 = metadata !{i32 589835, metadata !21, i32 13, i32 0, metadata !22, i32 0} ; [ DW_TAG_lexical_block ]
!78 = metadata !{i32 590081, metadata !30, metadata !"destaddr", metadata !31, i32 12, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!79 = metadata !{i32 590081, metadata !30, metadata !"srcaddr", metadata !31, i32 12, metadata !35, i32 0} ; [ DW_TAG_arg_variable ]
!80 = metadata !{i32 590081, metadata !30, metadata !"len", metadata !31, i32 12, metadata !36, i32 0} ; [ DW_TAG_arg_variable ]
!81 = metadata !{i32 590080, metadata !82, metadata !"dest", metadata !31, i32 13, metadata !83, i32 0} ; [ DW_TAG_auto_variable ]
!82 = metadata !{i32 589835, metadata !30, i32 12, i32 0, metadata !31, i32 0} ; [ DW_TAG_lexical_block ]
!83 = metadata !{i32 589839, metadata !31, metadata !"", metadata !31, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !84} ; [ DW_TAG_pointer_type ]
!84 = metadata !{i32 589860, metadata !31, metadata !"char", metadata !31, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!85 = metadata !{i32 590080, metadata !82, metadata !"src", metadata !31, i32 14, metadata !86, i32 0} ; [ DW_TAG_auto_variable ]
!86 = metadata !{i32 589839, metadata !31, metadata !"", metadata !31, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !87} ; [ DW_TAG_pointer_type ]
!87 = metadata !{i32 589862, metadata !31, metadata !"", metadata !31, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !84} ; [ DW_TAG_const_type ]
!88 = metadata !{i32 590081, metadata !39, metadata !"dst", metadata !40, i32 12, metadata !44, i32 0} ; [ DW_TAG_arg_variable ]
!89 = metadata !{i32 590081, metadata !39, metadata !"src", metadata !40, i32 12, metadata !44, i32 0} ; [ DW_TAG_arg_variable ]
!90 = metadata !{i32 590081, metadata !39, metadata !"count", metadata !40, i32 12, metadata !45, i32 0} ; [ DW_TAG_arg_variable ]
!91 = metadata !{i32 590080, metadata !92, metadata !"a", metadata !40, i32 13, metadata !93, i32 0} ; [ DW_TAG_auto_variable ]
!92 = metadata !{i32 589835, metadata !39, i32 12, i32 0, metadata !40, i32 0} ; [ DW_TAG_lexical_block ]
!93 = metadata !{i32 589839, metadata !40, metadata !"", metadata !40, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !94} ; [ DW_TAG_pointer_type ]
!94 = metadata !{i32 589860, metadata !40, metadata !"char", metadata !40, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!95 = metadata !{i32 590080, metadata !92, metadata !"b", metadata !40, i32 14, metadata !96, i32 0} ; [ DW_TAG_auto_variable ]
!96 = metadata !{i32 589839, metadata !40, metadata !"", metadata !40, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !97} ; [ DW_TAG_pointer_type ]
!97 = metadata !{i32 589862, metadata !40, metadata !"", metadata !40, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !94} ; [ DW_TAG_const_type ]
!98 = metadata !{i32 590081, metadata !48, metadata !"destaddr", metadata !49, i32 11, metadata !53, i32 0} ; [ DW_TAG_arg_variable ]
!99 = metadata !{i32 590081, metadata !48, metadata !"srcaddr", metadata !49, i32 11, metadata !53, i32 0} ; [ DW_TAG_arg_variable ]
!100 = metadata !{i32 590081, metadata !48, metadata !"len", metadata !49, i32 11, metadata !54, i32 0} ; [ DW_TAG_arg_variable ]
!101 = metadata !{i32 590080, metadata !102, metadata !"dest", metadata !49, i32 12, metadata !103, i32 0} ; [ DW_TAG_auto_variable ]
!102 = metadata !{i32 589835, metadata !48, i32 11, i32 0, metadata !49, i32 0} ; [ DW_TAG_lexical_block ]
!103 = metadata !{i32 589839, metadata !49, metadata !"", metadata !49, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !104} ; [ DW_TAG_pointer_type ]
!104 = metadata !{i32 589860, metadata !49, metadata !"char", metadata !49, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!105 = metadata !{i32 590080, metadata !102, metadata !"src", metadata !49, i32 13, metadata !106, i32 0} ; [ DW_TAG_auto_variable ]
!106 = metadata !{i32 589839, metadata !49, metadata !"", metadata !49, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !107} ; [ DW_TAG_pointer_type ]
!107 = metadata !{i32 589862, metadata !49, metadata !"", metadata !49, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !104} ; [ DW_TAG_const_type ]
!108 = metadata !{i32 590081, metadata !57, metadata !"dst", metadata !58, i32 11, metadata !62, i32 0} ; [ DW_TAG_arg_variable ]
!109 = metadata !{i32 590081, metadata !57, metadata !"s", metadata !58, i32 11, metadata !63, i32 0} ; [ DW_TAG_arg_variable ]
!110 = metadata !{i32 590081, metadata !57, metadata !"count", metadata !58, i32 11, metadata !64, i32 0} ; [ DW_TAG_arg_variable ]
!111 = metadata !{i32 590080, metadata !112, metadata !"a", metadata !58, i32 12, metadata !113, i32 0} ; [ DW_TAG_auto_variable ]
!112 = metadata !{i32 589835, metadata !57, i32 11, i32 0, metadata !58, i32 0} ; [ DW_TAG_lexical_block ]
!113 = metadata !{i32 589839, metadata !58, metadata !"", metadata !58, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !114} ; [ DW_TAG_pointer_type ]
!114 = metadata !{i32 589877, metadata !58, metadata !"", metadata !58, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !115} ; [ DW_TAG_volatile_type ]
!115 = metadata !{i32 589860, metadata !58, metadata !"char", metadata !58, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!116 = metadata !{i32 13, i32 0, metadata !117, null}
!117 = metadata !{i32 589835, metadata !0, i32 12, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!118 = metadata !{i32 14, i32 0, metadata !117, null}
!119 = metadata !{i32 15, i32 0, metadata !117, null}
!120 = metadata !{i32 15, i32 0, metadata !70, null}
!121 = metadata !{i32 16, i32 0, metadata !70, null}
!122 = metadata !{i32 21, i32 0, metadata !123, null}
!123 = metadata !{i32 589835, metadata !15, i32 20, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ]
!124 = metadata !{i32 27, i32 0, metadata !123, null}
!125 = metadata !{i32 29, i32 0, metadata !123, null}
!126 = metadata !{i32 16, i32 0, metadata !77, null}
!127 = metadata !{i32 17, i32 0, metadata !77, null}
!128 = metadata !{i32 19, i32 0, metadata !77, null}
!129 = metadata !{i32 22, i32 0, metadata !77, null}
!130 = metadata !{i32 25, i32 0, metadata !77, null}
!131 = metadata !{i32 26, i32 0, metadata !77, null}
!132 = metadata !{i32 28, i32 0, metadata !77, null}
!133 = metadata !{i32 29, i32 0, metadata !77, null}
!134 = metadata !{i32 32, i32 0, metadata !77, null}
!135 = metadata !{i32 20, i32 0, metadata !77, null}
!136 = metadata !{i32 15, i32 0, metadata !102, null}
!137 = metadata !{i32 16, i32 0, metadata !102, null}
!138 = metadata !{i32 17, i32 0, metadata !102, null}
