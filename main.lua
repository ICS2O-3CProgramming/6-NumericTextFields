--------------------------------------------------------------------------------------------
-- Title: Numeric Textfield
-- Name: Your Name
-- Course: ICS2O/3C
-- What does this program do?
---------------------------------------------------------------------------------------------

-- hide the status bar
--*** INSERT CODE TO HIDE THE STATUS BAR

-- sets the background colour
--*** INSERT CODE TO CHANGE THE BACKGROUND COLOUR

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

--*** ADD LOCAL VARIABLE FOR: INCORRECT OBJECT, POINTS OBJECT, POINTS


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	--*** ADD A COMMENT FOR THE TWO LINES BELOW
    --***CHANGE THE CODE TO USE NUMBERS BETWEEN 0 AND 10
	randomNumber1 = math.random(0, 4)
	randomNumber2 = math.random(0, 4) 

    --*** ADD CODE SO THAT THE OPERATION VARIES RANDOMLY BETWEEN ADDITION, SUBTRACTION 
    --*** AND MULTIPLICATION

    -- calculate the correct answer
	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 

end

local function HideCorrect()
    --*** CHANGE THE CORRECT OBJECT TO BE INVISIBLE
	correctObject.isVisible = true

    -- call the function that asks the question
	AskQuestion()
end

local function NumericFieldListener( event )

    -- User begins editing "numericField"
    if (event.phase == "began") then
        
        --clear text field
        event.target.text = ""

    elseif (event.phase == "submitted") then

        -- when the answer is submitted (enter key is pressed) set user input to user's answer
        userAnswer = tonumber(event.target.text)  

        -- if the users answer and the correct answer are the same:
        if (userAnswer == correctAnswer) then
        	correctObject.isVisible = true

            --*** ADD CODE THAT KEEPS TRACK OF THE NUMBER OF POINTS CORRECT AND DISPLAYS THIS IN 
            --*** A TEXT OBJECT

            -- call the HideCorrect function after 2 seconds
        	timer.performWithDelay(2000, HideCorrect)       	               
        	
        end 
    end
end

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )

--*** INSERT CODE TO CHANGE THE COLOUR OF THE TEXT OBJECT TO A DIFFERENT COLOUR


-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )

--*** INSERT CODE TO CHANGE THE COLOUR OF THE TEXT OBJECT TO A DIFFERENT COLOUR

--*** MAKE THE CORRECT OBJECT INVISIBLE
correctObject.isVisible = true

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()



