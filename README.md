# NASCAR-Fuel-Strategy-Calculator---MATLAB
This program, called the Fuel Strategy Calculator, helps NASCAR race teams make smart, real-time decisions about fuel management during a race. By entering details like the current lap, total race laps, fuel tank capacity, current fuel level, and average fuel use per lap the calculator simulates the race one lap at a time to figure out whether the car can make it to the finish without another pit stop. It then gives a clear recommendation regarding whether a pit stop is needed and, if so, when the best time to make that stop would be.
In the world of motorsports, where a single call can mean the difference between victory and defeat, this tool has real, practical value. It helps race strategists and engineers cut down on pit time, avoid running out of fuel, and get the most out of every lap. The calculator provides helpful details such as how many laps the car can go on with its current fuel, how much fuel should be added at the next stop, and a quick summary of the overall fuel situation. With that information, teams can make more confident and strategic decisions, something that’s essential in the high-pressure environment of modern racing.

•	User Input - The program starts by asking the user for five key details like the current lap, total laps in the race, fuel tank capacity, current fuel level, and average fuel use per lap. 
These numbers serve as the foundation for all the calculations that follow.

•	Loop – A while loop runs to simulate the race lap by lap. It keeps going as long as there’s enough fuel for another lap and the race isn’t finished yet. With each loop, the program subtracts the fuel used and adds one to the lap count, representing what happens in a real race

•	Decision Structure - After the loop, an if-else statement determines what happens next. If the remaining fuel isn’t enough for another lap, the program tells the user that a pit stop will be needed and shows how many laps are left. If there’s enough fuel, it confirms that the car can make it to the end without stopping.


•	Output/Display - Finally, the program uses the fprintf command to display all the results. It shows the inputs the user entered, gives a clear recommendation about whether to pit or not, and summarizes the entire fuel strategy in an readable format.
