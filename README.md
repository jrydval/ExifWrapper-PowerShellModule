# ExifWrapper-PowerShellModule

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
    X-Resolution               : 72
    Y-Resolution               : 72
    ResolutionUnit             : Inch
    Software                   : 13.3.1
    DateandTime                : 2/18/2020 4:57:02 PM
    ExposureTime               : 1/799 sec.
    F-Number                   : f/2.0
    ExposureProgram            : Normal program
    ISOSpeedRatings            : 20
    ExifVersion                : Unknown Exif Version
    DateandTimeOriginal        : 2/18/2020 4:57:02 PM
    DateandTimeDigitized       : 2/18/2020 4:57:02 PM
    ...

Dates are [datetime] objects.