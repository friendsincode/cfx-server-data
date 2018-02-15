msgTime = 0



RequestStreamedTextureDict("fiveM_VehicleTextures")

--[[*************************************************************]]
------------------------------------------------------------------
--------------------------basic functions-------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end
function enableMouse()
   ShowCursorThisFrame()
    mouseX = GetControlNormal(2, 239)
     mouseY = GetControlNormal(2, 240)
end	
function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 1, 1, -1)
end
--[[*************************************************************
------------------------------------------------------------------
--------------------------local variables-------------------------
----------------------------from the DB---------------------------
                       these variables get set 
					      by the dataBase
			     or the script sets the dataBase values

*************************************************************--]]



local Department = {["Department"] = "lspd", ["menuRGB"] = {['r'] = 255, ['g'] = 144, ['b'] = 30}}
local OwnedGaragesList = {"311 paleto ave", "255 high st"}
local OwnedHomesList = {"311 paleto ave", "255 high st"}
local OwnedVehList = {"dukes", "gauntlet2"}
local Garage_1_OccupiedSlots = { {['STATE'] = true, ["MODEL"] = {["MODELDICT"] = "fiveM_VehicleTextures", ["MODEL"] = "adder"}}, {['STATE'] = true, ["MODEL"] = {["MODELDICT"] = "fiveM_VehicleTextures", ["MODEL"] = "alpha"}}, {['STATE'] = false, ["MODEL"] = {["MODELDICT"] = "", ["MODEL"] = ""}}}
local Garage_2_OccupiedSlots = { {['STATE'] = false, ["MODEL"] = {["MODELDICT"] = "", ["MODEL"] = ""}}, {['STATE'] = false, ["MODEL"] = {["MODELDICT"] = "", ["MODEL"] = ""}}, {['STATE'] = false, ["MODEL"] = {["MODELDICT"] = "", ["MODEL"] = ""}}}

local Garage_1 = {['HOVER'] = false, ['OWNED'] = true, ['LOCATION'] = OwnedGaragesList[1],["SLOT_1"] = OwnedVehList[1], ["SLOT_2"] = "", ["SLOT_3"] = "", ["SLOT_4"] = ""}
local Garage_2 = {['HOVER'] = false, ['OWNED'] = true, ['LOCATION'] = OwnedGaragesList[2], ["SLOT_1"] = OwnedVehList[2], ["SLOT_2"] = "", ["SLOT_3"] = "", ["SLOT_4"] = ""} 
local OwnedHomes = #OwnedHomesList
local OwnedGarages = #OwnedGaragesList


--[[*************************************************************
------------------------------------------------------------------
--------------------------local variables-------------------------
------------------------------------------------------------------
                these variables are for the script 
			     some will change others will not 
				     they are used *locally* 
*************************************************************--]]

local ShowPersonalInventory = false
local ShowPoliceInventory = false
local IsOnDuty = false
local DisPlayErrorMsg = false
local options = {
    x = 0.111,
    y = 0.2,
    width = 0.22,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Citizen menu",
    menu_subtitle = "main menu",
    color_r = 30,
    color_g = 144,
    color_b = 255,
}

-----------------------------------------------------------------------------------------
-----------------------------------texture locations-------------------------------------
-----------------------------------------------------------------------------------------


--garage 1 background position and size
local Garage_1_Window = {['xPos'] = 0.377, ['yPos'] = 0.5, ['xSize'] = 0.31, ['ySize'] = 0.8}
local Garage_2_Window = {['xPos'] = 0.700, ['yPos'] = 0.5, ['xSize'] = 0.31, ['ySize'] = 0.8}

--garage 1 slot 1 position, size and Edge's of slot(for highlighing etc)
local Garage_1_Slot_1 = {['xPos'] = ((Garage_1_Window.xPos) - (Garage_1_Window.xSize / 2) + (0.1 / 2)), ['yPos'] = ((Garage_1_Window.yPos - (Garage_1_Window.ySize / 2) + (0.1 / 2)) + 0.005), ['xSize'] = (1.0), ['ySize'] = (1.0), ['leftEdge'] = (((Garage_1_Window.xPos) - (Garage_1_Window.xSize / 2) + (0.1 / 2)) + 0.003 - 0.1 /2) + 0.005, ['rightEdge'] = (((Garage_1_Window.xPos) - (Garage_1_Window.xSize / 2) + (0.1 / 2)) + 0.003 + 0.1 /2) - 0.005, ['topEdge'] = (((Garage_1_Window.yPos - (Garage_1_Window.ySize / 2) + (0.1 / 2)) + 0.005) - 0.1 / 2) - 0.005, ['bottomEdge'] = (((Garage_1_Window.yPos - (Garage_1_Window.ySize / 2) + (0.1 / 2)) + 0.005) + 0.1 / 2) - 0.005}

--garage 1 slot 2 position, size and Edge's of slot(for highlighing etc)
local Garage_1_Slot_2 = {['xPos'] = (Garage_1_Window.xPos), ['yPos'] = ((Garage_1_Window.yPos - (Garage_1_Window.ySize / 2) + (0.1 / 2)) + 0.005), ['xSize'] = (1.0), ['ySize'] = (1.0), ['leftEdge'] = (Garage_1_Window.xPos) - 0.1 / 2, ['rightEdge'] = (Garage_1_Window.xPos) + 0.1 / 2,['topEdge'] = (((Garage_1_Window.yPos - (Garage_1_Window.ySize / 2) + (0.1 / 2)) + 0.005) - 0.1 / 2) - 0.005, ['bottomEdge'] = (((Garage_1_Window.yPos - (Garage_1_Window.ySize / 2) + (0.1 / 2)) + 0.005) + 0.1 / 2) - 0.005}
--garage 1 slot 3 position, size and Edge's of slot(for highlighing etc)
local Garage_1_Slot_3 = {['xPos'] = (Garage_1_Window.xPos) + (Garage_1_Window.xSize / 2) - (0.1 / 2), ['yPos'] = ((Garage_1_Window.yPos - (Garage_1_Window.ySize / 2) + (0.1 / 2)) + 0.005), ['xSize'] = (0.1), ['ySize'] = (0.1), ['leftEdge'] = ((Garage_1_Window.xPos) + (Garage_1_Window.xSize / 2) - (0.1 / 2)) - 0.1 / 2, ['rightEdge'] = ((Garage_1_Window.xPos) + (Garage_1_Window.xSize / 2) - (0.1 / 2)) + 0.1 / 2,['topEdge'] = (((Garage_1_Window.yPos - (Garage_1_Window.ySize / 2) + (0.1 / 2)) + 0.005) - 0.1 / 2) - 0.005, ['bottomEdge'] = (((Garage_1_Window.yPos - (Garage_1_Window.ySize / 2) + (0.1 / 2)) + 0.005) + 0.1 / 2) - 0.005}





