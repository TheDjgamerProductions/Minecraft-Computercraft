
-- Varables
preSteps = 2
steps = 7
slot = 1
stepsTaken = 0



function RePlant()
    slot = 1
    while turtle.getItemDetail(slot).name ~= "minecraft:wheat_seeds" do --Select Seed
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


--Main Loop
while 1 == 1 do
while steps ~= stepsTaken do
    print("Moving")
    turtle.forward()
    turtle.turnLeft()
    isblock, Itemdata = turtle.inspect()
    if (Itemdata.name == "minecraft:wheat") then
        print("Block Infront")
        if (Itemdata.metadata == 7) then
            print("Full Grown")
            turtle.dig()
            RePlant()
        end
    end
    turtle.turnRight()
    stepsTaken = stepsTaken + 1
 end

 turtle.turnLeft()
 turtle.turnLeft()
 stepsTaken = 0

 while steps ~= stepsTaken do
    turtle.forward()
    stepsTaken = stepsTaken + 1
end
    turtle.turnLeft()
    turtle.turnLeft()
    stepsTaken = 0
    drop()
    os.sleep(300)
end