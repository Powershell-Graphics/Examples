# Setup Vars

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
$OutputFile = "C:\temp\result.jpg" 

# Create Image File 

$bmp = new-object System.Drawing.Bitmap 1920,1080

# Fill Image with RBG Colour

$NumberofStrips = 20

$RGBR  = 68
$RGBG = 0
$RGBB = 153

for ($z = 0; $z -lt $NumberofStrips; $z++) {

$Lower = ($bmp.Width/$NumberofStrips)*($z)+1
$Upper = ($bmp.Width/$NumberofStrips)*($z+1)

for ($y = 0; $y -lt $bmp.Height; $y++) {
        for ($x = $Lower; $x -lt $Upper; $x++) {
           
                $tint_factor = 1/($z+1)
                $varR  = $RGBR + (255 - 68) * $tint_factor
                $varG = $RGBG + (255 - 0) * $tint_factor
                $varB = $RGBB + (255 - 153) * $tint_factor
                $bmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb($varR, $varG, $varB))
                
        }
    }
}

# Save File

$bmp.Save($OutputFile) 

# Tidy Up

$bmp.Dispose()
$graphics.Dispose()

# Open File When Finished

& $OutputFile