-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

local Garage_2_Slot_1 = {['xPos'] = ((Garage_2_Window.xPos) - (Garage_2_Window.xSize / 2) + (0.1 / 2)), ['yPos'] = ((Garage_2_Window.yPos - (Garage_2_Window.ySize / 2) + (0.1 / 2)) + 0.005), ['xSize'] = (1.0), ['ySize'] = (1.0), ['leftEdge'] = (((Garage_2_Window.xPos) - (Garage_2_Window.xSize / 2) + (0.1 / 2)) + 0.003 - 0.1 /2) + 0.005, ['rightEdge'] = (((Garage_2_Window.xPos) - (Garage_2_Window.xSize / 2) + (0.1 / 2)) + 0.003 + 0.1 /2) - 0.005, ['topEdge'] = (((Garage_2_Window.yPos - (Garage_2_Window.ySize / 2) + (0.1 / 2)) + 0.005) - 0.1 / 2) - 0.005, ['bottomEdge'] = (((Garage_2_Window.yPos - (Garage_2_Window.ySize / 2) + (0.1 / 2)) + 0.005) + 0.1 / 2) - 0.005}

local Garage_2_Slot_2 = {['xPos'] = (Garage_2_Window.xPos), ['yPos'] = ((Garage_2_Window.yPos - (Garage_2_Window.ySize / 2) + (0.1 / 2)) + 0.005), ['xSize'] = (1.0), ['ySize'] = (1.0), ['leftEdge'] = (Garage_2_Window.xPos) - 0.1 / 2, ['rightEdge'] = (Garage_2_Window.xPos) + 0.1 / 2,['topEdge'] = (((Garage_2_Window.yPos - (Garage_2_Window.ySize / 2) + (0.1 / 2)) + 0.005) - 0.1 / 2) - 0.005, ['bottomEdge'] = (((Garage_2_Window.yPos - (Garage_2_Window.ySize / 2) + (0.1 / 2)) + 0.005) + 0.1 / 2) - 0.005}

local Garage_2_Slot_3 = {['xPos'] = (Garage_2_Window.xPos) + (Garage_2_Window.xSize / 2) - (0.1 / 2), ['yPos'] = ((Garage_2_Window.yPos - (Garage_2_Window.ySize / 2) + (0.1 / 2)) + 0.005), ['xSize'] = (0.1), ['ySize'] = (0.1), ['leftEdge'] = ((Garage_2_Window.xPos) + (Garage_2_Window.xSize / 2) - (0.1 / 2)) - 0.1 / 2, ['rightEdge'] = ((Garage_2_Window.xPos) + (Garage_2_Window.xSize / 2) - (0.1 / 2)) + 0.1 / 2,['topEdge'] = (((Garage_2_Window.yPos - (Garage_2_Window.ySize / 2) + (0.1 / 2)) + 0.005) - 0.1 / 2) - 0.005, ['bottomEdge'] = (((Garage_2_Window.yPos - (Garage_2_Window.ySize / 2) + (0.1 / 2)) + 0.005) + 0.1 / 2) - 0.005}



local Vehicle_1 = {['xPos'] = Garage_1_Slot_1['xPos'], ['yPos'] = Garage_1_Slot_1['yPos']}
local Vehicle_2 = {['xPos'] = Garage_2_Slot_1['xPos'], ['yPos'] = Garage_2_Slot_1['yPos']}




--[[*************************************************************]]
------------------------------------------------------------------
------------------------advanced functions------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function GarageMouseCheck()
 if ((mouseX <= Garage_1_Window.xPos - Garage_1_Window.xSize / 2) and (mouseX >= Garage_1_Window.xPos + Garage_1_Window.xSize / 2)) and ((mouseY <= Garage_1_Window.yPos - Garage_1_Window.ySize / 2) and (mouseY >= Garage_1_Window.yPos + Garage_1_Window.ySize / 2)) then
  Garage_1.HOVER = true
  else
  Garage_1.HOVER = false
 end
  if ((mouseX <= Garage_2_Window.xPos - Garage_2_Window.xSize / 2) and (mouseX >= Garage_2_Window.xPos + Garage_2_Window.xSize / 2)) and ((mouseY <= Garage_2_Window.yPos - Garage_2_Window.ySize / 2) and (mouseY >= Garage_2_Window.yPos + Garage_2_Window.ySize / 2)) then
  Garage_2.HOVER = true
  else
  Garage_2.HOVER = false
 end
end


function MoveVehicle()
 
end


function isPlayerInAVehicle()
 local playerPed = GetPlayerPed()
 if IsPedInAnyVehicle(playerPed) then
  IsPlayerInAVehicle = true
 else
  IsPlayerInAVehicle = false
 end
end

function ErrorMsg()
  
 if DisPlayErrorMsg then
  while msgTime < DisplayErrorMsgTime do
   Citizen.Wait(0)
    DrawSprite("shared", "bggradient", 0.5, 0.5, 1.1, 1.1, 0.0, 0, 0, 0, 200)
     DrawSprite("shared", "bggradient", 0.5, 0.5, 0.2, 0.2, 0.0, 0, 0, 0, 200)
	  drawTxt("error", 2, 1, 0.5, 0.5 - 0.2 / 2 + 0.002, 0.50, 255, 0, 0, 255)
	   drawTxt(errorMsg, 2, 1, 0.5, 0.5 , 0.30, 255, 255, 255, 255)
	  
      msgTime = msgTime + 1
  end
  if msgTime >= 20 then
   DisPlayErrorMsg = false
  end
 end
