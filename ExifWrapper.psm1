enum ExifId {
    GPSTagVersion = 0x0000
    InteroperabilityIndex = 0x0001
    InteroperabilityVersion = 0x0002
    EastorWestLongitude = 0x0003
    Longitude = 0x0004
    AltitudeReference = 0x0005
    Altitude = 0x0006
    GPSTimeAtomicClock = 0x0007
    GPSSatellites = 0x0008
    GPSReceiverStatus = 0x0009
    GPSMeasurementMode = 0x000a
    MeasurementPrecision = 0x000b
    SpeedUnit = 0x000c
    SpeedofGPSReceiver = 0x000d
    Referencefordirectionofmovement = 0x000e
    DirectionofMovement = 0x000f
    GPSImageDirectionReference = 0x0010
    GPSImageDirection = 0x0011
    GeodeticSurveyDataUsed = 0x0012
    ReferenceForLatitudeofDestination = 0x0013
    LatitudeofDestination = 0x0014
    ReferenceforLongitudeofDestinatio = 0x0015
    LongitudeofDestination = 0x0016
    ReferenceforBearingofDestination = 0x0017
    BearingofDestination = 0x0018
    ReferenceforDistancetoDestination = 0x0019
    DistancetoDestination = 0x001a
    NameofGPSProcessingMethod = 0x001b
    NameofGPSArea = 0x001c
    GPSDate = 0x001d
    GPSDifferentialCorrection = 0x001e
    NewSubfileType = 0x00fe
    ImageWidth = 0x0100
    ImageLength = 0x0101
    BitsperSample = 0x0102
    Compression = 0x0103
    PhotometricInterpretation = 0x0106
    FillOrder = 0x010a
    DocumentName = 0x010d
    ImageDescription = 0x010e
    Manufacturer = 0x010f
    Model = 0x0110
    StripOffsets = 0x0111
    Orientation = 0x0112
    SamplesperPixel = 0x0115
    RowsperStrip = 0x0116
    StripByteCount = 0x0117
    XResolution = 0x011a
    YResolution = 0x011b
    PlanarConfiguration = 0x011c
    ResolutionUnit = 0x0128
    TransferFunction = 0x012d
    Software = 0x0131
    DateandTime = 0x0132
    Artist = 0x013b
    WhitePoint = 0x013e
    PrimaryChromaticities = 0x013f
    SubIFDOffsets = 0x014a
    TransferRange = 0x0156
    JPEGProc = 0x0200
    JPEGInterchangeFormat = 0x0201
    JPEGInterchangeFormatLength = 0x0202
    YCbCrCoefficients = 0x0211
    YCbCrSubSampling = 0x0212
    YCbCrPositioning = 0x0213
    ReferenceBlackWhite = 0x0214
    XMLPacket = 0x02bc
    RelatedImageFileFormat = 0x1000
    RelatedImageWidth = 0x1001
    RelatedImageLength = 0x1002
    CFARepeatPatternDim = 0x828d
    CFAPattern = 0x828e
    BatteryLevel = 0x828f
    Copyright = 0x8298
    ExposureTime = 0x829a
    FNumber = 0x829d
    IPTCNAA = 0x83bb
    ImageResourcesBlock = 0x8649
    InterColorProfile = 0x8773
    ExposureProgram = 0x8822
    SpectralSensitivity = 0x8824
    ISOSpeedRatings = 0x8827
    OptoElectronicConversionFunction = 0x8828
    TimeZoneOffset = 0x882a
    ExifVersion = 0x9000
    DateandTimeOriginal = 0x9003
    DateandTimeDigitised = 0x9004
    ComponentsConfiguration = 0x9101
    CompressedBitsperPixel = 0x9102
    ShutterSpeed = 0x9201
    Aperture = 0x9202
    Brightness = 0x9203
    ExposureBias = 0x9204
    MaximumApertureValue = 0x9205
    SubjectDistance = 0x9206
    MeteringMode = 0x9207
    LightSource = 0x9208
    Flash = 0x9209
    FocalLength = 0x920a
    SubjectArea = 0x9214
    TIFFEPStandardID = 0x9216
    MakerNote = 0x927c
    UserComment = 0x9286
    SubsecondTime = 0x9290
    SubsecondTimeOriginal = 0x9291
    SubsecondTimeDigitised = 0x9292
    XPTitle = 0x9c9b
    XPComment = 0x9c9c
    XPAuthor = 0x9c9d
    XPKeywords = 0x9c9e
    XPSubject = 0x9c9f
    FlashPixVersion = 0xa000
    ColourSpace = 0xa001
    PixelXDimension = 0xa002
    PixelYDimension = 0xa003
    RelatedSoundFile = 0xa004
    FlashEnergy = 0xa20b
    SpatialFrequencyResponse = 0xa20c
    FocalPlaneXResolution = 0xa20e
    FocalPlaneYResolution = 0xa20f
    FocalPlaneResolutionUnit = 0xa210
    SubjectLocation = 0xa214
    ExposureIndex = 0xa215
    SensingMethod = 0xa217
    FileSource = 0xa300
    SceneType = 0xa301
    CFAPattern2 = 0xa302
    CustomRendered = 0xa401
    ExposureMode = 0xa402
    WhiteBalance = 0xa403
    DigitalZoomRatio = 0xa404
    FocalLengthin35mmFilm = 0xa405
    SceneCaptureType = 0xa406
    GainControl = 0xa407
    Contrast = 0xa408
    Saturation = 0xa409
    Sharpness = 0xa40a
    DeviceSettingDescription = 0xa40b
    SubjectDistanceRange = 0xa40c
    ImageUniqueID = 0xa420
    Gamma = 0xa500
    PRINTImageMatching = 0xc4a5
    Padding = 0xea1c
}



