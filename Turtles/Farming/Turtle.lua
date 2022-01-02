turtle.select(1)
rednet.open("right")


-- User Modifyable Varables
preSteps = 2
steps = 7
fuelSource = "minecraft:coal"
seedType = "minecraft:wheat_seeds"
cropType = "minecraft:wheat"
rednetChnl = 10
TurtleID = "Turtle 1"


-- Non-User Modifyable Varables
slot = 1
stepsTaken = 0
fuelLevel = 0
allSteps = preSteps + steps


-- Replants seeds
function RePlant()
    slot = 1
    while turtle.getItemDetail(slot).name ~= seedType do --Select Seed
        slot = slot + 1
    end
    turtle.select(slot)
    print("Seeds Selected")
    turtle.place()
end


--Drop Items in buttom chest
function drop()
    slot = 1
    while slot ~= 17 do
        turtle.select(slot)
        turtle.dropDown()
        slot = slot + 1
    end
    slot = 1
    turtle.select(slot)
end


--Check if more fuel is needed
function checkFuel()
    fuelLevel = turtle.getFuelLevel()
    slot = 1
    while fuelLevel < allSteps do
        fuelLevel = turtle.getFuelLevel()
        turtle.suckUp(1)
        while turtle.getItemDetail(slot).name ~= fuelSource do --Select fuelSource
            slot = slot + 1
        end
        turtle.select(slot)
        turtle.refuel()
    
    
    end
end



--Check if item infrount is wheat
function checkGrowth()
    if (Itemdata.name == cropType) then
        print("Block Infront")
        if (Itemdata.metadata == 7) then
            print("Full Grown")
            turtle.dig()
            rednet.send(rednetChnl, TurtleID.." harvested a crop")
            RePlant()
        end
    end
end



--Main Loop
while 1 == 1 do
    checkFuel()
    while preSteps ~= stepsTaken do
        turtle.forward()
        stepsTaken = stepsTaken + 1
    end
    stepsTaken = 0
    while steps ~= stepsTaken do
        print("Moving")
        turtle.forward()
        turtle.turnLeft()
        isblock, Itemdata = turtle.inspect()
        checkGrowth()
        turtle.turnRight()
        stepsTaken = stepsTaken + 1
    end

    turtle.turnLeft()
    turtle.turnLeft()
    stepsTaken = 0

    while allSteps ~= stepsTaken do
        turtle.forward()
        stepsTaken = stepsTaken + 1
    end
        turtle.turnLeft()
        turtle.turnLeft()
        stepsTaken = 0
        drop()
        os.sleep(300)
    end