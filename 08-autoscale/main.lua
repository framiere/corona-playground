background = display.newImage( "background.png" )



local text1 = display.newText( "image should", 0, 00, "Zapfino", 34 )
text1:setTextColor(255, 255, 255)

local text2 = display.newText( "scale nicely", 30, 70, "Zapfino", 34 )
text2:setTextColor(255, 255, 255)


local button = display.newImage( "springfuse.png" )
button.x = display.contentWidth/2
button.y = display.contentHeight/2

function button:tap(event)
        local r = math.random(0, 255)
        local g = math.random(0, 255)
        local b = math.random(0, 255)
        text1:setTextColor(r,g,b)
        transition.to( text1, { time=1000, y=text1.y+100, rotation=340 } )
        transition.to( button, { time=100, y=display.contentHeight, rotation = -180} )
        
        media.playEventSound("bomb.wav")
end
 
button:addEventListener("tap", button)
text1:addEventListener("tap", button);
text2:addEventListener("tap", button);
