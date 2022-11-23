# Setup Vars

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
$OutputFile = "C:\temp\result.jpg" 

# Create Image File 

$bmp = new-object System.Drawing.Bitmap 1920,1080 

# Fill Image with RBG Colour

for ($y = 0; $y -lt $bmp.Height; $y++) {
        for ($x = 0; $x -lt $bmp.Width; $x++) {
            $varR = 68 
            $varG = 0 
            $varB = 153
            $bmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb($varR, $varG, $varB))
        }
    }

# Set Up Graphics Buffer

$Graphics = [system.drawing.Graphics]::FromImage($bmp)
$Graphics.TextRenderingHint = 'AntiAliasGridFit'

# Set Up Font Information

$Text ="Example"
$FontName = "Arial"
$FontSize = 105
$TextColour = [System.Drawing.Brushes]::"White"
$TextPosition_Left = 100
$TextPosition_Top = 100

$Font = new-object System.Drawing.Font($FontName, $FontSize)

# Overlay Text with Font

$Graphics.DrawString($Text,$Font,$TextColour,$TextPosition_Left,$TextPosition_Top)

# Save File

$bmp.Save($OutputFile) 

# Tidy Up

$bmp.Dispose()
$graphics.Dispose()
