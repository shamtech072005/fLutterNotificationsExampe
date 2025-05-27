plugins {
    id("com.android.application") version "8.7.3" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Set a custom build directory for the root project
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

// Set a custom build directory for each subproject
subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(name)
    layout.buildDirectory.set(newSubprojectBuildDir)
}

// Ensure subprojects evaluate the ':app' project first
subprojects {
    evaluationDependsOn(":app")
}

// Define a clean task to delete the root build directory
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
