# Fix AMD Discord
### [Leia em PT-BR 🇧🇷](https://github.com/Hachi-R/Fix-AMD-Discord-CLI/blob/main/READMEBRAZIL.md)
### Fix AMD Discord is a tool designed to address specific issues with Discord on AMD processors, such as:

- Crashes when joining voice calls;
- Crashes when watching screen broadcasts;
- Crashes when screen broadcasting.

#### These issues are related to the [Math Kernel Library (MKL)](https://en.wikipedia.org/wiki/Math_Kernel_Library), which, on some Hackintosh AMD processors, some applications, including Discord and Adobe software, attempt to use Intel-specific functions. This can result in system failures.

#### The Fix AMD Discord modifies the `MKL_DEBUG_CPU_TYPE` environment variable so that MKL uses the appropriate functions for AMD CPUs.

##### Note: This fix should also resolve issues in Adobe software, although I have not tested it.

# Installation
### There are two ways to obtain the tool:
- **Option   1: Download a Ready Build**. You can download a pre-compiled version from the [releases](https://github.com/Hachi-R/Fix-AMD-Discord-CLI/releases) and run it directly.

- **Option   2: Compile from Source Code**. If you prefer, you can clone this repository and compile the tool from the source code using [Xcode](https://developer.apple.com/xcode/).
  - To clone via command line: `git clone https://github.com/Hachi-R/Fix-AMD-Discord-CLI`
  - To download as a zip file: https://github.com/Hachi-R/Fix-AMD-Discord-CLI/archive/refs/heads/main.zip

# Commands        
![image](https://github.com/Hachi-R/Fix-AMD-Discord-CLI/assets/58823742/61caf909-b8f0-4c25-bdd6-9d6b7d92f001)

1. Applies a permanent fix, which will remain active until it is explicitly removed.
2. Removes a previously applied fix, and this change will remain even after system restart.
3. Applies a temporary fix, which will be reverted after system restart.
4. Removes the temporary fix, which will be reapplied after the next system restart.
5. Applies a fix that will only take effect after the system is restarted.
6. Removes the fix only after system restart.

## Contacts
#### If you encounter any bugs or think something could be improved in another way, feel free to make a pull request or contact me through [Discord](https://discordapp.com/users/794234392141627432/).
