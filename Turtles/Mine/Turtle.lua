-- Varables
fuel = turtle.getFuelLevel()
stepsTaken = 0
xSteps = 16
xStepsTaken = 0
ySteps = 16
yStepsTaken = 0
allSteps = ySteps * 2 + xSteps * 2

function Mine()
    turtle.dig()
    turtle.digUp()
    turtle.digDown()
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
end






while 1 == 1 do
    while fuel < allSteps do
        print("Not Enough Fuel")
        a = fuel - allSteps
        b = math.floor(a / 80)
        print(b)
        print("more coal needed")
        turtle.refuel()
        fuel = turtle.getFuelLevel()
        term.clear()
    
    end
    while xStepsTaken ~= xSteps do
        turtle.forward()
        Mine()
        xStepsTaken = xStepsTaken + 1
    end
    turtle.turnRight()
    xStepsTaken = 0
    while yStepsTaken ~= ySteps do
        turtle.forward()
        Mine()
        yStepsTaken = yStepsTaken + 1
    end
    turtle.turnRight()
    yStepsTaken = 0
end
