plugins {
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.revive_app"
    compileSdk = 34 // ya flutter.compileSdkVersion

    defaultConfig {
        applicationId = "com.example.revive_app"
        minSdk = flutter.minSdkVersion // ya flutter.minSdkVersion
        targetSdk = 34 // ya flutter.targetSdkVersion
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