function Get-Exif {

    [CmdletBinding(DefaultParameterSetName = "File")]   
    param(
        [Parameter(Mandatory = $true,
            Position = 0,
            ParameterSetName = "Path",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Path to one or more JPG files.")]
        [Alias("FileName")]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Path,
        [Parameter(Mandatory = $true,
            Position = 0,
            ParameterSetName = "File",
            ValueFromPipeline = $true,
            HelpMessage = "File Item or Items.")]
        [Alias("FileItem")]
        [ValidateNotNullOrEmpty()]
        [System.IO.FileInfo[]]
        $File
    )

    begin { 
        Write-Debug "Get-Exif Begin"
        Get-Command -Name "exif" -ErrorAction Stop | Out-Null
    }

    end { 
        Write-Debug "Get-Exif End"
    }

    process {
        $paramSet = $PSCmdlet.ParameterSetName
        Write-Debug "Get-Exif - ParamSet: $paramSet, Parameters - Path: $Path, File: $File"

        if ( $paramSet -eq "File" ) {
            $Path = $File.FullName
        }
        else {
            $File = Get-Item $Path
        }

        Write-Debug "Get-Exif - after resolution - Path: $Path, File: $File"
        
        foreach ($f in $File) {

            $exif = [PSCustomObject]@{
                PSTypeName = "Exif"
            }

            #$exif = @{}

            (exif -mi $f.FullName) | Select-Object -SkipLast 1 |  ForEach-Object {
                $id, $value = $_ -split "`t"
                #$name = $name -replace '[\(\)\s\-]', ''   

                $name = [exifid].GetEnumName([int]$id)

                if ($name.startsWith("DateandTime")) {
                    $value = Get-Date ($value -replace "^(.*?):(.*?):(.*?) ", "`$1.`$2.`$3 ")
                }

                Write-Debug "Get-Exif - Addind NoteProperty: $name = $value"

                Add-Member -InputObject $exif -NotePropertyName $name -NotePropertyValue $value -Force
                #$exif.Add($name, $value)
            }
            Add-Member -InputObject $f -NotePropertyName "Exif" -NotePropertyValue $exif
            $f
        }
    }

}



