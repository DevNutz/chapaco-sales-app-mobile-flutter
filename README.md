# Restobar "*El Chapaco*" Sales Management System

## Set up to run and develop the project

1. Install and set up flutter according to the [official documentation](https://docs.flutter.dev/get-started/install).
2. Configure a device for testing:
    - Physical: Enable Developer options and activate USB debugging.
    - Virtual: Create an android emulator according to Flutter documentation.
3. Clone the repo.
4. The main file is located at `lib/main.dart`. To run and/or debug the app, set up an IDE or editor, either **Android Studio** or **VS Code**:


## Android Studio

Summarization of the official documentation to [install the **Flutter plugin**](https://docs.flutter.dev/get-started/editor?tab=vscode) for Linux or Windows (it will also install the **Dart plugin** automatically) and [set up the IDE](https://docs.flutter.dev/tools/android-studio) for development:


### To run the project:

#### 1. Install the Flutter plugin

1. Go to `File > Settings`. You can also press <kbd>Ctrl + Alt + S</kbd>.
2. From the list at the left, select `Plugins`.
3. From the top of this panel, select `Marketplace`.
4. Type `flutter` in the plugins search field.
5. Select the **Flutter plugin**.
6. Click `Install`.
7. Click `Yes` when prompted to install the plugin.
8. Click `Restart` when prompted.

#### 2. Open the project

1. In the IDE, click `Open` from the Welcome window, or `File > Open` from the main IDE window.
2. Browse to the directory holding the project source code files.
3. Click `Open`.

#### 3. Run and debug

1. Select a target device:
    1. Locate the Flutter Target Selector drop-down button. This shows a list of available targets.
    2. Select the target you want the app to be started on. When you connect devices, or start simulators, additional entries appear.

2. Click the `Play` icon in the toolbar, or invoke `Run > Run`. The bottom Run pane shows logs output.


### Set up to start developing (*mandatory*):

#### 1. Set *line length*

1. Go to `File > Settings`. You can also press <kbd>Ctrl + Alt + S</kbd>.
2. From the list on the left, go to `Editor > Code Style > Dart`.
3. For either, Project Scheme or Default Scheme, change the `line length` value to `100`.
4. Click `OK`.

#### 2. Set *format on save*

1. Go to `File > Settings`. You can also press <kbd>Ctrl + Alt + S</kbd>.
2. From the list on the left, go to `Languages & Frameworks > Flutter`.
3. Under the `Editor` section, enable the the checkboxes of `Format code on save` and `Organize imports on save`.
4. Click `OK`.

#### 3. Disable unwanted *typo warnings*

1. Go to `File > Settings`. You can also press <kbd>Ctrl + Alt + S</kbd>.
2. From the list on the left, go to `Editor > Inspections`.
3. Go to `Proofreading > Typo`.
4. From the panel on the right. **uncheck** `Process literals` and `Process comments`. 
5. Click `OK`.

### *Optional*. Improve developer experience:

These are recommended to identify and/or solve code errors and formatting sooner as well as improve the developer experience. 

#### 1. Install *Inspection Lens* plugin

1. Go to `File > Settings`. You can also press <kbd>Ctrl + Alt + S</kbd>.
2. From the list at the left, select `Plugins`.
3. From the top of this panel, select `Marketplace`.
4. Type `Inspection Lens` in the plugins search field.
5. Select the **Inspection Lens**.
6. Click `Install`.
7. Click `Yes` when prompted to install the plugin.
8. Click `Restart` when prompted.

#### 2. Install an Android Studio theme for better *Syntax Highlighting*

Default Android Studio theme has a poor syntax Highlighting for flutter/dart, but many themes from [Jetbrains Themes Marketplace](https://plugins.jetbrains.com/search?excludeTags=internal&pricingModels=FREE&pricingModels=FREEMIUM&tags=Theme) site solve this problem.

1. Go to `File > Settings`. You can also press <kbd>Ctrl + Alt + S</kbd>.
2. From the list at the left, select `Plugins`.
3. From the top of this panel, select `Marketplace`.
4. Type your preferred theme name in the plugins search field (some recommended: *One Dark Theme*, *Material Theme UI*, *Catppuccin Theme*).
5. Select the theme.
6. Click `Install`.
7. Click `Yes` when prompted to install the plugin.
8. Click `Restart` when prompted.

You can change between the variants that some of the themes have on `Settings > Appearance & Behavior > Appearance`, under `Theme` dropdown list.

## Visual Studio Code:

To do
<!-- 1. Inside the project directory, to install the dependencies run in the console:

    ```shell
    flutter pub get
    ```
    - Or, from VS Code: open the `pubspec.yaml` and click on the `Get Packages` button that has a download icon at the top right corner. -->