end

function SetErrorMsg(errorMsgTime, Msg)
msgTime = 0 
 DisplayErrorMsgTime = errorMsgTime
  errorMsg = Msg
   
end

function showErrorMsg()
 DisPlayErrorMsg = true
end
--[[*************************************************************]]
------------------------------------------------------------------
------------------------citizen main menu-------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function CitMain()
    ShowPersonalInventory = false
	HideStuff = false
	ownedHomesPage = false
	ownedGaragesPage = false
	ManageYourGarages = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!") 
    options.menu_subtitle = "~o~main menu"
	options.menu_title = "Citizen menu"
	if not IsOnDuty then
	 options.color_r = 30
	 options.color_g = 144
	 options.color_b = 255
	end
    ClearMenu()
     Menu.addButton("~y~your inventory ~b~menu", "personalInventory", nil)
	 Menu.addButton("~y~character ~b~menu", "characterMenu", nil)	
	 Menu.addButton("~y~owned properties ~b~menu", "propertiesMenu", nil)
	 Menu.addButton("~r~emergency ~b~menu", "CitizenEmergencyMenu", nil)
	if not IsOnDuty then
	 Menu.addButton("~r~\'testing\'toggle on duty", "toggleOnDuty", nil)
	end
	if IsOnDuty then
	 Menu.addButton("~r~return to police ~b~menu", "PoliceMain", nil)
	end

	
end

--[[*************************************************************]]
------------------------------------------------------------------
-------------------citizen Emergency menu-------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function CitizenEmergencyMenu()
 
 DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
 Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
 ClearMenu()
 Menu.addButton("~r~REPORT A CRIME", "CitizenReportCrime", nil)
 Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end

function CitizenReportCrime()
 
 DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
 Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
 ClearMenu()
 Menu.addButton("~r~report a murder(4 stars)", "saveCurrentPedSlot_1", nil)
 Menu.addButton("~r~report a stolen vehicle(1 star)", "saveCurrentPedSlot_1", nil)
 Menu.addButton("~r~report a hit and run(2 stars)", "saveCurrentPedSlot_1", nil)
 Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end
--[[*************************************************************]]
------------------------------------------------------------------
-------------------citizen transfer items menu--------------------
------------------------------------------------------------------
--[[*************************************************************]]
function transferItemsIntoVehicle()
 HideStuff = not HideStuff
 
 DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
 Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
 ClearMenu()
 Menu.addButton("~y~back to personal inventory ~b~menu", "personalInventory", nil)
 Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end
--[[*************************************************************]]
------------------------------------------------------------------
-------------------citizen Inventory menu-------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function personalInventory()
     HideStuff = false
     ShowPersonalInventory = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
     
    ClearMenu()
	
	if IsPlayerInAVehicle and not HideStuff then
	 Menu.addButton("~y~hide things in this vehicle ~b~menu", "transferItemsIntoVehicle", nil)
	end
    Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end

--[[*************************************************************]]
------------------------------------------------------------------
-------------------citizen character menu-------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function characterMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
     
    ClearMenu()
    Menu.addButton("~y~save current ped", "saveCurrentPed", nil)
	Menu.addButton("~y~load a saved ped", "LoadPed", nil)
	
	
    Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end
function saveCurrentPed()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
     
    ClearMenu()
    Menu.addButton("~y~save ped in slot 1 ", "saveCurrentPedSlot_1", nil)
	Menu.addButton("~y~save ped in slot 2 ", "saveCurrentPedSlot_2", nil)
	Menu.addButton("~y~save ped in slot 3 ", "saveCurrentPedSlot_3", nil)
    Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end
function LoadPed()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
     
    ClearMenu()
    Menu.addButton("~y~load saved ped in slot 1 ", "saveCurrentPedSlot_1", nil)
	Menu.addButton("~y~load saved ped in slot 2 ", "saveCurrentPedSlot_2", nil)
	Menu.addButton("~y~load saved ped in slot 3 ", "saveCurrentPedSlot_3", nil)
    Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end
function saveCurrentPedSlot_1()
 SetErrorMsg(50, "this dont do anything yet")
 showErrorMsg()
end
function saveCurrentPedSlot_2()
 SetErrorMsg(50, "this dont do anything yet")
 showErrorMsg()
end
function saveCurrentPedSlot_3()
 SetErrorMsg(50, "this dont do anything yet")
 showErrorMsg()
end

--[[*************************************************************]]
------------------------------------------------------------------
-------------------citizen properties menu-------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function propertiesMenu()
    
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
	ClearMenu()
	if OwnedHomes == 0 then
     Menu.addButton("~y~homes:     ~r~"..OwnedHomes, "ListOwnedHomes", nil)
	else 
	 Menu.addButton("~y~homes:     ~g~"..OwnedHomes, "ListOwnedHomes", nil)
	end
	if OwnedGarages == 0 then
     Menu.addButton("~y~garages:     ~r~"..OwnedGarages, "ListOwnedGarages", nil)
	else 
	 Menu.addButton("~y~garages:     ~g~"..OwnedGarages, "ListOwnedGarages", nil)
	end
    Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end
--[[*************************************************************]]
------------------------------------------------------------------
-------------------citizen owned homes list-----------------------
------------------------------------------------------------------
--[[*************************************************************]]
function ListOwnedHomes()
    ownedHomesPage = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")   
    ClearMenu()

    Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end
--[[*************************************************************]]
------------------------------------------------------------------
-------------------citizen owned garages list---------------------
------------------------------------------------------------------
--[[*************************************************************]]
function ListOwnedGarages()
    ownedGaragesPage = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")   
    ClearMenu()
	Menu.addButton("~g~manage garages", "ManageGarages", nil)
    Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end
