# Setup Vars

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
$OutputFile = "C:\temp\result.jpg" 

# Create Image File 

$bmp = new-object System.Drawing.Bitmap 1920,1080 

# Fill Image with Colour "SlateBlue"

$brushBg = [System.Drawing.Brushes]::SlateBlue
$graphics = [System.Drawing.Graphics]::FromImage($bmp) 
$graphics.FillRectangle($brushBg,0,0,$bmp.Width,$bmp.Height) 

# Save File

$bmp.Save($OutputFile) 

# Tidy Up

$bmp.Dispose()
$graphics.Dispose()