#!/bin/bash
#Script takes a screenshot of the desktop before starting conky (using scrot),
#cuts, blurs and darkens the image and saves (using ImageMagick)
#for use as conky background

#Required settings:
# conky alignment top_left
# conky border_inner_margin 0
# conky text example: ${image ~/.conky/conky-bg.png -p -1,-1}
#Metrics
#scrot region width = conky maximum_size width
#scrot region height = conky maximum_size height + 2x border_outer_margin
#scrot position x = conky gap_x - border_outer_margin
#scrot position y = conky gap_y - border_outer_margin

CONKYCONF="~/.config/conky/conky.conf"

BOM=$( grep 'border_outer_margin' $CONKYCONF | awk '{print $2}' )
SRW=$( grep 'maximum_width' $CONKYCONF | awk '{print $2}' )
MS=$( grep 'minimum_height' $CONKYCONF | awk '{print $2}' ) 
SRH=$(( $MS + 2*$BOM + 30))
GAPX=$( grep 'gap_x' $CONKYCONF | awk '{print $2}' )
GAPY=$( grep 'gap_y' $CONKYCONF | awk '{print $2}' )
SPX=$(( $GAPX - $BOM ))
SPY=$(( $GAPY - $BOM ))
AREA=$(echo "$SRW""x""$SRH""+"$SPX"+""$SPY")

#notify-send "Conky Metrics Test:" "$AREA"

killall conky
sleep 5

scrot temp1.png
convert temp1.png -region $AREA -blur 0x10 +region temp2.png
convert -brightness-contrast -10x0 temp2.png temp3.png
convert temp3.png -crop $AREA ~/.conky/conky-bg.png

rm temp1.png
rm temp2.png
rm temp3.png

exec conky -c ~/.config/conky/conky.conf
exit