function ManageGarages()
 ownedGaragesPage = false
 ManageYourGarages = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")   
    ClearMenu()
    Menu.addButton("~g~BACK TO MAIN MENU", "CitMain", nil)
end




--[[*************************************************************]]
------------------------------------------------------------------
------------------------police main menu-------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function PoliceMain()

    if Department['Department'] == "lspd" then
      ShowPoliceInventory = false
     DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	 Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
	 options.menu_title = "~o~lspd menu"
     options.menu_subtitle = "~o~main menu"
	 options.color_r = Department['menuRGB']['r']
	 options.color_g = Department['menuRGB']['g']
	 options.color_b = Department['menuRGB']['b']
     ClearMenu()
     Menu.addButton("~y~inventory ~b~menu", "policeInventory", nil)
	 Menu.addButton("~y~Citizen ~b~menu", "CitMain", nil)
	 Menu.addButton("~r~\'testing\'toggle on duty", "toggleOnDuty", nil)
	end
    if Department['Department'] == "sheriff" then
      ShowPoliceInventory = false
     DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	 Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
	 options.menu_title = "~o~sheriff menu"
     options.menu_subtitle = "~o~main menu"
	 options.color_r = 255
	 options.color_g = 134
	 options.color_b = 20
     ClearMenu()
     Menu.addButton("~y~inventory ~b~menu", "policeInventory", nil)
	 Menu.addButton("~y~Citizen ~b~menu", "CitMain", nil)
	 Menu.addButton("~r~\'testing\'toggle on duty", "toggleOnDuty", nil)
	end
    if Department['Department'] == "stateTrooper" then
      ShowPoliceInventory = false
     DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	 Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
	 options.menu_title = "~o~State Trooper menu"
     options.menu_subtitle = "~o~main menu"
	 options.color_r = 255
	 options.color_g = 124
	 options.color_b = 10
     ClearMenu()
     Menu.addButton("~y~inventory ~b~menu", "policeInventory", nil)
	 Menu.addButton("~y~uniform change ~b~menu", "ToggleWorkClothes", nil)
	 Menu.addButton("~y~toggle on duty", "toggleOnDuty", nil)
	 Menu.addButton("~y~Citizen ~b~menu", "CitMain", nil)
	end
	
end

function ToggleWorkClothes()
     DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	 Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
	 options.menu_title = Department.."~b~ menu"
     options.menu_subtitle = "~o~main menu"
	 options.color_r = 255
	 options.color_g = 124
	 options.color_b = 10
     ClearMenu()
	 
	 
	 
	 Menu.addButton("~y~Citizen ~b~menu", "CitMain", nil)

end


function policeInventory()
     ShowPoliceInventory = not ShowPoliceInventory
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
     
    ClearMenu()
	
    Menu.addButton("~g~BACK TO MAIN MENU", "PoliceMain", nil)
end

function toggleOnDuty()
 Menu.hidden = not Menu.hidden
 IsOnDuty = not IsOnDuty

end 

--------------------------------------------------------------------
--******************************************************************
---------------------------while loop-------------------------------
--******************************************************************
--------------------------------------------------------------------

