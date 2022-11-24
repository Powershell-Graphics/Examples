# Setup Vars

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

$OutputFile = "C:\temp\result.jpg"
$PNGFile = "C:\temp\LOGO.png"

# Create Image File 

$bmp = new-object System.Drawing.Bitmap 1920,1080

# Create Graphics Buffer

$Graphics = [system.drawing.Graphics]::FromImage($bmp)
$Graphics.TextRenderingHint = 'AntiAliasGridFit'

# Fill BG with colour

$brushBg = [System.Drawing.Brushes]::SlateBlue
$graphics = [System.Drawing.Graphics]::FromImage($bmp) 
$graphics.FillRectangle($brushBg,0,0,$bmp.Width,$bmp.Height) 

# Create Graphics Buffer for PNG File

$image2 = [system.drawing.image]::FromFile($PNGFile)
$image2Graphics = [system.drawing.Graphics]::FromImage($image2)
$image2Graphics.TextRenderingHint = 'AntiAliasGridFit'

# Overlay Image inc scale function 

$Scale = 0.60
$graphics.DrawImage($image2, 200, 200,$image2.Width*$Scale ,$image2.Height*$Scale)

# Save File

$bmp.Save($OutputFile) 

# Tidy Up

$bmp.Dispose()
$Graphics.Dispose()

# Open File When Finished

& $OutputFile