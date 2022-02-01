# Credentials Deobfuscation Library
This program deobfuscates access credentials which were obfuscated with the [Credientials Obfuscating Tool](https://github.com/execvpe/credentials-obfuscating-tool).

**For more information about the project and how it works click the link above.**

## Usage

- Copy the content of the *src* and *include* directory and use it in your project

or

- Run ```make lib``` to create a static library and link with ```-Lyour_path_here -ldeobfuscate```

## Demo program

The example program deobfuscates the demo header created in the [Example](https://github.com/execvpe/credentials-obfuscating-tool#example) section of the obfuscation tool documentation.

Build it with ```make```.

### Expected output:
```
$ ./deobfuscate-demo
SSID: EXAMPLE_SSID
Password: EXAMPLE_PASSWORD
```