u = 1
Citizen.CreateThread(function()	

  while true do
     Citizen.Wait(0)
	 isPlayerInAVehicle()
	 ErrorMsg()
	local NoOwnedHomesPosX = 0.5
	local NoOwnedHomesPosY = 0.5
	if OwnedHomes == 0 and ownedHomesPage then
	 DrawSprite("shared", "bggradient", NoOwnedHomesPosX, NoOwnedHomesPosY , options.width, 0.15, 0.0,0, 0, 0, 175)
	 drawTxt("You dont own any homes", 1, 1, NoOwnedHomesPosX, NoOwnedHomesPosY, 0.5, 255, 0, 0, 255)

	end
	if OwnedGarages == 0 and ownedGaragesPage then
	 DrawSprite("shared", "bggradient", NoOwnedHomesPosX, NoOwnedHomesPosY , options.width, 0.15, 0.0,0, 0, 0, 175)
	 drawTxt("You dont own any garages", 1, 1, NoOwnedHomesPosX, NoOwnedHomesPosY, 0.5, 255, 0, 0, 255)

	end
	if OwnedHomes > 0 and ownedHomesPage then
	 DrawSprite("shared", "bggradient", NoOwnedHomesPosX, NoOwnedHomesPosY , options.width, 0.15, 0.0,0, 0, 0, 175)
	 drawTxt("3 homes Maximum", 1, 1, NoOwnedHomesPosX , NoOwnedHomesPosY - 0.14 /2, 0.5, 255, 6, 2, 255)
	 drawTxt("home 1: ", 1, 1, ((NoOwnedHomesPosX - options.width / 2) + 0.023), (NoOwnedHomesPosY - 0.15 / 2 + 0.043), 0.5, 255, 255, 255, 255)
	 drawTxt(OwnedHomesList[1], 1, 1, ((NoOwnedHomesPosX + options.width / 2) - 0.053), (NoOwnedHomesPosY - 0.15 / 2 + 0.043), 0.5, 10, 255, 10, 255)
     drawTxt("home 2: ", 1, 1, ((NoOwnedHomesPosX - options.width / 2) + 0.023), (NoOwnedHomesPosY - 0.15 / 2 + 0.073), 0.5, 255, 255, 255, 255)
	 drawTxt(OwnedHomesList[2], 1, 1, ((NoOwnedHomesPosX + options.width / 2) - 0.053), (NoOwnedHomesPosY - 0.15 / 2 + 0.073), 0.5, 10, 255, 10, 255)
	 drawTxt("home 3: ", 1, 1, ((NoOwnedHomesPosX - options.width / 2) + 0.023), (NoOwnedHomesPosY - 0.15 / 2 + 0.103), 0.5, 255, 255, 255, 255)
	 drawTxt(OwnedHomesList[3], 1, 1, ((NoOwnedHomesPosX + options.width / 2) - 0.053), (NoOwnedHomesPosY - 0.15 / 2 + 0.103), 0.5, 10, 255, 10, 255)
	end
	
	if OwnedGarages > 0 and ownedGaragesPage then
	 DrawSprite("shared", "bggradient", NoOwnedHomesPosX, NoOwnedHomesPosY , options.width, 0.15, 0.0,0, 0, 0, 175)
	 drawTxt("2 garage's Maximum", 1, 1, NoOwnedHomesPosX , NoOwnedHomesPosY - 0.14 /2, 0.5, 255, 6, 2, 255)
	 drawTxt("garage 1: ", 1, 1, ((NoOwnedHomesPosX - options.width / 2) + 0.033), (NoOwnedHomesPosY - 0.15 / 2 + 0.043), 0.5, 255, 255, 255, 255)
	 drawTxt(OwnedGaragesList[1], 1, 1, ((NoOwnedHomesPosX + options.width / 2) - 0.053), (NoOwnedHomesPosY - 0.15 / 2 + 0.043), 0.5, 10, 255, 10, 255)
     drawTxt("garage 2: ", 1, 1, ((NoOwnedHomesPosX - options.width / 2) + 0.033), (NoOwnedHomesPosY - 0.15 / 2 + 0.073), 0.5, 255, 255, 255, 255)
	 drawTxt(OwnedGaragesList[2], 1, 1, ((NoOwnedHomesPosX + options.width / 2) - 0.053), (NoOwnedHomesPosY - 0.15 / 2 + 0.073), 0.5, 10, 255, 10, 255)
	end
	if ManageYourGarages then
	 enableMouse()
	 if OwnedGarages > 1 then
----------------------------------------------------------------------------------------------	  
---------------------------garage 1 MAIN------------------------------------------------------
----------------------------------------------------------------------------------------------
	  DrawSprite("shared", "bggradient", Garage_1_Window.xPos, Garage_1_Window.yPos, Garage_1_Window.xSize + 0.009, Garage_1_Window.ySize, 0.0,0, 0, 0, 175)
	  drawTxt(OwnedGaragesList[1], 4, 1, Garage_1_Window.xPos, Garage_1_Window.yPos - Garage_1_Window.ySize / 2 - 0.07, 0.70, 255, 255, 255, 255)
----------------------------------------------------------------------------------------------	  
---------------------------garage 1 slot 1----------------------------------------------------
----------------------------------------------------------------------------------------------
	  DrawSprite("shared", "bggradient", Garage_1_Slot_1.xPos, Garage_1_Slot_1.yPos, 0.1, 0.1, 0.0, 0, 0, 0, 150)	  
	 if not Garage_1_OccupiedSlots[1]["STATE"] then
	  drawTxt("slot \n1", 2, 1, Garage_1_Slot_1.xPos, Garage_1_Slot_1.yPos - 0.04, 0.50, 255, 255, 255, 68)
	 end
	   if (mouseX >= Garage_1_Slot_1.leftEdge and mouseX <= Garage_1_Slot_1.rightEdge) and (mouseY >= Garage_1_Slot_1.topEdge and mouseY <= Garage_1_Slot_1.bottomEdge) then
	    Gar_1_Slot_1 = true
	    DrawSprite("shared", "bggradient", Garage_1_Slot_1.xPos, Garage_1_Slot_1.yPos, 0.1, 0.1, 0.0, 255, 0, 255, 150)
	   else
	    Gar_1_Slot_1 = false
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 1 slot 2----------------------------------------------------
----------------------------------------------------------------------------------------------
	  DrawSprite("shared", "bggradient", Garage_1_Slot_2.xPos, Garage_1_Slot_2.yPos, 0.1, 0.1, 0.0, 0, 0, 0, 150)
	 if not Garage_1_OccupiedSlots[2]["STATE"] then 
	  drawTxt("slot \n2", 2, 1, Garage_1_Slot_2.xPos, Garage_1_Slot_2.yPos - 0.04, 0.50, 255, 255, 255, 68)
	 end
	   if (mouseX >= Garage_1_Slot_2.leftEdge and mouseX <= Garage_1_Slot_2.rightEdge) and (mouseY >= Garage_1_Slot_2.topEdge and mouseY <= Garage_1_Slot_2.bottomEdge) then
	    Gar_1_Slot_2 = true
	    DrawSprite("shared", "bggradient", Garage_1_Slot_2.xPos, Garage_1_Slot_2.yPos, 0.1, 0.1, 0.0, 255, 0, 255, 150)
	   else
	    Gar_1_Slot_2 = false
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 1 slot 3----------------------------------------------------
----------------------------------------------------------------------------------------------
	  DrawSprite("shared", "bggradient", Garage_1_Slot_3.xPos, Garage_1_Slot_3.yPos, 0.1, 0.1, 0.0, 0, 0, 0, 150)
	 if not Garage_1_OccupiedSlots[3]["STATE"] then 
	  drawTxt("slot \n3", 2, 1, Garage_1_Slot_3.xPos, Garage_1_Slot_3.yPos - 0.04, 0.50, 255, 255, 255, 68)
	 end
	   if (mouseX >= Garage_1_Slot_3.leftEdge and mouseX <= Garage_1_Slot_3.rightEdge) and (mouseY >= Garage_1_Slot_3.topEdge and mouseY <= Garage_1_Slot_3.bottomEdge) then
	    Gar_1_Slot_3 = true
	    DrawSprite("shared", "bggradient", Garage_1_Slot_3.xPos, Garage_1_Slot_3.yPos, 0.1, 0.1, 0.0, 255, 0, 255, 150)
	   else
	    Gar_1_Slot_3 = false
	   end
	   
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 MAIN------------------------------------------------------
----------------------------------------------------------------------------------------------
	  DrawSprite("shared", "bggradient", Garage_2_Window.xPos, Garage_2_Window.yPos, Garage_1_Window.xSize + 0.009, Garage_1_Window.ySize, 0.0,0, 0, 0, 175)
      drawTxt(OwnedGaragesList[2], 4, 1, Garage_2_Window.xPos, Garage_2_Window.yPos - Garage_2_Window.ySize / 2 - 0.07, 0.70, 255, 255, 255, 255)
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 slot 1----------------------------------------------------
----------------------------------------------------------------------------------------------
	 
	  DrawSprite("shared", "bggradient", Garage_2_Slot_1.xPos, Garage_2_Slot_1.yPos, 0.1, 0.1, 0.0, 0, 0, 0, 150)  
	 if not Garage_2_OccupiedSlots[1]["STATE"] then
	  drawTxt("slot \n1", 2, 1, Garage_2_Slot_1.xPos, Garage_2_Slot_1.yPos - 0.04, 0.50, 255, 255, 255, 68)
	 end
	   if (mouseX >= Garage_2_Slot_1.leftEdge and mouseX <= Garage_2_Slot_1.rightEdge) and (mouseY >= Garage_2_Slot_1.topEdge and mouseY <= Garage_2_Slot_1.bottomEdge) then
	    Gar_2_Slot_1 = true
	    DrawSprite("shared", "bggradient", Garage_2_Slot_1.xPos, Garage_2_Slot_1.yPos, 0.1, 0.1, 0.0, 255, 0, 255, 150)
	   else
	    Gar_2_Slot_1 = false
	   end	 
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 slot 2----------------------------------------------------
----------------------------------------------------------------------------------------------
	  DrawSprite("shared", "bggradient", Garage_2_Slot_2.xPos, Garage_2_Slot_2.yPos, 0.1, 0.1, 0.0, 0, 0, 0, 150)
	 if not Garage_2_OccupiedSlots[2]["STATE"] then 
	  drawTxt("slot \n2", 2, 1, Garage_2_Slot_2.xPos, Garage_2_Slot_2.yPos - 0.04, 0.50, 255, 255, 255, 68)
	 end
	   if (mouseX >= Garage_2_Slot_2.leftEdge and mouseX <= Garage_2_Slot_2.rightEdge) and (mouseY >= Garage_2_Slot_2.topEdge and mouseY <= Garage_2_Slot_2.bottomEdge) then
	    Gar_2_Slot_2 = true
	    DrawSprite("shared", "bggradient", Garage_2_Slot_2.xPos, Garage_2_Slot_2.yPos, 0.1, 0.1, 0.0, 255, 0, 255, 150)
	   else
	    Gar_2_Slot_2 = false
	   end	 
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 slot 3----------------------------------------------------
----------------------------------------------------------------------------------------------
	  DrawSprite("shared", "bggradient", Garage_2_Slot_3.xPos, Garage_2_Slot_3.yPos, 0.1, 0.1, 0.0, 0, 0, 0, 150)
	 if not Garage_2_OccupiedSlots[3]["STATE"] then 
	  drawTxt("slot \n3", 2, 1, Garage_2_Slot_3.xPos, Garage_2_Slot_3.yPos - 0.04, 0.50, 255, 255, 255, 68)
	 end
	   if (mouseX >= Garage_2_Slot_3.leftEdge and mouseX <= Garage_2_Slot_3.rightEdge) and (mouseY >= Garage_2_Slot_3.topEdge and mouseY <= Garage_2_Slot_3.bottomEdge) then
	    Gar_2_Slot_3 = true
	    DrawSprite("shared", "bggradient", Garage_2_Slot_3.xPos, Garage_2_Slot_3.yPos, 0.1, 0.1, 0.0, 255, 0, 255, 150)
	   else
	    Gar_2_Slot_3 = false
	   end

	  


----------------------------------------------------------------------------------------------	  
---------------------------garage 1 slot 1----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Gar_1_Slot_1 and Garage_1_OccupiedSlots[1]["STATE"] then
	    if IsControlJustPressed(2, 237) then
		 MoveTexture = true
		end
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 1 slot 2----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Gar_1_Slot_2 and Garage_1_OccupiedSlots[2]["STATE"] then
	    if IsControlJustPressed(2, 237) then
		 MoveTexture = true
		end
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 1 slot 3----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Gar_1_Slot_3 and Garage_1_OccupiedSlots[3]["STATE"] then
	    if IsControlJustPressed(2, 237) then
		 MoveTexture = true
		end
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 slot 1----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Gar_2_Slot_1 and Garage_2_OccupiedSlots[1]["STATE"] then
	    if IsControlJustPressed(2, 237) then
		 MoveTexture = true
		end
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 slot 2----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Gar_2_Slot_2 and Garage_2_OccupiedSlots[2]["STATE"] then
	    if IsControlJustPressed(2, 237) then
		 MoveTexture = true
		end
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 slot 3----------------------------------------------------
----------------------------------------------------------------------------------------------	   
	   if Gar_2_Slot_3 and Garage_2_OccupiedSlots[3]["STATE"] then
	    if IsControlJustPressed(2, 237) then
		 MoveTexture = true
		end
	   end
	   
----------------------------------------------------------------------------------------------	  
---------------------------garage 1 slot 1----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Garage_1_OccupiedSlots[1]["STATE"] then
	    if MoveTexture then
		
	    Vehicle_1.xPos = mouseX
		Vehicle_1.yPos = mouseY
	     if Gar_1_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_2.xPos 
			Vehicle_1.yPos = Garage_1_Slot_2.yPos
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[1]["STATE"] = false
			
			Garage_1_OccupiedSlots[2]["STATE"] = true
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_3.xPos 
			Vehicle_1.yPos = Garage_1_Slot_3.yPos
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[1]["STATE"] = false
			
			Garage_1_OccupiedSlots[3]["STATE"] = true
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_1.xPos 
			Vehicle_2.yPos = Garage_2_Slot_1.yPos
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[1]["STATE"] = false
			
			Garage_2_OccupiedSlots[1]["STATE"] = true
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_2.xPos 
			Vehicle_2.yPos = Garage_2_Slot_2.yPos
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[1]["STATE"] = false
			
			Garage_2_OccupiedSlots[2]["STATE"] = true
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_3.xPos 
			Vehicle_2.yPos = Garage_2_Slot_3.yPos
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[1]["STATE"] = false
			
			Garage_2_OccupiedSlots[3]["STATE"] = true
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
		end
	    DrawSprite(Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"], Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"], Vehicle_1.xPos, Vehicle_1.yPos, 0.1, 0.1, 0.0, 255, 255, 255, 255) 
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 1 slot 2----------------------------------------------------
----------------------------------------------------------------------------------------------	   
	   if Garage_1_OccupiedSlots[2]["STATE"] then
	    if MoveTexture then
         		
	     Vehicle_1.xPos = mouseX
		 Vehicle_1.yPos = mouseY
		 
	     if Gar_1_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_1.xPos 
			Vehicle_1.yPos = Garage_1_Slot_1.yPos
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[2]["STATE"] = false
			
			Garage_1_OccupiedSlots[1]["STATE"] = true
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_3.xPos 
			Vehicle_1.yPos = Garage_1_Slot_3.yPos
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[2]["STATE"] = false
			
			Garage_1_OccupiedSlots[3]["STATE"] = true
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_1.xPos 
			Vehicle_2.yPos = Garage_2_Slot_1.yPos
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[2]["STATE"] = false
			
			Garage_2_OccupiedSlots[1]["STATE"] = true
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_2.xPos 
			Vehicle_2.yPos = Garage_2_Slot_2.yPos
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[2]["STATE"] = false
			
			Garage_2_OccupiedSlots[2]["STATE"] = true
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_3.xPos 
			Vehicle_2.yPos = Garage_2_Slot_3.yPos
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[2]["STATE"] = false
			
			Garage_2_OccupiedSlots[3]["STATE"] = true
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end		 
		end
	    DrawSprite(Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"], Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"], Vehicle_1.xPos, Vehicle_1.yPos, 0.1, 0.1, 0.0, 255, 255, 255, 255) 
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 1 slot 3----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Garage_1_OccupiedSlots[3]["STATE"] then
	    if MoveTexture then        		
	     Vehicle_1.xPos = mouseX
		 Vehicle_1.yPos = mouseY
	     if Gar_1_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_1.xPos 
			Vehicle_1.yPos = Garage_1_Slot_1.yPos
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[3]["STATE"] = false
			
			Garage_1_OccupiedSlots[1]["STATE"] = true
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_2.xPos 
			Vehicle_1.yPos = Garage_1_Slot_2.yPos
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[3]["STATE"] = false
			
			Garage_1_OccupiedSlots[2]["STATE"] = true
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
			
		  end
	     end
	     if Gar_2_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_1.xPos 
			Vehicle_2.yPos = Garage_2_Slot_1.yPos
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[3]["STATE"] = false
			
			Garage_2_OccupiedSlots[1]["STATE"] = true
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_2.xPos 
			Vehicle_2.yPos = Garage_2_Slot_2.yPos
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[3]["STATE"] = false
			
			Garage_2_OccupiedSlots[2]["STATE"] = true
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_3.xPos 
			Vehicle_2.yPos = Garage_2_Slot_3.yPos
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_1_OccupiedSlots[3]["STATE"] = false
			
			Garage_2_OccupiedSlots[3]["STATE"] = true
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
		  end
	     end
		end
	    DrawSprite(Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"], Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"], Vehicle_1.xPos, Vehicle_1.yPos, 0.1, 0.1, 0.0, 255, 255, 255, 255) 
	   end
	   
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 slot 1----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Garage_2_OccupiedSlots[1]["STATE"] then
	    if MoveTexture then	
	    Vehicle_2.xPos = mouseX
		Vehicle_2.yPos = mouseY
	     if Gar_2_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_2.xPos 
			Vehicle_2.yPos = Garage_2_Slot_2.yPos
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[1]["STATE"] = false
			
			Garage_2_OccupiedSlots[2]["STATE"] = true
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_3.xPos 
			Vehicle_2.yPos = Garage_2_Slot_3.yPos
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[1]["STATE"] = false
			
			Garage_2_OccupiedSlots[3]["STATE"] = true
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_1.xPos 
			Vehicle_1.yPos = Garage_1_Slot_1.yPos
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[1]["STATE"] = false
			
			Garage_1_OccupiedSlots[1]["STATE"] = true
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_2.xPos 
			Vehicle_1.yPos = Garage_1_Slot_2.yPos
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[1]["STATE"] = false
			
			Garage_1_OccupiedSlots[2]["STATE"] = true
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_3.xPos 
			Vehicle_1.yPos = Garage_1_Slot_3.yPos
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[1]["STATE"] = false
			
			Garage_1_OccupiedSlots[3]["STATE"] = true
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = ""
		  end
	     end
		end
	    DrawSprite(Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"], Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"], Vehicle_2.xPos, Vehicle_2.yPos, 0.1, 0.1, 0.0, 255, 255, 255, 255) 
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 slot 2----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Garage_2_OccupiedSlots[2]["STATE"] then
	    if MoveTexture then
         		
	     Vehicle_2.xPos = mouseX
		 Vehicle_2.yPos = mouseY
	     if Gar_2_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_1.xPos 
			Vehicle_2.yPos = Garage_2_Slot_1.yPos
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[2]["STATE"] = false
			
			Garage_2_OccupiedSlots[1]["STATE"] = true
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_3.xPos 
			Vehicle_2.yPos = Garage_2_Slot_3.yPos
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[2]["STATE"] = false
			
			Garage_2_OccupiedSlots[3]["STATE"] = true
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end
		 
	     if Gar_1_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_1.xPos 
			Vehicle_1.yPos = Garage_1_Slot_1.yPos
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[2]["STATE"] = false
			
			Garage_1_OccupiedSlots[1]["STATE"] = true
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_2.xPos 
			Vehicle_1.yPos = Garage_1_Slot_2.yPos
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[2]["STATE"] = false
			
			Garage_1_OccupiedSlots[2]["STATE"] = true
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_3.xPos 
			Vehicle_1.yPos = Garage_1_Slot_3.yPos
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[2]["STATE"] = false
			
			Garage_1_OccupiedSlots[3]["STATE"] = true
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = ""
		  end
	     end
		end
	    DrawSprite(Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"], Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"], Vehicle_2.xPos, Vehicle_2.yPos, 0.1, 0.1, 0.0, 255, 255, 255, 255) 
	   end
