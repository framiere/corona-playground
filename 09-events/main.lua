system.activate( "multitouch" )
display.setStatusBar(display.HiddenStatusBar)

background = display.newImage( "background.png" )

local countText = display.newText( "0", 140, 00, nil, 34 )
local count = 0

local text1 = display.newText( "image should", 0, 00, "Zapfino", 34 )
text1:setTextColor(255, 255, 255)

local text2 = display.newText( "scale nicely", 30, 70, "Zapfino", 34 )
text2:setTextColor(255, 255, 255)

local text3 = display.newText( "on ipad", 30, 280, nil, 34 )
text3:setTextColor(55, 255, 255)

local event = display.newText( "",  display.contentWidth/2, 420, nil, 14)
local instant = display.newText( "",  display.contentWidth/2, 440, nil, 14)
local gravity = display.newText( "",  display.contentWidth/2, 460, nil, 14)


local button = display.newImage( "springfuse.png" )
button.x = display.contentWidth/2
button.y = display.contentHeight/2

local function tap(e)
        event.text = e.numTaps .. " " .. e.name .. " x: " .. e.x .. " y: " .. e.y

        local r = math.random(0, 255)
        local g = math.random(0, 255)
        local b = math.random(0, 255)
        e.target:setTextColor(r,g,b)
end

local function rotate(e)
        local scale = (math.random(0, 100) / 100) + 1
        local timing = math.random(0, 100)  + 500;
        transition.to( e.target, { time=timing, rotation = e.target.rotation -  math.random(0, 600), xScale = scale , yScale = scale} )
end

local function shake(e)
        event.text = e.name;
        instant.text = (e.name .. " instant  x:" .. e.xInstant .. " y:" .. e.yInstant .. " z:" .. e.zInstant)
        gravity.text = (e.name .. " gravity  x:" .. e.xGravity .. " y:" .. e.yGravity .. " z:" .. e.zGravity)

        if(e.isShake == true) then
               media.playEventSound("bomb.wav")
        end
end

local function touch(e) 
        event.text =  e.name .. " x: " .. e.x .. " y: " .. e.y ..  " " .. e.phase
          
end

button:addEventListener("tap", rotate)
text1:addEventListener("tap", tap);
text2:addEventListener("tap", tap);
text3:addEventListener("tap", tap);
text3:addEventListener("doubletap", tap);
Runtime:addEventListener("touch", touch ) 
Runtime:addEventListener("accelerometer", shake)


local function frames(e)
        count = count + 1;
        countText.text=count
end
Runtime:addEventListener("enterFrame", frames);

