PS C:\Users\MKT\Downloads\flutter_app> flutter run
Launching lib\main.dart on moto g 7 in debug mode...
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
warning: [options] source value 8 is obsolete and will be removed in a future release
warning: [options] target value 8 is obsolete and will be removed in a future release
warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
3 warnings
Running Gradle task 'assembleDebug'...                            436,5s
√ Built build\app\outputs\flutter-apk\app-debug.apk
Installing build\app\outputs\flutter-apk\app-debug.apk...           9,0s
E/AndroidRuntime(18655): FATAL EXCEPTION: main
E/AndroidRuntime(18655): Process: devdiego.gustavo.paliacaosegura, PID: 18655
E/AndroidRuntime(18655): java.lang.RuntimeException: Unable to instantiate activity ComponentInfo{devdiego.gustavo.paliacaosegura/devdiego.gustavo.paliacaoseg
ura.MainActivity}: java.lang.ClassNotFoundException: Didn't find class "devdiego.gustavo.paliacaosegura.MainActivity" on path: DexPathList[[zip file "/data/ap
p/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/base.apk"],nativeLibraryDirectories=[/data/app/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/lib/arm64, /data/app/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/base.apk!/lib/arm64-v8a, /system/lib64, /system/product/lib64]]
E/AndroidRuntime(18655):        at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:3401)
E/AndroidRuntime(18655):        at android.app.ActivityThread.handleLaunchActivity(ActivityThread.java:3620)
E/AndroidRuntime(18655):        at android.app.servertransaction.LaunchActivityItem.execute(LaunchActivityItem.java:83)
E/AndroidRuntime(18655):        at android.app.servertransaction.TransactionExecutor.executeCallbacks(TransactionExecutor.java:135)
E/AndroidRuntime(18655):        at android.app.servertransaction.TransactionExecutor.execute(TransactionExecutor.java:95)
E/AndroidRuntime(18655):        at android.app.ActivityThread$H.handleMessage(ActivityThread.java:2183)
E/AndroidRuntime(18655):        at android.os.Handler.dispatchMessage(Handler.java:107)
E/AndroidRuntime(18655):        at android.os.Looper.loop(Looper.java:241)
E/AndroidRuntime(18655):        at android.app.ActivityThread.main(ActivityThread.java:7604)
E/AndroidRuntime(18655):        at java.lang.reflect.Method.invoke(Native Method)
E/AndroidRuntime(18655):        at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:492)
E/AndroidRuntime(18655):        at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:941)
E/AndroidRuntime(18655): Caused by: java.lang.ClassNotFoundException: Didn't find class "devdiego.gustavo.paliacaosegura.MainActivity" on path: DexPathList[[z
ip file "/data/app/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/base.apk"],nativeLibraryDirectories=[/data/app/devdiego.gustavo.paliacaosegura-dqf
r9Q7onYkjoTK7iLc8Ew==/lib/arm64, /data/app/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/base.apk!/lib/arm64-v8a, /system/lib64, /system/product/lib64]]
E/AndroidRuntime(18655):        at dalvik.system.BaseDexClassLoader.findClass(BaseDexClassLoader.java:196)
E/AndroidRuntime(18655):        at java.lang.ClassLoader.loadClass(ClassLoader.java:379)
E/AndroidRuntime(18655):        at java.lang.ClassLoader.loadClass(ClassLoader.java:312)
E/AndroidRuntime(18655):        at android.app.AppComponentFactory.instantiateActivity(AppComponentFactory.java:95)
E/AndroidRuntime(18655):        at androidx.core.app.CoreComponentFactory.instantiateActivity(CoreComponentFactory.java:44)
E/AndroidRuntime(18655):        at android.app.Instrumentation.newActivity(Instrumentation.java:1272)
E/AndroidRuntime(18655):        at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:3389)
E/AndroidRuntime(18655):        ... 11 more
E/AndroidRuntime(18762): FATAL EXCEPTION: main
E/AndroidRuntime(18762): Process: devdiego.gustavo.paliacaosegura, PID: 18762
E/AndroidRuntime(18762): java.lang.RuntimeException: Unable to instantiate activity ComponentInfo{devdiego.gustavo.paliacaosegura/devdiego.gustavo.paliacaoseg
ura.MainActivity}: java.lang.ClassNotFoundException: Didn't find class "devdiego.gustavo.paliacaosegura.MainActivity" on path: DexPathList[[zip file "/data/ap
p/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/base.apk"],nativeLibraryDirectories=[/data/app/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/lib/arm64, /data/app/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/base.apk!/lib/arm64-v8a, /system/lib64, /system/product/lib64]]
E/AndroidRuntime(18762):        at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:3401)
E/AndroidRuntime(18762):        at android.app.ActivityThread.handleLaunchActivity(ActivityThread.java:3620)
E/AndroidRuntime(18762):        at android.app.servertransaction.LaunchActivityItem.execute(LaunchActivityItem.java:83)
E/AndroidRuntime(18762):        at android.app.servertransaction.TransactionExecutor.executeCallbacks(TransactionExecutor.java:135)
E/AndroidRuntime(18762):        at android.app.servertransaction.TransactionExecutor.execute(TransactionExecutor.java:95)
E/AndroidRuntime(18762):        at android.app.ActivityThread$H.handleMessage(ActivityThread.java:2183)
E/AndroidRuntime(18762):        at android.os.Handler.dispatchMessage(Handler.java:107)
E/AndroidRuntime(18762):        at android.os.Looper.loop(Looper.java:241)
E/AndroidRuntime(18762):        at android.app.ActivityThread.main(ActivityThread.java:7604)
E/AndroidRuntime(18762):        at java.lang.reflect.Method.invoke(Native Method)
E/AndroidRuntime(18762):        at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:492)
E/AndroidRuntime(18762):        at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:941)
E/AndroidRuntime(18762): Caused by: java.lang.ClassNotFoundException: Didn't find class "devdiego.gustavo.paliacaosegura.MainActivity" on path: DexPathList[[z
ip file "/data/app/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/base.apk"],nativeLibraryDirectories=[/data/app/devdiego.gustavo.paliacaosegura-dqf
r9Q7onYkjoTK7iLc8Ew==/lib/arm64, /data/app/devdiego.gustavo.paliacaosegura-dqfr9Q7onYkjoTK7iLc8Ew==/base.apk!/lib/arm64-v8a, /system/lib64, /system/product/lib64]]
E/AndroidRuntime(18762):        at dalvik.system.BaseDexClassLoader.findClass(BaseDexClassLoader.java:196)
E/AndroidRuntime(18762):        at java.lang.ClassLoader.loadClass(ClassLoader.java:379)
E/AndroidRuntime(18762):        at java.lang.ClassLoader.loadClass(ClassLoader.java:312)
E/AndroidRuntime(18762):        at android.app.AppComponentFactory.instantiateActivity(AppComponentFactory.java:95)
E/AndroidRuntime(18762):        at androidx.core.app.CoreComponentFactory.instantiateActivity(CoreComponentFactory.java:44)
E/AndroidRuntime(18762):        at android.app.Instrumentation.newActivity(Instrumentation.java:1272)
E/AndroidRuntime(18762):        at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:3389)
E/AndroidRuntime(18762):        ... 11 more

