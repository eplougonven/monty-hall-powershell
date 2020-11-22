Add-Type -assembly System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
$form = New-Object System.Windows.Forms.Form
$form.Text ='Monty Hall simulator'
$form.BackColor = [System.Drawing.Color]::FromArgb(255,240,240,240)
$form.AutoSize = 1
$iconBase64      = 'AAABAAEAICAAAAEAGACoDAAAFgAAACgAAAAgAAAAQAAAAAEAGAAAAAAAgAwAABMLAAATCwAAAAAAAAAAAACtra2YmJiKiop1dXVvb29+fn5vb29lZWVvb29ubm50dHTp6en////////////z8/OCgoKrq6uZmZk/Pz9UVFRjY2NYWFhOTk5UVFQdHR1BQUHPz8/IyMjMzMzZ2dnNzc2pqamYmJiJiYlqamp4eHh7e3tycnJsbGx2dnZnZ2fJycn////////////////j4+MxMTGWlpa4uLhDQ0NjY2NbW1tTU1NAQEAzMzMDAwN4eHjV1dXAwMDIyMjY2NjIyMi/v7+qqqqLi4t2dnaHh4eDg4N5eXl4eHhwcHCpqan///////////////+srKwxMTEAAAAtLS2QkJBnZ2dVVVVKSko/Pz8zMzMjIyMoKCizs7PHx8fAwMDGxsbW1tbKysrJycm+vr6VlZWXl5eUlJSJiYmHh4eFhYWSkpL6+vr////////h4eFjY2MuLi5GRkZfX18bGxsnJydoaGhISEg4ODg5OTlTU1MpKSlwcHDT09O6urq/v7/ExMTU1NTKysq0tLS5ubm0tLSqqqqZmZmTk5ORkZGQkJDn5+f////////Hx8dCQkJLS0uenp63t7fDw8OmpqYnJycgICBTU1NRUVFhYWFfX19iYmLAwMDBwcG6urrAwMDGxsbU1NTJycnExMStra20tLS2tralpaWfn5+GhobBwcH////////IyMhISEhgYGDAwMDl5eXT09PFxcXBwcGBgYEVFRUtLS2KioqEhISFhYXExMTNzc28vLzAwMDExMTKysrX19fKysrS0tLHx8eurq6xsbG8vLynp6eurq77+/v////d3d1cXFxubm6srKzT09PW1tbIyMipqamBgYFpaWlPT08HBwdvb2/MzMy/v7/JycnBwcHDw8PGxsbJycnMzMzc3NzOzs7R0dHT09PNzc2srKy2tra0tLTs7Oz///////+Hh4dmZmaRkZGurq7Dw8PQ0NC6urqKiop3d3c5OTlGRkZlZWUYGBiwsLDZ2dm+vr7Dw8PGxsbGxsbJycnOzs7c3NzOzs7a2trS0tLV1dXExMSioqLR0dH////////Q0NBxcXGXl5eqqqqkpKTOzs7Pz8+7u7vGxsaxsbE8PDwxMTHKyspQUFArKyvV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'
$iconBytes       = [Convert]::FromBase64String($iconBase64)
$stream          = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage       = [System.Drawing.Image]::FromStream($stream, $true)
$form.Icon       = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())
$mX = 10 # margins
[int[]] $X = $mX,$mX # position of controls

$Label_rules = New-Object System.Windows.Forms.Label
$Label_rules.Text = "Three closed doors, a prize behind one. You choose one without opening. 
Monty opens one of the two others that doesn't have the prize, and asks if you want to switch door.
Should you?"
$Label_rules.Location  = New-Object System.Drawing.Point($X)
$Label_rules.AutoSize = $true
$Label_rules.BackColor = "Transparent"
$Label_rules.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($Label_rules)
$X[0] = $mX
$X[1] += $Label_rules.Height + $mX

$Label_nPlays_text = New-Object System.Windows.Forms.Label
$Label_nPlays_text.Text = "n: "
$Label_nPlays_text.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$Label_nPlays_text.Location  = New-Object System.Drawing.Point($X)
$Label_nPlays_text.AutoSize = $true
$Label_nPlays_text.BackColor = "Transparent"
$form.Controls.Add($Label_nPlays_text)
$X[0] += $Label_nPlays_text.Width

$ComboBox_nPlays = New-Object System.Windows.Forms.ComboBox
$ComboBox_nPlays.Width = 100
$ComboBox_nPlays.Items.AddRange(@("1","10","100","1000","10000"));
$ComboBox_nPlays.SelectedIndex = 0
$ComboBox_nPlays.Location  = New-Object System.Drawing.Point($X)
$form.Controls.Add($ComboBox_nPlays)
$X[0] += $ComboBox_nPlays.Width + 3*$mX

