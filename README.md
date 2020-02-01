<p align="center">
    <img src="images/organize_imports.gif" width="723" height="226" max-width="80%" alt="organize"/>
</p>

# Organize Imports
Simple Swift script to alphabetically organize imports in your project's files.
It's created with [Marathon](https://github.com/JohnSundell/Marathon) command line tool.

## Installation

1. Clone repository and enter main folder
2. Fallow this steps:<br>
  `$ swift build -c release`<br>
  `$ cd .build/release`<br>
  `$ cp -f OrganizeImports /usr/local/bin/organize_imports`<br>

## Usage

You can run it on a directory:<br>
`$ organize_imports -dir myProject/Classes`<br>

or on a single file:<br>
`$ organize_imports -file myProject/Classes/MyFantasticClass.swift`<br>

## Integration

If you're using AppCode, there is an option to integrate script as an external tool and run it with a shortcut directly from IDE. Check configuration screens below. 

1. Find `External Tools` section in AppCode and click `+` button.<br>
<img src="images/1.png" width="1012" height="834" alt="1"/>

2. Copy this configuration.<br>
Program: `/usr/local/bin/organize_imports`<br>
Parameters: `-file $FilePath$`<br>
Working directory: `$FileDir`<br>
<img src="images/2.png" width="746" height="592" alt="2"/>

3. Assign shortcut of your choice.<br>
<img src="images/3.png" width="1012" height="834" alt="3"/>

4. Try sorting imports with shortcut.<br>
<img src="images/4.png" width="1012" height="835" alt="4"/>

### License

MIT license. See the [LICENSE file](LICENSE.txt) for details.
