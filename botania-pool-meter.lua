INTERVAL = 2
MONITOR_SIDE = "top"
TEXT_SCALE = 1.5
POOLS_AMT = 3
 
function readVals()
    local vals = {}
 
    vals[2] = redstone.getAnalogInput("left")
    vals[3] = redstone.getAnalogInput("front")
    vals[4] = redstone.getAnalogInput("right")
 
    vals[1] = (vals[2] + vals[3] + vals[4]) / 3
 
    return vals
end
 
local iter = 0
 
function updateMonitor(monitor, vals)
    monitor.clear()
    monitor.setTextScale(1.5)
    monitor.setBackgroundColor(2048)
    monitor.setTextColor(1)
 
    monitor.setCursorPos(1, 1)
    monitor.write("   Mana Reserves   ")
 
    monitor.setTextColor(32768)
    monitor.setBackgroundColor(8)
 
    monitor.setCursorPos(1, 3)
    monitor.write("  Left Pool:")
    monitor.setCursorPos(14, 3)
    monitor.write(coloredPercent(monitor, vals[2]))
    monitor.setBackgroundColor(8)
    monitor.setTextColor(32768)
 
    monitor.setCursorPos(1, 4)
    monitor.write("Middle Pool:")
    monitor.setCursorPos(14, 4)
    monitor.write(coloredPercent(monitor, vals[3]))
    monitor.setBackgroundColor(8)
    monitor.setTextColor(32768)
 
    monitor.setCursorPos(1, 5)
    monitor.write(" Right Pool:")
    monitor.setCursorPos(14, 5)
    monitor.write(coloredPercent(monitor, vals[4]))
    monitor.setBackgroundColor(8)
    monitor.setTextColor(32768)
 
    monitor.setCursorPos(1, 7)
    monitor.write("      Total:")
    monitor.setCursorPos(14, 7)
    monitor.write(coloredPercent(monitor, vals[1]))
 
    local iterIndic = ""
    if iter >= 2 then
        iter = 0
        iterIndic = "°"
    else
        iterIndic = "*"
    end
    iter = iter + 1
 
    monitor.setTextColor(1)
    monitor.setBackgroundColor(2048)
 
    monitor.setCursorPos(2, 1)
    monitor.write(iterIndic)
 
    monitor.setCursorPos(18, 1)
    monitor.write(iterIndic)
 
    monitor.setBackgroundColor(8)
    monitor.setTextColor(32768)
end
 
function coloredPercent(monitor, value)
    local col = 32768
    local bgcol = nil
    local val = calcPercent(value)
 
    if val <= 35 then
        bgcol = 16384
    elseif val <= 80 then
        bgcol = 2
    else
        bgcol = 8192
    end
 
    if bgcol ~= nil then
        monitor.setBackgroundColor(bgcol)
    end
 
    monitor.setTextColor(col)
    return val.." %"
end
 
function calcPercent(val, rangeMax)
    if rangeMax == nil then
        rangeMax = 15
    end
 
    return round(val * (100 / rangeMax))
end
 
function round(num, numDecimalPlaces)
    return tonumber(string.format("%."..(numDecimalPlaces or 0).."f", num))
end
 
function run()
    local monitor = peripheral.wrap(MONITOR_SIDE)
 
    while true do
        local vals = readVals()
        if vals ~= nil then
            updateMonitor(monitor, vals)
        end
 
        os.sleep(INTERVAL)
    end
end
 
run()
