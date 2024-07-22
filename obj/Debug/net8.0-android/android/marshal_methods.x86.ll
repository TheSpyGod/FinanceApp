; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [325 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [644 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 244
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 278
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 320
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 192
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 262
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 262
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 282
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 218
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 23: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 264
	i32 184328833, ; 24: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 25: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 317
	i32 199333315, ; 26: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 318
	i32 205061960, ; 27: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 28: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 216
	i32 212724149, ; 29: MongoDB.Driver.Core => 0xcade9b5 => 195
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 238
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 221
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 240
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 237
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 289
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 42: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 43: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 317
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 207
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 46: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 302
	i32 342366114, ; 47: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 239
	i32 356389973, ; 48: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 301
	i32 360082299, ; 49: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 50: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 51: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 52: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 53: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 54: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 55: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 56: _Microsoft.Android.Resource.Designer => 0x17969339 => 321
	i32 403441872, ; 57: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 58: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 313
	i32 441335492, ; 59: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 222
	i32 442565967, ; 60: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 61: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 235
	i32 451504562, ; 62: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 63: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 64: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 65: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 66: System.dll => 0x1bff388e => 164
	i32 476646585, ; 67: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 237
	i32 486930444, ; 68: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 250
	i32 498788369, ; 69: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 70: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 300
	i32 503918385, ; 71: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 294
	i32 513247710, ; 72: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 186
	i32 525008092, ; 73: SkiaSharp.dll => 0x1f4afcdc => 198
	i32 526420162, ; 74: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 75: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 282
	i32 530272170, ; 76: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 77: Microsoft.Extensions.Logging => 0x20216150 => 182
	i32 540030774, ; 78: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 79: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 80: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 81: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 82: Jsr305Binding => 0x213954e7 => 275
	i32 569601784, ; 83: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 273
	i32 577335427, ; 84: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 85: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 308
	i32 601371474, ; 86: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 87: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 88: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 89: Xamarin.AndroidX.CustomView => 0x2568904f => 227
	i32 627931235, ; 90: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 306
	i32 639843206, ; 91: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 233
	i32 643868501, ; 92: System.Net => 0x2660a755 => 81
	i32 662205335, ; 93: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 94: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 269
	i32 666292255, ; 95: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 214
	i32 672442732, ; 96: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 97: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 98: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 288
	i32 690569205, ; 99: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 100: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 284
	i32 693804605, ; 101: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 102: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 103: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 279
	i32 700358131, ; 104: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 105: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 303
	i32 709557578, ; 106: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 291
	i32 720511267, ; 107: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 283
	i32 722857257, ; 108: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 726425535, ; 109: MongoDB.Libmongocrypt.dll => 0x2b4c5fbf => 196
	i32 735137430, ; 110: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 111: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 112: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 204
	i32 759454413, ; 113: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 114: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 115: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 116: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 312
	i32 789151979, ; 117: Microsoft.Extensions.Options => 0x2f0980eb => 185
	i32 790371945, ; 118: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 228
	i32 804715423, ; 119: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 120: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 242
	i32 823281589, ; 121: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 122: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 123: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 124: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 125: Xamarin.AndroidX.Print => 0x3246f6cd => 255
	i32 873119928, ; 126: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 874601671, ; 127: FinanceApp => 0x34215cc7 => 0
	i32 877678880, ; 128: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 129: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 130: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 131: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 132: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 315
	i32 928116545, ; 133: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 278
	i32 952186615, ; 134: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 135: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 283
	i32 962901365, ; 136: MongoDB.Driver.Core.dll => 0x3964b575 => 195
	i32 966729478, ; 137: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 276
	i32 967690846, ; 138: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 239
	i32 975236339, ; 139: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 140: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 141: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 142: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 143: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 144: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 145: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 146: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 259
	i32 1019214401, ; 147: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 148: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 181
	i32 1029334545, ; 149: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 290
	i32 1031528504, ; 150: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 277
	i32 1035644815, ; 151: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 212
	i32 1036536393, ; 152: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 153: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 154: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 246
	i32 1067306892, ; 155: GoogleGson => 0x3f9dcf8c => 176
	i32 1082857460, ; 156: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 157: Xamarin.Kotlin.StdLib => 0x409e66d8 => 280
	i32 1098259244, ; 158: System => 0x41761b2c => 164
	i32 1111289522, ; 159: DnsClient.dll => 0x423ceeb2 => 175
	i32 1118262833, ; 160: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 303
	i32 1121599056, ; 161: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 245
	i32 1127624469, ; 162: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 184
	i32 1149092582, ; 163: Xamarin.AndroidX.Window => 0x447dc2e6 => 272
	i32 1168523401, ; 164: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 309
	i32 1170634674, ; 165: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 166: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 268
	i32 1178241025, ; 167: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 253
	i32 1203215381, ; 168: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 307
	i32 1204270330, ; 169: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 214
	i32 1208641965, ; 170: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 171: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 172: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 305
	i32 1243150071, ; 173: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 273
	i32 1253011324, ; 174: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 175: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 289
	i32 1264511973, ; 176: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 263
	i32 1267360935, ; 177: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 267
	i32 1273260888, ; 178: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 219
	i32 1275534314, ; 179: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 284
	i32 1278448581, ; 180: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 211
	i32 1293217323, ; 181: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 230
	i32 1309188875, ; 182: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 183: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 272
	i32 1324164729, ; 184: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 185: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 186: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 187: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 319
	i32 1376866003, ; 188: Xamarin.AndroidX.SavedState => 0x52114ed3 => 259
	i32 1379779777, ; 189: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1391893274, ; 190: MongoDB.Bson.dll => 0x52f69b1a => 193
	i32 1402170036, ; 191: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 192: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 223
	i32 1408764838, ; 193: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 194: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 195: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 196: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 287
	i32 1434145427, ; 197: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 198: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 276
	i32 1439761251, ; 199: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 200: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 201: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 202: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 203: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 204: es\Microsoft.Maui.Controls.resources => 0x57152abe => 293
	i32 1461234159, ; 205: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 206: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 207: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 208: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 213
	i32 1470490898, ; 209: Microsoft.Extensions.Primitives => 0x57a5e912 => 186
	i32 1479771757, ; 210: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 211: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 212: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 213: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 260
	i32 1493001747, ; 214: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 297
	i32 1514721132, ; 215: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 292
	i32 1536373174, ; 216: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 217: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 218: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 219: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 220: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 312
	i32 1565862583, ; 221: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 222: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 223: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 224: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 225: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 229
	i32 1592978981, ; 226: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 227: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 277
	i32 1601112923, ; 228: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 229: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 230: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 231: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 249
	i32 1622358360, ; 232: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1623212457, ; 233: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 200
	i32 1624863272, ; 234: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 271
	i32 1635184631, ; 235: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 233
	i32 1636350590, ; 236: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 226
	i32 1639515021, ; 237: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 238: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 239: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 240: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 241: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 265
	i32 1658251792, ; 242: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 274
	i32 1670060433, ; 243: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 221
	i32 1670326403, ; 244: AWSSDK.Core.dll => 0x638f2883 => 173
	i32 1675553242, ; 245: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 246: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 247: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 248: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 249: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 250: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 251: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 281
	i32 1701541528, ; 252: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 253: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 242
	i32 1726116996, ; 254: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 255: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 256: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 217
	i32 1736233607, ; 257: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 310
	i32 1743415430, ; 258: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 288
	i32 1744735666, ; 259: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 260: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 261: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 262: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 263: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 264: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 265: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 264
	i32 1770582343, ; 266: Microsoft.Extensions.Logging.dll => 0x6988f147 => 182
	i32 1776026572, ; 267: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 268: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 269: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 270: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 304
	i32 1788241197, ; 271: Xamarin.AndroidX.Fragment => 0x6a96652d => 235
	i32 1793755602, ; 272: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 296
	i32 1807397336, ; 273: MongoDB.Driver => 0x6bbab1d8 => 194
	i32 1808609942, ; 274: Xamarin.AndroidX.Loader => 0x6bcd3296 => 249
	i32 1813058853, ; 275: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 280
	i32 1813201214, ; 276: Xamarin.Google.Android.Material => 0x6c13413e => 274
	i32 1818569960, ; 277: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 254
	i32 1818787751, ; 278: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 279: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 280: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 281: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 183
	i32 1835989518, ; 282: Snappier => 0x6d6efa0e => 202
	i32 1842015223, ; 283: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 316
	i32 1847515442, ; 284: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 204
	i32 1853025655, ; 285: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 313
	i32 1858542181, ; 286: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 287: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 288: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 295
	i32 1879696579, ; 289: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 290: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 215
	i32 1888955245, ; 291: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 292: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 293: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 294: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 295: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 296: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 297: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 298: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 261
	i32 1968388702, ; 299: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 178
	i32 1983156543, ; 300: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 281
	i32 1985761444, ; 301: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 206
	i32 1988094259, ; 302: AWSSDK.SecurityToken.dll => 0x767fe933 => 174
	i32 2003115576, ; 303: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 292
	i32 2011961780, ; 304: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 305: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 246
	i32 2025202353, ; 306: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 287
	i32 2031763787, ; 307: Xamarin.Android.Glide => 0x791a414b => 203
	i32 2045470958, ; 308: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 309: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 241
	i32 2060060697, ; 310: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 311: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 291
	i32 2070888862, ; 312: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 313: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 314: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 315: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 316: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 317: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 318: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 319: Microsoft.Maui => 0x80bd55ad => 190
	i32 2169148018, ; 320: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 299
	i32 2181898931, ; 321: Microsoft.Extensions.Options.dll => 0x820d22b3 => 185
	i32 2188602587, ; 322: Microcharts.Maui => 0x82736cdb => 177
	i32 2192057212, ; 323: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 183
	i32 2193016926, ; 324: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 325: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 285
	i32 2201231467, ; 326: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 327: it\Microsoft.Maui.Controls.resources => 0x839595db => 301
	i32 2217644978, ; 328: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 268
	i32 2222056684, ; 329: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 330: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 250
	i32 2252106437, ; 331: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 332: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 333: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 334: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 179
	i32 2267999099, ; 335: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 205
	i32 2270573516, ; 336: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 295
	i32 2279755925, ; 337: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 257
	i32 2290594010, ; 338: SharpCompress.dll => 0x8887b0da => 197
	i32 2293034957, ; 339: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 340: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 341: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 342: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 305
	i32 2305521784, ; 343: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 344: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 209
	i32 2320631194, ; 345: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 346: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 347: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 348: System.Net.Primitives => 0x8c40e0db => 70
	i32 2364201794, ; 349: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 201
	i32 2368005991, ; 350: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 351: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 178
	i32 2378619854, ; 352: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 353: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 354: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 300
	i32 2401565422, ; 355: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 356: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 232
	i32 2421380589, ; 357: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 358: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 219
	i32 2427813419, ; 359: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 297
	i32 2435356389, ; 360: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 361: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 362: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 363: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 364: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 365: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 222
	i32 2471841756, ; 366: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 367: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 368: Microsoft.Maui.Controls => 0x93dba8a1 => 188
	i32 2483903535, ; 369: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 370: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 371: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 372: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 373: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 244
	i32 2522472828, ; 374: Xamarin.Android.Glide.dll => 0x9659e17c => 203
	i32 2538310050, ; 375: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 376: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 298
	i32 2562349572, ; 377: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 378: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 379: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 245
	i32 2581819634, ; 380: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 267
	i32 2585220780, ; 381: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 382: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 383: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 384: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 307
	i32 2605712449, ; 385: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 285
	i32 2611359322, ; 386: ZstdSharp.dll => 0x9ba62e5a => 286
	i32 2615233544, ; 387: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 236
	i32 2616218305, ; 388: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 184
	i32 2617129537, ; 389: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 390: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 391: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 226
	i32 2624644809, ; 392: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 231
	i32 2625339995, ; 393: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 201
	i32 2626831493, ; 394: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 302
	i32 2627185994, ; 395: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 396: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 397: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 240
	i32 2663391936, ; 398: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 205
	i32 2663698177, ; 399: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 400: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 401: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 402: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 403: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 404: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 405: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 265
	i32 2715334215, ; 406: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 407: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 408: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 409: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2725980451, ; 410: SharpCompress => 0xa27b2923 => 197
	i32 2728513968, ; 411: MongoDB.Libmongocrypt => 0xa2a1d1b0 => 196
	i32 2732626843, ; 412: Xamarin.AndroidX.Activity => 0xa2e0939b => 207
	i32 2735172069, ; 413: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 414: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 213
	i32 2740948882, ; 415: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 416: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 417: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 308
	i32 2758225723, ; 418: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 189
	i32 2764765095, ; 419: Microsoft.Maui.dll => 0xa4caf7a7 => 190
	i32 2765824710, ; 420: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 421: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 279
	i32 2778768386, ; 422: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 270
	i32 2779977773, ; 423: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 258
	i32 2785988530, ; 424: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 314
	i32 2788224221, ; 425: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 236
	i32 2795602088, ; 426: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 199
	i32 2801831435, ; 427: Microsoft.Maui.Graphics => 0xa7008e0b => 192
	i32 2803228030, ; 428: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 429: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 293
	i32 2810250172, ; 430: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 223
	i32 2819470561, ; 431: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 432: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 433: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 258
	i32 2824502124, ; 434: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 435: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 306
	i32 2838993487, ; 436: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 247
	i32 2849599387, ; 437: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 438: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 270
	i32 2855708567, ; 439: Xamarin.AndroidX.Transition => 0xaa36a797 => 266
	i32 2861098320, ; 440: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 441: Microsoft.Maui.Essentials => 0xaa8a4878 => 191
	i32 2870099610, ; 442: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 208
	i32 2875164099, ; 443: Jsr305Binding.dll => 0xab5f85c3 => 275
	i32 2875220617, ; 444: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 445: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 234
	i32 2887636118, ; 446: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 447: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 448: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 449: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 450: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 451: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2912489636, ; 452: SkiaSharp.Views.Android => 0xad9910a4 => 199
	i32 2916838712, ; 453: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 271
	i32 2919462931, ; 454: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 455: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 210
	i32 2936416060, ; 456: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 457: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 458: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 459: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 460: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 461: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 462: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 230
	i32 2987532451, ; 463: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 261
	i32 2996846495, ; 464: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 243
	i32 3016983068, ; 465: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 263
	i32 3023353419, ; 466: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 467: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 238
	i32 3038032645, ; 468: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 321
	i32 3056245963, ; 469: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 260
	i32 3057625584, ; 470: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 251
	i32 3059408633, ; 471: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 472: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 473: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 474: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 299
	i32 3089219899, ; 475: ZstdSharp => 0xb821c13b => 286
	i32 3090735792, ; 476: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 477: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 478: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 479: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 480: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 481: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 482: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3143283668, ; 483: AWSSDK.SecurityToken => 0xbb5ab3d4 => 174
	i32 3147165239, ; 484: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 485: GoogleGson.dll => 0xbba64c02 => 176
	i32 3159123045, ; 486: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 487: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3173064269, ; 488: DnsClient => 0xbd211e4d => 175
	i32 3178803400, ; 489: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 252
	i32 3192346100, ; 490: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 491: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 492: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 493: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 494: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 229
	i32 3220365878, ; 495: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 496: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 497: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3252856589, ; 498: MongoDB.Driver.dll => 0xc1e2a70d => 194
	i32 3258312781, ; 499: Xamarin.AndroidX.CardView => 0xc235e84d => 217
	i32 3258876633, ; 500: MongoDB.Bson => 0xc23e82d9 => 193
	i32 3265493905, ; 501: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 502: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 503: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 504: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 505: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 506: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 507: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 508: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 509: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 294
	i32 3316684772, ; 510: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 511: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 227
	i32 3317144872, ; 512: System.Data => 0xc5b79d28 => 24
	i32 3340387945, ; 513: SkiaSharp => 0xc71a4669 => 198
	i32 3340431453, ; 514: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 215
	i32 3345895724, ; 515: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 256
	i32 3346324047, ; 516: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 253
	i32 3357674450, ; 517: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 311
	i32 3358260929, ; 518: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 519: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 208
	i32 3362522851, ; 520: Xamarin.AndroidX.Core => 0xc86c06e3 => 224
	i32 3366347497, ; 521: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 522: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 257
	i32 3381016424, ; 523: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 290
	i32 3395150330, ; 524: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 525: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 526: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 228
	i32 3428513518, ; 527: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 180
	i32 3429136800, ; 528: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 529: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 530: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 231
	i32 3445260447, ; 531: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 532: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 187
	i32 3457240403, ; 533: AWSSDK.Core => 0xce114d53 => 173
	i32 3463511458, ; 534: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 298
	i32 3471940407, ; 535: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3473156932, ; 536: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 200
	i32 3476120550, ; 537: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 538: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 311
	i32 3484440000, ; 539: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 310
	i32 3485117614, ; 540: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 541: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 542: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 220
	i32 3509114376, ; 543: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 544: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 545: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 546: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 547: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 548: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 549: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 318
	i32 3597029428, ; 550: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 206
	i32 3598340787, ; 551: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 552: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 553: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 554: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 255
	i32 3633644679, ; 555: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 210
	i32 3638274909, ; 556: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 557: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 241
	i32 3643446276, ; 558: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 315
	i32 3643854240, ; 559: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 252
	i32 3645089577, ; 560: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 561: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 179
	i32 3660523487, ; 562: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 563: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 564: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 216
	i32 3684561358, ; 565: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 220
	i32 3697841164, ; 566: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 320
	i32 3700866549, ; 567: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 568: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 225
	i32 3716563718, ; 569: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 570: Xamarin.AndroidX.Annotation => 0xdda814c6 => 209
	i32 3724971120, ; 571: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 251
	i32 3732100267, ; 572: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 573: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 574: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 575: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 576: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 218
	i32 3791210109, ; 577: Snappier.dll => 0xe1f9467d => 202
	i32 3792276235, ; 578: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800301175, ; 579: FinanceApp.dll => 0xe283fe77 => 0
	i32 3800979733, ; 580: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 187
	i32 3802395368, ; 581: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 582: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 583: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 584: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 585: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 181
	i32 3844307129, ; 586: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 587: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 588: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 589: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 590: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 591: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 592: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 266
	i32 3888767677, ; 593: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 256
	i32 3889960447, ; 594: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 319
	i32 3896106733, ; 595: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 596: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 224
	i32 3901907137, ; 597: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 598: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 599: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 269
	i32 3928044579, ; 600: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 601: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 602: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 254
	i32 3945713374, ; 603: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 604: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 605: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 212
	i32 3959773229, ; 606: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 243
	i32 3980434154, ; 607: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 314
	i32 3987592930, ; 608: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 296
	i32 4003436829, ; 609: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 610: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 211
	i32 4025784931, ; 611: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 612: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 189
	i32 4054681211, ; 613: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 614: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 615: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 616: Microsoft.Maui.Essentials.dll => 0xf40add04 => 191
	i32 4099507663, ; 617: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 618: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 619: Xamarin.AndroidX.Emoji2 => 0xf479582c => 232
	i32 4102112229, ; 620: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 309
	i32 4125707920, ; 621: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 304
	i32 4126470640, ; 622: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 180
	i32 4127667938, ; 623: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 624: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 625: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 626: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 316
	i32 4151237749, ; 627: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 628: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 629: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 630: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 631: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 632: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 248
	i32 4185676441, ; 633: System.Security => 0xf97c5a99 => 130
	i32 4189085287, ; 634: Microcharts.Maui.dll => 0xf9b05e67 => 177
	i32 4196529839, ; 635: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 636: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 637: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 225
	i32 4258378803, ; 638: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 247
	i32 4260525087, ; 639: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 640: Microsoft.Maui.Controls.dll => 0xfea12dee => 188
	i32 4274976490, ; 641: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 642: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 248
	i32 4294763496 ; 643: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 234
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [644 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 244, ; 3
	i32 278, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 320, ; 9
	i32 124, ; 10
	i32 192, ; 11
	i32 102, ; 12
	i32 262, ; 13
	i32 107, ; 14
	i32 262, ; 15
	i32 139, ; 16
	i32 282, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 13, ; 20
	i32 218, ; 21
	i32 132, ; 22
	i32 264, ; 23
	i32 151, ; 24
	i32 317, ; 25
	i32 318, ; 26
	i32 18, ; 27
	i32 216, ; 28
	i32 195, ; 29
	i32 26, ; 30
	i32 238, ; 31
	i32 1, ; 32
	i32 59, ; 33
	i32 42, ; 34
	i32 91, ; 35
	i32 221, ; 36
	i32 147, ; 37
	i32 240, ; 38
	i32 237, ; 39
	i32 289, ; 40
	i32 54, ; 41
	i32 69, ; 42
	i32 317, ; 43
	i32 207, ; 44
	i32 83, ; 45
	i32 302, ; 46
	i32 239, ; 47
	i32 301, ; 48
	i32 131, ; 49
	i32 55, ; 50
	i32 149, ; 51
	i32 74, ; 52
	i32 145, ; 53
	i32 62, ; 54
	i32 146, ; 55
	i32 321, ; 56
	i32 165, ; 57
	i32 313, ; 58
	i32 222, ; 59
	i32 12, ; 60
	i32 235, ; 61
	i32 125, ; 62
	i32 152, ; 63
	i32 113, ; 64
	i32 166, ; 65
	i32 164, ; 66
	i32 237, ; 67
	i32 250, ; 68
	i32 84, ; 69
	i32 300, ; 70
	i32 294, ; 71
	i32 186, ; 72
	i32 198, ; 73
	i32 150, ; 74
	i32 282, ; 75
	i32 60, ; 76
	i32 182, ; 77
	i32 51, ; 78
	i32 103, ; 79
	i32 114, ; 80
	i32 40, ; 81
	i32 275, ; 82
	i32 273, ; 83
	i32 120, ; 84
	i32 308, ; 85
	i32 52, ; 86
	i32 44, ; 87
	i32 119, ; 88
	i32 227, ; 89
	i32 306, ; 90
	i32 233, ; 91
	i32 81, ; 92
	i32 136, ; 93
	i32 269, ; 94
	i32 214, ; 95
	i32 8, ; 96
	i32 73, ; 97
	i32 288, ; 98
	i32 155, ; 99
	i32 284, ; 100
	i32 154, ; 101
	i32 92, ; 102
	i32 279, ; 103
	i32 45, ; 104
	i32 303, ; 105
	i32 291, ; 106
	i32 283, ; 107
	i32 109, ; 108
	i32 196, ; 109
	i32 129, ; 110
	i32 25, ; 111
	i32 204, ; 112
	i32 72, ; 113
	i32 55, ; 114
	i32 46, ; 115
	i32 312, ; 116
	i32 185, ; 117
	i32 228, ; 118
	i32 22, ; 119
	i32 242, ; 120
	i32 86, ; 121
	i32 43, ; 122
	i32 160, ; 123
	i32 71, ; 124
	i32 255, ; 125
	i32 3, ; 126
	i32 0, ; 127
	i32 42, ; 128
	i32 63, ; 129
	i32 16, ; 130
	i32 53, ; 131
	i32 315, ; 132
	i32 278, ; 133
	i32 105, ; 134
	i32 283, ; 135
	i32 195, ; 136
	i32 276, ; 137
	i32 239, ; 138
	i32 34, ; 139
	i32 158, ; 140
	i32 85, ; 141
	i32 32, ; 142
	i32 12, ; 143
	i32 51, ; 144
	i32 56, ; 145
	i32 259, ; 146
	i32 36, ; 147
	i32 181, ; 148
	i32 290, ; 149
	i32 277, ; 150
	i32 212, ; 151
	i32 35, ; 152
	i32 58, ; 153
	i32 246, ; 154
	i32 176, ; 155
	i32 17, ; 156
	i32 280, ; 157
	i32 164, ; 158
	i32 175, ; 159
	i32 303, ; 160
	i32 245, ; 161
	i32 184, ; 162
	i32 272, ; 163
	i32 309, ; 164
	i32 153, ; 165
	i32 268, ; 166
	i32 253, ; 167
	i32 307, ; 168
	i32 214, ; 169
	i32 29, ; 170
	i32 52, ; 171
	i32 305, ; 172
	i32 273, ; 173
	i32 5, ; 174
	i32 289, ; 175
	i32 263, ; 176
	i32 267, ; 177
	i32 219, ; 178
	i32 284, ; 179
	i32 211, ; 180
	i32 230, ; 181
	i32 85, ; 182
	i32 272, ; 183
	i32 61, ; 184
	i32 112, ; 185
	i32 57, ; 186
	i32 319, ; 187
	i32 259, ; 188
	i32 99, ; 189
	i32 193, ; 190
	i32 19, ; 191
	i32 223, ; 192
	i32 111, ; 193
	i32 101, ; 194
	i32 102, ; 195
	i32 287, ; 196
	i32 104, ; 197
	i32 276, ; 198
	i32 71, ; 199
	i32 38, ; 200
	i32 32, ; 201
	i32 103, ; 202
	i32 73, ; 203
	i32 293, ; 204
	i32 9, ; 205
	i32 123, ; 206
	i32 46, ; 207
	i32 213, ; 208
	i32 186, ; 209
	i32 9, ; 210
	i32 43, ; 211
	i32 4, ; 212
	i32 260, ; 213
	i32 297, ; 214
	i32 292, ; 215
	i32 31, ; 216
	i32 138, ; 217
	i32 92, ; 218
	i32 93, ; 219
	i32 312, ; 220
	i32 49, ; 221
	i32 141, ; 222
	i32 112, ; 223
	i32 140, ; 224
	i32 229, ; 225
	i32 115, ; 226
	i32 277, ; 227
	i32 157, ; 228
	i32 76, ; 229
	i32 79, ; 230
	i32 249, ; 231
	i32 37, ; 232
	i32 200, ; 233
	i32 271, ; 234
	i32 233, ; 235
	i32 226, ; 236
	i32 64, ; 237
	i32 138, ; 238
	i32 15, ; 239
	i32 116, ; 240
	i32 265, ; 241
	i32 274, ; 242
	i32 221, ; 243
	i32 173, ; 244
	i32 48, ; 245
	i32 70, ; 246
	i32 80, ; 247
	i32 126, ; 248
	i32 94, ; 249
	i32 121, ; 250
	i32 281, ; 251
	i32 26, ; 252
	i32 242, ; 253
	i32 97, ; 254
	i32 28, ; 255
	i32 217, ; 256
	i32 310, ; 257
	i32 288, ; 258
	i32 149, ; 259
	i32 169, ; 260
	i32 4, ; 261
	i32 98, ; 262
	i32 33, ; 263
	i32 93, ; 264
	i32 264, ; 265
	i32 182, ; 266
	i32 21, ; 267
	i32 41, ; 268
	i32 170, ; 269
	i32 304, ; 270
	i32 235, ; 271
	i32 296, ; 272
	i32 194, ; 273
	i32 249, ; 274
	i32 280, ; 275
	i32 274, ; 276
	i32 254, ; 277
	i32 2, ; 278
	i32 134, ; 279
	i32 111, ; 280
	i32 183, ; 281
	i32 202, ; 282
	i32 316, ; 283
	i32 204, ; 284
	i32 313, ; 285
	i32 58, ; 286
	i32 95, ; 287
	i32 295, ; 288
	i32 39, ; 289
	i32 215, ; 290
	i32 25, ; 291
	i32 94, ; 292
	i32 89, ; 293
	i32 99, ; 294
	i32 10, ; 295
	i32 87, ; 296
	i32 100, ; 297
	i32 261, ; 298
	i32 178, ; 299
	i32 281, ; 300
	i32 206, ; 301
	i32 174, ; 302
	i32 292, ; 303
	i32 7, ; 304
	i32 246, ; 305
	i32 287, ; 306
	i32 203, ; 307
	i32 88, ; 308
	i32 241, ; 309
	i32 154, ; 310
	i32 291, ; 311
	i32 33, ; 312
	i32 116, ; 313
	i32 82, ; 314
	i32 20, ; 315
	i32 11, ; 316
	i32 162, ; 317
	i32 3, ; 318
	i32 190, ; 319
	i32 299, ; 320
	i32 185, ; 321
	i32 177, ; 322
	i32 183, ; 323
	i32 84, ; 324
	i32 285, ; 325
	i32 64, ; 326
	i32 301, ; 327
	i32 268, ; 328
	i32 143, ; 329
	i32 250, ; 330
	i32 157, ; 331
	i32 41, ; 332
	i32 117, ; 333
	i32 179, ; 334
	i32 205, ; 335
	i32 295, ; 336
	i32 257, ; 337
	i32 197, ; 338
	i32 131, ; 339
	i32 75, ; 340
	i32 66, ; 341
	i32 305, ; 342
	i32 172, ; 343
	i32 209, ; 344
	i32 143, ; 345
	i32 106, ; 346
	i32 151, ; 347
	i32 70, ; 348
	i32 201, ; 349
	i32 156, ; 350
	i32 178, ; 351
	i32 121, ; 352
	i32 127, ; 353
	i32 300, ; 354
	i32 152, ; 355
	i32 232, ; 356
	i32 141, ; 357
	i32 219, ; 358
	i32 297, ; 359
	i32 20, ; 360
	i32 14, ; 361
	i32 135, ; 362
	i32 75, ; 363
	i32 59, ; 364
	i32 222, ; 365
	i32 167, ; 366
	i32 168, ; 367
	i32 188, ; 368
	i32 15, ; 369
	i32 74, ; 370
	i32 6, ; 371
	i32 23, ; 372
	i32 244, ; 373
	i32 203, ; 374
	i32 91, ; 375
	i32 298, ; 376
	i32 1, ; 377
	i32 136, ; 378
	i32 245, ; 379
	i32 267, ; 380
	i32 134, ; 381
	i32 69, ; 382
	i32 146, ; 383
	i32 307, ; 384
	i32 285, ; 385
	i32 286, ; 386
	i32 236, ; 387
	i32 184, ; 388
	i32 88, ; 389
	i32 96, ; 390
	i32 226, ; 391
	i32 231, ; 392
	i32 201, ; 393
	i32 302, ; 394
	i32 31, ; 395
	i32 45, ; 396
	i32 240, ; 397
	i32 205, ; 398
	i32 109, ; 399
	i32 158, ; 400
	i32 35, ; 401
	i32 22, ; 402
	i32 114, ; 403
	i32 57, ; 404
	i32 265, ; 405
	i32 144, ; 406
	i32 118, ; 407
	i32 120, ; 408
	i32 110, ; 409
	i32 197, ; 410
	i32 196, ; 411
	i32 207, ; 412
	i32 139, ; 413
	i32 213, ; 414
	i32 54, ; 415
	i32 105, ; 416
	i32 308, ; 417
	i32 189, ; 418
	i32 190, ; 419
	i32 133, ; 420
	i32 279, ; 421
	i32 270, ; 422
	i32 258, ; 423
	i32 314, ; 424
	i32 236, ; 425
	i32 199, ; 426
	i32 192, ; 427
	i32 159, ; 428
	i32 293, ; 429
	i32 223, ; 430
	i32 163, ; 431
	i32 132, ; 432
	i32 258, ; 433
	i32 161, ; 434
	i32 306, ; 435
	i32 247, ; 436
	i32 140, ; 437
	i32 270, ; 438
	i32 266, ; 439
	i32 169, ; 440
	i32 191, ; 441
	i32 208, ; 442
	i32 275, ; 443
	i32 40, ; 444
	i32 234, ; 445
	i32 81, ; 446
	i32 56, ; 447
	i32 37, ; 448
	i32 97, ; 449
	i32 166, ; 450
	i32 172, ; 451
	i32 199, ; 452
	i32 271, ; 453
	i32 82, ; 454
	i32 210, ; 455
	i32 98, ; 456
	i32 30, ; 457
	i32 159, ; 458
	i32 18, ; 459
	i32 127, ; 460
	i32 119, ; 461
	i32 230, ; 462
	i32 261, ; 463
	i32 243, ; 464
	i32 263, ; 465
	i32 165, ; 466
	i32 238, ; 467
	i32 321, ; 468
	i32 260, ; 469
	i32 251, ; 470
	i32 170, ; 471
	i32 16, ; 472
	i32 144, ; 473
	i32 299, ; 474
	i32 286, ; 475
	i32 125, ; 476
	i32 118, ; 477
	i32 38, ; 478
	i32 115, ; 479
	i32 47, ; 480
	i32 142, ; 481
	i32 117, ; 482
	i32 174, ; 483
	i32 34, ; 484
	i32 176, ; 485
	i32 95, ; 486
	i32 53, ; 487
	i32 175, ; 488
	i32 252, ; 489
	i32 129, ; 490
	i32 153, ; 491
	i32 24, ; 492
	i32 161, ; 493
	i32 229, ; 494
	i32 148, ; 495
	i32 104, ; 496
	i32 89, ; 497
	i32 194, ; 498
	i32 217, ; 499
	i32 193, ; 500
	i32 60, ; 501
	i32 142, ; 502
	i32 100, ; 503
	i32 5, ; 504
	i32 13, ; 505
	i32 122, ; 506
	i32 135, ; 507
	i32 28, ; 508
	i32 294, ; 509
	i32 72, ; 510
	i32 227, ; 511
	i32 24, ; 512
	i32 198, ; 513
	i32 215, ; 514
	i32 256, ; 515
	i32 253, ; 516
	i32 311, ; 517
	i32 137, ; 518
	i32 208, ; 519
	i32 224, ; 520
	i32 168, ; 521
	i32 257, ; 522
	i32 290, ; 523
	i32 101, ; 524
	i32 123, ; 525
	i32 228, ; 526
	i32 180, ; 527
	i32 163, ; 528
	i32 167, ; 529
	i32 231, ; 530
	i32 39, ; 531
	i32 187, ; 532
	i32 173, ; 533
	i32 298, ; 534
	i32 17, ; 535
	i32 200, ; 536
	i32 171, ; 537
	i32 311, ; 538
	i32 310, ; 539
	i32 137, ; 540
	i32 150, ; 541
	i32 220, ; 542
	i32 155, ; 543
	i32 130, ; 544
	i32 19, ; 545
	i32 65, ; 546
	i32 147, ; 547
	i32 47, ; 548
	i32 318, ; 549
	i32 206, ; 550
	i32 79, ; 551
	i32 61, ; 552
	i32 106, ; 553
	i32 255, ; 554
	i32 210, ; 555
	i32 49, ; 556
	i32 241, ; 557
	i32 315, ; 558
	i32 252, ; 559
	i32 14, ; 560
	i32 179, ; 561
	i32 68, ; 562
	i32 171, ; 563
	i32 216, ; 564
	i32 220, ; 565
	i32 320, ; 566
	i32 78, ; 567
	i32 225, ; 568
	i32 108, ; 569
	i32 209, ; 570
	i32 251, ; 571
	i32 67, ; 572
	i32 63, ; 573
	i32 27, ; 574
	i32 160, ; 575
	i32 218, ; 576
	i32 202, ; 577
	i32 10, ; 578
	i32 0, ; 579
	i32 187, ; 580
	i32 11, ; 581
	i32 78, ; 582
	i32 126, ; 583
	i32 83, ; 584
	i32 181, ; 585
	i32 66, ; 586
	i32 107, ; 587
	i32 65, ; 588
	i32 128, ; 589
	i32 122, ; 590
	i32 77, ; 591
	i32 266, ; 592
	i32 256, ; 593
	i32 319, ; 594
	i32 8, ; 595
	i32 224, ; 596
	i32 2, ; 597
	i32 44, ; 598
	i32 269, ; 599
	i32 156, ; 600
	i32 128, ; 601
	i32 254, ; 602
	i32 23, ; 603
	i32 133, ; 604
	i32 212, ; 605
	i32 243, ; 606
	i32 314, ; 607
	i32 296, ; 608
	i32 29, ; 609
	i32 211, ; 610
	i32 62, ; 611
	i32 189, ; 612
	i32 90, ; 613
	i32 87, ; 614
	i32 148, ; 615
	i32 191, ; 616
	i32 36, ; 617
	i32 86, ; 618
	i32 232, ; 619
	i32 309, ; 620
	i32 304, ; 621
	i32 180, ; 622
	i32 50, ; 623
	i32 6, ; 624
	i32 90, ; 625
	i32 316, ; 626
	i32 21, ; 627
	i32 162, ; 628
	i32 96, ; 629
	i32 50, ; 630
	i32 113, ; 631
	i32 248, ; 632
	i32 130, ; 633
	i32 177, ; 634
	i32 76, ; 635
	i32 27, ; 636
	i32 225, ; 637
	i32 247, ; 638
	i32 7, ; 639
	i32 188, ; 640
	i32 110, ; 641
	i32 248, ; 642
	i32 234 ; 643
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
