<p align="center">
    <img src="images/organize_imports.gif" width="723" height="226" max-width="80%" alt="organize"/>
</p>

# Organize Imports
Simple Swift script to alphabetically organize imports in your project's files.
It's created with [Marathon](https://github.com/JohnSundell/Marathon) command line tool.

## Installation

First of all install [Marathon](https://github.com/JohnSundell/Marathon). Pay attention to Marathon [requirements](https://github.com/JohnSundell/Marathon#requirements).<br>
You can run script with `marathon run` command, but I highly recommend installation to use it everywhere.

To install script as binary try:<br>
`$ marathon install organize_imports.swift`<br>

or<br>
`$ marathon install https://raw.githubusercontent.com/swziy/OrganizeImports/master/organize_imports.swift`<br>

## Usage

You can run it on a directory:<br>
`$ organize_imports -dir myProject/Classes`<br>

or on a single file:<br>
`$ organize_imports -file myProject/Classes/MyFantasticClass.swift`<br>

## Integration

If you're using AppCode, there is an option to integrate script as an external tool and run it with a shortcut directly from IDE. Check configuration screens below. 

1. Find `External Tools` section in AppCode and click `+` button.<br>
<img src="images/1.png" width="814" height="470" alt="1"/>

2. Copy this configuration.<br>
Program: `/usr/local/bin/organize_imports`<br>
Parameters: `-file $FilePath$`<br>
Working directory: `/usr/local/bin/`<br>
<img src="images/2.png" width="814" height="405" alt="2"/>

3. Assign shortcut of your choice.<br>
<img src="images/3.png" width="814" height="470" alt="3"/>  

### License

MIT license. See the [LICENSE file](LICENSE.txt) for details.