----------------------------------------------------------------------------------------------	  
---------------------------garage 2 slot 3----------------------------------------------------
----------------------------------------------------------------------------------------------
	   if Garage_2_OccupiedSlots[3]["STATE"] then
	    if MoveTexture then
         		
	     Vehicle_2.xPos = mouseX
		 Vehicle_2.yPos = mouseY
	     if Gar_1_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_1.xPos 
			Vehicle_1.yPos = Garage_1_Slot_1.yPos
			Garage_1_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[3]["STATE"] = false
			
			Garage_1_OccupiedSlots[1]["STATE"] = true
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_2.xPos 
			Vehicle_1.yPos = Garage_1_Slot_2.yPos
			Garage_1_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[3]["STATE"] = false
			
			Garage_1_OccupiedSlots[2]["STATE"] = true
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_1_Slot_3 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_1.xPos = Garage_1_Slot_3.xPos 
			Vehicle_1.yPos = Garage_1_Slot_3.yPos
			Garage_1_OccupiedSlots[3]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_1_OccupiedSlots[3]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[3]["STATE"] = false
			
			Garage_1_OccupiedSlots[3]["STATE"] = true
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
		  end
	     end
		 
	     if Gar_2_Slot_1 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_1.xPos 
			Vehicle_2.yPos = Garage_2_Slot_1.yPos
			Garage_2_OccupiedSlots[1]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[1]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[3]["STATE"] = false
			
			Garage_1_OccupiedSlots[1]["STATE"] = true
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
		  end
	     end
	     if Gar_2_Slot_2 then 
	      if IsControlJustPressed(2, 237) then		  
		   MoveTexture = false
		    Vehicle_2.xPos = Garage_2_Slot_2.xPos 
			Vehicle_2.yPos = Garage_2_Slot_2.yPos
			Garage_2_OccupiedSlots[2]["MODEL"]["MODEL"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"]
			Garage_2_OccupiedSlots[2]["MODEL"]["MODELDICT"] = Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"]
			Garage_2_OccupiedSlots[3]["STATE"] = false
			
			Garage_1_OccupiedSlots[2]["STATE"] = true
			Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"] = ""
			Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"] = ""
		  end
	     end
		end
		DrawSprite(Garage_2_OccupiedSlots[3]["MODEL"]["MODELDICT"], Garage_2_OccupiedSlots[3]["MODEL"]["MODEL"], Vehicle_2.xPos, Vehicle_2.yPos, 0.1, 0.1, 0.0, 255, 255, 255, 255)
	   end	      
	  end 
	end
	
	if HideStuff then
	  
	
     DrawSprite("shared", "bggradient", (options.x + options.x) + options.width, options.y - 0.15 , options.width, 0.15, 0.0,options.color_r, options.color_g, options.color_b, 175)
	 drawTxt("VEHICLE INVENTORY", 1, 1, (options.x + options.x) + options.width, (options.y - 0.15) - 0.07, 0.25, 0, 150, 255, 255)
	 drawTxt("\"dirty\" money", 1, 0, ((options.x + options.x) - 0.10) + options.width, (options.y - 0.15) - 0.05 , 0.50, 255, 255, 255, 255)
	 drawTxt("Weapons", 1, 0, ((options.x + options.x) - 0.10) + options.width, (options.y - 0.15) - 0.02 , 0.50, 255, 255, 255, 255)
	 drawTxt("drugs", 1, 0, ((options.x + options.x) - 0.10) + options.width, (options.y - 0.15) + 0.01 , 0.50, 255, 255, 255, 255)
	 
	 
	end
   if not IsOnDuty then
    if IsControlJustReleased(1, 244) then
      CitMain() -- Menu to draw
      Menu.hidden = not Menu.hidden -- Hide/Show the menu
    end
      Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
   end
   if IsOnDuty then
    if IsControlJustReleased(1, 244) then
      PoliceMain() -- Menu to draw
      Menu.hidden = not Menu.hidden -- Hide/Show the menu
    end
      Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
   end
   
    if ShowPersonalInventory then
	 options.y = 0.5
	 DrawSprite("shared", "bggradient", options.x , options.y - 0.15 , options.width, 0.15, 0.0, options.color_r, options.color_g, options.color_b, 175)
	 drawTxt("PERSONAL INVENTORY", 1, 1, options.x , (options.y - 0.15) - 0.07, 0.25, 0, 150, 255, 255)
	 drawTxt("\"dirty\" money", 1, 0, (options.x - 0.10) , (options.y - 0.15) - 0.05 , 0.50, 255, 255, 255, 255)
	 drawTxt("Weapons", 1, 0, (options.x - 0.10) , (options.y - 0.15) - 0.02 , 0.50, 255, 255, 255, 255)
	 drawTxt("drugs", 1, 0, (options.x - 0.10) , (options.y - 0.15) + 0.01 , 0.50, 255, 255, 255, 255)
	else
     options.y = 0.2	
	end 

    if ShowPoliceInventory then
	 options.y = 0.5
	 DrawSprite("shared", "bggradient", options.x , options.y - 0.15 , options.width, 0.15, 0.0, options.color_r, options.color_g, options.color_b, 175)
	 drawTxt("INVENTORY", 1, 1, options.x , (options.y - 0.15) - 0.07, 0.25, 0, 150, 255, 255)
	 drawTxt("spike strip", 1, 0, (options.x - 0.10) , (options.y - 0.15) - 0.05 , 0.50, 255, 255, 255, 255)
	 drawTxt("traffic cone", 1, 0, (options.x - 0.10) , (options.y - 0.15) - 0.02 , 0.50, 255, 255, 255, 255)
	 drawTxt("TBA", 1, 0, (options.x - 0.10) , (options.y - 0.15) + 0.01 , 0.50, 255, 255, 255, 255)
	else
	 if not ShowPersonalInventory then
      options.y = 0.2
	 end
	end 	

  end
end)
