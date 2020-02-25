# ExifWrapper-PowerShellModule

This module is a simple wraper built to pass filename to exif binary utility and parse the result into FileInfo properties.

Install exif binary (using port on MacOS or another SW package manager):

    sudo port install exif


Import module:

    Import-Module ./ExifWrapper.psm1
    

Use function Get-Exif:

    Get-Exif [-Path] "filename.jpg" | Select-Object *
    Get-Exif [-File] (Get-Item filename.jpg) | Select-Object *
    "filename.jpg" | Get-Exif | Select-Object *
    Get-Item filename.jpg | Get-Exif | Select-Object *

The returned FileInfo object contains all the exif properties:

    Manufacturer               : Apple
    Model                      : iPhone 11 Pro Max
    XResolution                : 72
    YResolution                : 72
    ResolutionUnit             : Inch
    Software                   : 13.3.1
    DateandTime                : 2/18/2020 4:57:02 PM
    ExposureTime               : 1/799 sec.
    FNumber                    : f/2.0
    ExposureProgram            : Normal program
    ISOSpeedRatings            : 20
    ExifVersion                : Unknown Exif Version
    DateandTimeOriginal        : 2/18/2020 4:57:02 PM
    DateandTimeDigitized       : 2/18/2020 4:57:02 PM
    ...

Dates are [datetime] objects. Tested on MacOS with PowerShell 7.0.0-rc3

## Usage examples

    > (Get-Item ./filename.jpeg | Get-Exif).DateandTimeOriginal.ToString("yyyy-MM-dd")
    2020-02-18