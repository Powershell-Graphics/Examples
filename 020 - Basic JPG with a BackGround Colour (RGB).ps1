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

# Save File

$bmp.Save($OutputFile) 

# Tidy Up

$bmp.Dispose()
$graphics.Dispose()