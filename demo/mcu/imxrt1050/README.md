# Porcupine Wake Word Engine Demo for IMXRT1050-EVKB (Multiple languages)

This package contains a demo project for the i.MX RT1050 Evaluation Kit using Porcupine wake word engine.

## Supported Languages

1. English
2. French
3. German
4. Spanish

## Installation

For this demo, you need to download and install [MCUXpresso IDE](https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuxpresso-integrated-development-environment-ide:MCUXpresso-IDE), which is an all-in-one multi-OS development tool for NXP MCUs based on Arm Cortex-M cores.

## AccessKey

Porcupine requires a valid `AccessKey` at initialization. `AccessKey`s act as your credentials when using Porcupine SDKs.
You can create your `AccessKey` for free. Make sure to keep your `AccessKey` secret.

To obtain your `AccessKey`:
1. Login or Signup for a free account on the [Picovoice Console](https://picovoice.ai/console/).
2. Once logged in, go to the [`AccessKey` tab](https://console.picovoice.ai/access_key) to create one or use an existing `AccessKey`.

## Usage

In the demo project, there is a separate build configuration for each supported languages. In order to activate a specific configuration:

1. Click `Project` > `Build Configuration` > `Set Active`
2. Select the target configuration

Then, to compile and run the demo project on a i.MX RT1050 Evaluation board, perform the following steps:

1. Open `MCUXpresso IDE`
2. From the main toolbar, select `Install MCUXpresso SDKs` and install `evkbimxrt1050` SDK
3. Click `File` > `Open Projects from file system...` to display the `Import Projects` dialog box.Select the [imxrt1050-evkb](./imxrt1050-evkb) folder from this repository, and then press the `Finish` button.
4. Replace `ACCESS_KEY` in both `main.c` and `main_multi.c` with your AccessKey obtained from [Picovoice Console](https://picovoice.ai/console/)
5. Click `Project` > `Build Project`
6. Connect the board to the computer, select the imported project inside `Project Explorer` window
7. Click `Run` > `Debug as` > `MCUXpresso IDE LinkServer probes` and then select the connected board.
8. In the debug view, press `Run` > `Resume`

For the single wake word demos, the default wake words are:

- `Porcupine` for English language,
- `salut ordinateur` for French language.
- `hey computer` for German language,
- `hola computadora` for Spanish language,

For the multiple wake words demo `Porcupine`, `Picovoice`, `Bumblebee`, and `Alexa` are considered as the keywords.


## Create Custom Models

1. Copy the UUID of the board printed at the beginning of the session to the IDE console.
1. Go to [Picovoice Console](https://console.picovoice.ai/) to create a model for [Porcupine wake word engine](https://picovoice.ai/docs/quick-start/console-porcupine/).
1. Select `Arm Cortex-M` as the platform when training the model.
1. Select `IMXRT` as the board type and provide the UUID of the chipset on the board.

The model is now being trained. You will be able to download it within a few hours.

## Import the Custom Models

1. Download your custom voice model(s) from [Picovoice Console](https://console.picovoice.ai/).
2. Decompress the zip file. The model for Porcupine wake word is located in two files: A binary `.ppn` file, and as a `.h` header file containing a `C` array version of the binary model.
3. Copy the contents of the array inside the `.h` header file and update the `DEFAULT_KEYWORD_ARRAY` in [imxrt1050-evkb/inc/pv_params.h](./imxrt1050-evkb/inc/pv_params.h) in the language section for which the model is trained.