$Button_play = New-Object System.Windows.Forms.Button
$Button_play.Location = New-Object System.Drawing.Size($X)
$Button_play.Size = New-Object System.Drawing.Size(120,23)
$Button_play.Text = "Play n games"
$form.Controls.Add($Button_play)
$X[0] += $Button_play.Width + 3*$mX

$Button_reset = New-Object System.Windows.Forms.Button
$Button_reset.Location = New-Object System.Drawing.Size($X)
$Button_reset.Size = New-Object System.Drawing.Size(120,23)
$Button_reset.Text = "Reset"
$form.Controls.Add($Button_reset)
$X[0] += $Button_play.Width + 3*$mX

$X[0] = $mX
$X[1] += $Button_reset.Height + $mX

$nGames = 0;
    $Label_nGames_text = New-Object System.Windows.Forms.Label
    $Label_nGames_text.Text = "Number of games played: "
    $Label_nGames_text.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
    $Label_nGames_text.Location  = New-Object System.Drawing.Point($X)
    $Label_nGames_text.AutoSize = $true
    $Label_nGames_text.BackColor = "Transparent"
    $form.Controls.Add($Label_nGames_text)
    $X[0] += $Label_nGames_text.Width

    $Label_nGames = New-Object System.Windows.Forms.Label
    $Label_nGames.Location  = New-Object System.Drawing.Point($X)
    $Label_nGames.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
    $Label_nGames.AutoSize = $true
    $Label_nGames.BackColor = "Transparent"
    $form.Controls.Add($Label_nGames)
    $X[0] += $Label_nGames.Width + 10*$mX

$nWon_switched = 0;
    $Label_nWon_Switched_text = New-Object System.Windows.Forms.Label
    $Label_nWon_Switched_text.Text = "Wins if switched: "
    $Label_nWon_Switched_text.Font = New-Object System.Drawing.Font("Arial", 12,[System.Drawing.FontStyle]::Bold)
    $Label_nWon_Switched_text.Location  = New-Object System.Drawing.Point($X)
    $Label_nWon_Switched_text.AutoSize = $true
    $Label_nWon_Switched_text.BackColor = "Transparent"
    $form.Controls.Add($Label_nWon_Switched_text)
    $X[0] += $Label_nWon_Switched_text.Width

    $Label_nWon_Switched = New-Object System.Windows.Forms.Label
    $Label_nWon_Switched.Location  = New-Object System.Drawing.Point($X)
    $Label_nWon_Switched.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
    $Label_nWon_Switched.AutoSize = $true
    $Label_nWon_Switched.BackColor = "Transparent"
    $form.Controls.Add($Label_nWon_Switched)

$X[0] = $mX
$X[1] += $Label_nWon_Switched.Height + $mX


    $Label_pSwitch_text = New-Object System.Windows.Forms.Label
    $Label_pSwitch_text.Text = "Probability (%) of winning if switching doors: "
    $Label_pSwitch_text.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
    $Label_pSwitch_text.Location  = New-Object System.Drawing.Point($X)
    $Label_pSwitch_text.AutoSize = $true
    $Label_pSwitch_text.BackColor = "Transparent"
    $form.Controls.Add($Label_pSwitch_text)
    $X[0] += $Label_pSwitch_text.Width + $mX

    $Label_pSwitch = New-Object System.Windows.Forms.Label
    $Label_pSwitch.Text = 0
    $Label_pSwitch.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
    $Label_pSwitch.Location  = New-Object System.Drawing.Point($X)
    $Label_pSwitch.AutoSize = $true
    $Label_pSwitch.BackColor = "Transparent"
    $form.Controls.Add($Label_pSwitch)

$X[0] = $mX
$X[1] += $Label_pSwitch.Height + $mX


