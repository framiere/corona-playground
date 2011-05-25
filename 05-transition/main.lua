local text = display.newText( "Springfuse", 100, 50, nil, 24 )
text:setTextColor(255, 255, 255)

local button = display.newImage( "springfuse.png" )
button.x = display.contentWidth/2
button.y = display.contentHeight/2

function button:tap(event)
        local r = math.random(0, 255)
        local g = math.random(0, 255)
        local b = math.random(0, 255)
        text:setTextColor(r,g,b)
        transition.to( text, { time=1000, y=text.y+100 } )
        media.playEventSound("bomb.wav")
end
 
button:addEventListener("tap", button)
text:addEventListener("tap", button);