$Label_quote = New-Object System.Windows.Forms.Label
$Label_quote.Text = "`"You blew it, and you blew it big!
Since you seem to have difficulty grasping the basic principle at work here, I'll explain.
After the host reveals a goat, you now have a one-in-two chance of being correct.
Whether you change your selection or not, the odds are the same.
There is enough mathematical illiteracy in this country, and we don't need the world's highest IQ propagating more. Shame!`"
 – Scott Smith, Ph.D. University of Florida"
$Label_quote.Location  = New-Object System.Drawing.Point($X)
$Label_quote.AutoSize = $true
$Label_quote.BackColor = "Transparent"
$Label_quote.Font = New-Object System.Drawing.Font("Times new roman", 10,[System.Drawing.FontStyle]::Italic)
$form.Controls.Add($Label_quote)
$X[0] = $mX
$X[1] += $Label_quote.Height + $mX

function update_values {
    $Label_nGames.Text = $script:nGames
    $Label_nWon_switched.Text = $script:nWon_switched
    if( $script:nGames -eq 0 )
    { 
        $Label_pSwitch.Text = 0 
        $Label_lastgame.hide()
        $Label_caption_choice.hide()
        $Label_caption_show.hide()
        $Label_lastGame_result.hide()
    }
    else 
    { 
        $Label_pSwitch.Text = [math]::round($script:nWon_switched / $script:nGames * 100,2) 
        $Label_lastgame.show()
        $Label_caption_choice.show()
        $Label_caption_show.show()
        $Label_lastGame_result.show()
        if( $carDoor -eq $yourChoice )
        {
            $Label_lastGame_result.Text = "You would've lost if you switched doors..."
        }
        else
        {
            $Label_lastGame_result.Text = "You would've won if you switched doors!"
        }
    }
}

$Button_play.Add_Click(
{
    $nPlays = 1*[Math]::pow(10, $ComboBox_nPlays.SelectedIndex);
    for($i = 0; $i -lt $nPlays; $i++)
    {
        $script:nGames++;
        $script:carDoor = Get-Random -Maximum 3
        $script:yourChoice = Get-Random -Maximum 3
        if ( $carDoor -ne $yourChoice )
        {
            $script:nWon_switched++; 
        }
    }
    update_values
}
)

$Button_reset.Add_Click(
{
    $script:nGames = 0
    $script:nWon_stayed = 0
    $script:nWon_switched = 0
    $pSwitch = 0;
    update_values
}
)

$Label_lastgame = New-Object System.Windows.Forms.Label
$Label_lastgame.Text = "Last game's recap:"
$Label_lastgame.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$Label_lastgame.Location  = New-Object System.Drawing.Point($X)
$Label_lastgame.AutoSize = $true
$Label_lastgame.BackColor = "Transparent"
$form.Controls.Add($Label_lastgame)
$X[1] += $Label_lastgame.Height + $mX

$imgCar_Base64_string = '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'
$imgCar_Base64_bytes = [Convert]::FromBase64String($imgCar_Base64_string)
$stream = New-Object IO.MemoryStream($imgCar_Base64_bytes, 0, $imgCar_Base64_bytes.Length)
$stream.Write($imgCar_Base64_bytes, 0, $imgCar_Base64_bytes.Length);
$imgCar = [System.Drawing.Image]::FromStream($stream, $true)

$imgGoat_Base64_string = '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Op3o1tw+eW6ELwL4giAk7N69G0FBWJKuztRi86lpEGKIz+cLLzZnV0ck8P/44493d+/ejUAgsGQtPqssEH7E59atWwmpqanw+XyET/jSgT86OhrLFp/wJQc/FArFHD58eEk/3BI+4UfFYhSDwQCHw4FAIED4hC8N+BMTE6vz8vLw8ssvw+/3Ez7hSwP+5OTkytHR0djS0lJ0dnYSPuFLq5JaXV0dzp49S/iELy34JSUl7OMTvvTgf/rpp6irrSV8wpcW/GvXrrXv37+f8AlfWvAnJydXvv3224RP+NKrj9/V1XWD8AmfO6IQPuETPuETPuETPuETPuETPuETPuETPuETPuETPuETPuETPuETPuETPuETPuETPuETPuETfkTCn6oyptVqRQf/yXMjfMKftWisUqmERqOBWq2O6mg0GiiVShaNJfzZo1arkZ2djebmZtGVCW9ubkZ2dna4y0P4hD9jYwiLxQKTyYTy8nJRxGQywWKxcGMIwp99KyCv14uBgQEMDAzA7XaLIlPn4/V6uRUQ4TOET/gM4RM+Q/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/iET/hSg/8kdJVKJaoyIX91hoeH8f7774dfezwewo/EjIyMZFRWVsLpdMLpdCIxMRG1tbXh18zCYrVasX///vDryspKjIyMZBB+hGV8fDxmfHw85t69e+vv3bu3/sk/MwtPKBSacT3Hx8djCJ9hCJ9hCJ9hCJ9hCJ9hCJ9hCJ9hCJ9hCJ9hCJ9hCJ9hliT/GwDtx8s3cuIUBAAAAABJRU5ErkJggg=='
$imgGoat_Base64_bytes = [Convert]::FromBase64String($imgGoat_Base64_string)
$stream = New-Object IO.MemoryStream($imgGoat_Base64_bytes, 0, $imgGoat_Base64_bytes.Length)
$stream.Write($imgGoat_Base64_bytes, 0, $imgGoat_Base64_bytes.Length);
$imgGoat = [System.Drawing.Image]::FromStream($stream, $true)

$pictureBox_doors = new-object Windows.Forms.PictureBox
$pictureBox_doors.Location  = New-Object System.Drawing.Point($X)
$pictureBox_doors.Width =  $imgCar.Size.Width*3+2*$mX; #$imgCar and $imgGoat are same width
$pictureBox_doors.Height =  $imgCar.Size.Height;
$pictureBox_doors.BackColor = "Transparent"

$form.controls.add($pictureBox_doors)
$pictureBox_doors.hide()

[int[]] $RO = 48,12
[int[]] $RS = 87,211

$formGraphics = $form.createGraphics()
$brush_erase = new-object Drawing.SolidBrush($form.BackColor);
$brush_choice = new-object Drawing.SolidBrush([System.Drawing.Color]::FromArgb(128,200,100,100))
$brush_show = new-object Drawing.SolidBrush([System.Drawing.Color]::FromArgb(128,0,200,200))
$X_doors = $X[0], ($X[0]+$imgCar.Size.Width+$mX), ($X[0]+2*$imgCar.Size.Width+2*$mX);
$Y_doors = $X[1]

$form.add_paint(
{
    $formGraphics.FillRectangle($brush_erase,$pictureBox_doors.Location.X,$pictureBox_doors.Location.Y,$pictureBox_doors.Width, $pictureBox_doors.Height)
    if ( $nGames -gt 0 )
    {
        for($i = 0; $i -lt 3; $i++)
        {
            if($i -eq $carDoor)
            {
                $formGraphics.DrawImage($imgCar,$X_doors[$i], $Y_doors, $imgCar.Size.Width, $imgCar.Size.Height);
            }
            else
            {
                $formGraphics.DrawImage($imgGoat,$X_doors[$i], $Y_doors, $imgGoat.Size.Width, $imgGoat.Size.Height);
            }
            
        }
        $formGraphics.FillRectangle($brush_choice, $X_doors[$yourChoice]+$RO[0], $Y_doors+$RO[1], $RS[0], $RS[1])
        if( $carDoor -eq $yourChoice )
        {
            $j = (($carDoor + 1)%3);
        }
        else
        {
            $j = (($yourChoice+1)%3);
            if( $j -eq $carDoor )
            {$j = (($j+1)%3);}
        }
        $formGraphics.FillRectangle($brush_show, $X_doors[$j]+$RO[0], $Y_doors+$RO[1], $RS[0], $RS[1])        
        $script:justPlayed = $false
    }
}
)

$X[1] += $imgCar.Size.Height + $mX;
$Label_caption_choice = New-Object System.Windows.Forms.Label
$Label_caption_choice.Text = "Your choice"
$Label_caption_choice.Font = New-Object System.Drawing.Font("Arial", 11)
$Label_caption_choice.ForeColor = $brush_choice.Color;
$Label_caption_choice.Location  = New-Object System.Drawing.Point($X)
$Label_caption_choice.AutoSize = $true
$Label_caption_choice.BackColor = "Transparent"
$form.Controls.Add($Label_caption_choice)
$X[0] += $Label_caption_choice.Width + $mX

$Label_caption_show = New-Object System.Windows.Forms.Label
$Label_caption_show.Text = "The door Monty opens"
$Label_caption_show.Font = New-Object System.Drawing.Font("Arial", 11)
$Label_caption_show.ForeColor = $brush_show.Color;
$Label_caption_show.Location  = New-Object System.Drawing.Point($X)
$Label_caption_show.AutoSize = $true
$Label_caption_show.BackColor = "Transparent"
$form.Controls.Add($Label_caption_show)
$X[0] += $Label_caption_show.Width + $mX

$Label_lastGame_result = New-Object System.Windows.Forms.Label
$Label_lastGame_result.Font = New-Object System.Drawing.Font("Arial", 11, [System.Drawing.FontStyle]::Bold)
$Label_lastGame_result.Text = "You would've lost if you switched doors..."
$Label_lastGame_result.Location  = New-Object System.Drawing.Point($X)
$Label_lastGame_result.AutoSize = $true
$Label_lastGame_result.BackColor = "Transparent"
$form.Controls.Add($Label_lastGame_result)

update_values
$form.ShowDialog()
$form.Dispose()
