
--loop

--locations
local towTruckDebug = false
local Impound = {}
Impound[0] = {["x"] = 401.457,["y"] = -1632.219, ["z"] = 28.000}

randNum = 0

local MissionData = {
  [0] = {["X"]=-240.627, ["Y"]=-2062.604,["Z"]=27.238,["R"]=218.595,["T"] ="towtruck", ["C"] = "zentorno", ["D"] = "Impound Lot"},
  [1] = {["X"]=667.774047851563,["Y"]=645.631591796875,["Z"]=129.117416381836,["R"]= 254,["T"] ="towtruck2", ["C"] = "felon", ["D"] = "Mano A Mano"},
  [2] = {["X"]=951.941589355469,["Y"]=117.730613708496,["Z"]=80.8039398193359,["R"]= 0,["T"] ="towtruck2", ["C"] = "felon", ["D"] = "Gas Station"},
  [3] = {["X"]=-474.758,["Y"]=118.544,["Z"]=63.668,["R"]= 269.918,["T"] ="towtruck", ["C"] = "felon2", ["D"] = "Parking Lot"},
  [4] = {["X"]=-730.430,["Y"]=-6.974,["Z"]=37.416,["R"]= 204.143,["T"] ="towtruck2", ["C"] = "felon", ["D"] = "Gas Station Drop off Location"},
  [5] = {["X"]=-1418.781,["Y"]=-286.891,["Z"]=45.914,["R"]= 130.828,["T"] ="towtruck2", ["C"] = "felon", ["D"] = "Drop off Location"},
  [6] = {["X"]=-764.597351074219,["Y"]=236.763778686523,["Z"]=75.6799621582031,["R"]= 0,["T"] ="towtruck2", ["C"] = "felon", ["D"] = "Drop off Location"},
  [7] = {["X"]=-1082.468,["Y"]=-475.290,["Z"]=36.246,["R"]= 24.602,["T"] ="towtruck", ["C"] = "boxville3", ["D"] = "Drop off location"},
  [8] = {["X"]=-318.125,["Y"]=-1112.582,["Z"]=22.589,["R"]= 341.458,["T"] ="towtruck", ["C"] = "bodhi2", ["D"] = "Drop off Location"},
  [9] = {["X"]=-2879.270,["Y"]=53.901,["Z"]=13.750,["R"]= 248.197,["T"] ="towtruck", ["C"] = "huntley", ["D"] = "Gas Statoion"},
  [10] = {["X"]=-492.132,["Y"]=410.628,["Z"]=98.639,["R"]= 170.800,["T"] ="towtruck", ["C"] = "speedo2", ["D"] = "Some Location"},
  [11] = {["X"]=-556.668,["Y"]=-929.366,["Z"]=23.479,["R"]= 270.136,["T"] ="towtruck2", ["C"] = "felon", ["D"] = "Stash behind stores"},
  [12] = {["X"]=-620.467,["Y"]=-732.541,["Z"]=27.398,["R"]= 92.734,["T"] ="towtruck2", ["C"] = "t20", ["D"] = "Simmon's Car Shop"},
  [13] = {["X"]=277.245,["Y"]=-2069.682,["Z"]=16.710,["R"]= 106.891,["T"] ="towtruck2", ["C"] = "buccaneer2", ["D"] = "Chopshop"},
  [14] = {["X"]=-730.719,["Y"]=-909.682,["Z"]=18.664,["R"]= 179.948,["T"] ="towtruck2", ["C"] = "mower", ["D"] = "Golf course"},
  [15] = {["X"]=325.447,["Y"]=-1475.214,["Z"]=29.427,["R"]= 233.819,["T"] ="towtruck", ["C"] = "ambulance", ["D"] = "El Burrito Heights Hospital"},
  [16] = {["X"]=-1198.315,["Y"]=-1531.651,["Z"]=3.977,["R"]= 303.618,["T"] ="towtruck2", ["C"] = "pony2", ["D"] = "Rockford Hills"},
  [17] = {["X"]=-1502.178,["Y"]=-1450.985,["Z"]=0.389,["R"]= 274.030,["T"] ="towtruck", ["C"] = "sandking", ["D"] = "Los Santos Customs"},
  [18] = {["X"]=-1036.751,["Y"]=-1338.871,["Z"]=5.083,["R"]= 71.724,["T"] ="towtruck2", ["C"] = "slamvan", ["D"] = "Gas Station"},
  [19] = {["X"]=219.124,["Y"]=-766.240,["Z"]=30.452,["R"]= 248.805,["T"] ="towtruck2", ["C"] = "police", ["D"] = "Police Station"},
  [20] = {["X"]=1968.354,["Y"]=-910.937,["Z"]=78.604,["R"]= 125.638 ,["T"] ="towtruck", ["C"] = "boxville2", ["D"] = "El Burrito Heights"},
  [21] = {["X"]=359.500,["Y"]=-2480.106,["Z"]=6.487,["R"]= 91.425,["T"] ="towtruck", ["C"] = "packer", ["D"] = "truck repair"},
  [22] = {["X"]=-976.362,["Y"]=-2691.776,["Z"]=13.447,["R"]= 328.304,["T"] ="towtruck2", ["C"] = "felon", ["D"] = "Los Santos Customs"},
  [23] = {["X"]=-1021.00451660156,["Y"]=-2368.70239257813,["Z"]=13.9445371627808,["R"]= 180,["T"] ="towtruck", ["C"] = "utillitruck", ["D"] = "Xero Gas Wearhouse"},
  [24] = {["X"]=-939.911254882813,["Y"]=-2322.38623046875,["Z"]=6.70908880233765,["R"]= 0,["T"] ="towtruck", ["C"] = "rumpo", ["D"] = "Los Santos Customs"},
  [25] = {["X"]=-840.335327148438,["Y"]=-2305.14794921875,["Z"]=6.70902919769287,["R"]= 0,["T"] ="towtruck2", ["C"] = "burrito2", ["D"] = "Los Santos Customs"}
}

local MissionEndData = {
  [0] = {["X"]=401.457, ["Y"]=-1632.219,["Z"]=28.000,["R"]=354.879},
  [1] = {["X"]=348.833,["Y"]=350.811,["Z"]=103.713,["R"]= 254},
  [2] = {["X"]=1182.520,["Y"]=-335.451,["Z"]=67.789,["R"]= 0},
  [3] = {["X"]=360.125,["Y"]=285.530,["Z"]=102.066,["R"]= 0},
  [4] = {["X"]=631.954,["Y"]=252.943,["Z"]=101.718,["R"]= 0},
  [5] = {["X"]=-838.86328125,["Y"]=32.8317413330078,["Z"]=45.658748626709,["R"]= 0},
  [6] = {["X"]=-195.797,["Y"]=286.034,["Z"]=91.545,["R"]= 0},
  [7] = {["X"]=-1211.203,["Y"]=-1066.621,["Z"]=6.964,["R"]= 0},
  [8] = {["X"]=145.922,["Y"]=-1286.401,["Z"]=27.892,["R"]= 0},
  [9] = {["X"]=-2100.724,["Y"]=-316.520,["Z"]=11.370,["R"]= 0},
  [10] = {["X"]=-360.720,["Y"]=-127.526,["Z"]=37.079,["R"]= 0},
  [11] = {["X"]=-703.595,["Y"]=-132.850,["Z"]=36.294,["R"]= 0},
  [12] = {["X"]=-14.867,["Y"]=-1082.482,["Z"]=25.291,["R"]= 0},
  [13] = {["X"]=494.940,["Y"]=-1327.381,["Z"]=27.939,["R"]= 0},
  [14] = {["X"]=-1370.848,["Y"]=56.645,["Z"]=52.320,["R"]= 0},
  [15] = {["X"]=1199.704,["Y"]=-1493.197,["Z"]=33.654,["R"]= 0},
  [16] = {["X"]=-975.729,["Y"]=-269.627,["Z"]=36.894,["R"]= 0},
  [17] = {["X"]=-373.817,["Y"]=-125.328,["Z"]=38.026,["R"]= 0},
  [18] = {["X"]=-1438.220,["Y"]=-274.760,["Z"]=44.825,["R"]= 0},
  [19] = {["X"]=451.251,["Y"]=-1019.416,["Z"]=29.064,["R"]= 0},
  [20] = {["X"]=1719.237,["Y"]=-1566.387,["Z"]=111.339,["R"]= 0},
  [21] = {["X"]=590.765,["Y"]=-3040.285,["Z"]=5.069,["R"]= 0},
  [22] = {["X"]=-1132.764,["Y"]=-1995.759,["Z"]=12.170,["R"]= 133.872},
  [23] = {["X"]=-1132.764,["Y"]=-1995.759,["Z"]=12.170,["R"]= 0},
  [24] = {["X"]=-1132.764,["Y"]=-1995.759,["Z"]=12.170,["R"]= 133.872},
  [25] = {["X"]=-1132.764,["Y"]=-1995.759,["Z"]=12.170,["R"]= 133.872}
}

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
--NETWORK_GET_NETWORK_ID_FROM_ENTITY(Entity entity)
local lastTowMission = -1

local currentTowMission = {}
local currentTowEnd = {}
TOWMISSION = {}
TOWMISSION.start = {}
TOWMISSION.towvehicle = {}
TOWMISSION.towtruck = {}
local currentMission = 0
--debouncers for multiple triggings 
local truckSpawing = false
local missionSpawing = false
local missionEnding = false
local blipEnabled = {}
local playerCoords
local playerPed
local firstPickup = {}
tonyaPed = {}
truckSpawned = {}


local showStartText   = false

--blips
local towBlip = {}

towBlip.company = 0

towBlip.vehicle = {}
towBlip.vehicle.i = 0

local initload = false
Citizen.CreateThread(function()
  --NETWORK_GET_PLAYER_INDEX_FROM_PED(Ped ped) 
 
  --GET_PLAYER_SERVER_ID(NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED(-1))
  --GetPlayerFromServerId(NetworkGetPlayerIndexFromPed(GetPed()))
    while true do
       Citizen.Wait(0)
       playerPed = GetPlayerPed(-1)
       playerCoords = GetEntityCoords(playerPed, 0)
        if (not initload) then
            init()
            initload = true
        end
        towTruckTick()
    end

end)

function init()
  towBlip.company = AddBlipForCoord(Impound[0]["x"], Impound[0]["y"], Impound[0]["z"])
  SetBlipSprite(towBlip.company, 357)
  SetBlipDisplay(towBlip.company, 4)
  SetBlipScale(towBlip.company, 0.8)
  --SET_FAR_DRAW_VEHICLES(true) 
  SetFarDrawVehicles(true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Towtruck Job")
  EndTextCommandSetBlipName(towBlip.company)
  Citizen.Trace("TOW JOB - Blip added.\n")

  -- Create Tonya
  RequestModel(GetHashKey("ig_tonya"))
  while not HasModelLoaded(GetHashKey("ig_tonya")) do
    Wait(1)
  end
end

--Draw Text / Menus
function towTruckTick()
  --Show menu, when player is near
  --PED_TO_NET(Ped ped) /
  if(not TOWMISSION.start[NetworkPlayerIdToInt()]) then
    if(GetDistanceBetweenCoords(playerCoords, Impound[0]["x"], Impound[0]["y"], Impound[0]["z"] ) < 30) then
      DrawMarker(1,Impound[0]["x"], Impound[0]["y"], Impound[0]["z"], 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
      tow_Draw3DText(Impound[0]["x"], Impound[0]["y"], Impound[0]["z"] +.500, "Tonya's",7,0.3,0.2)
      tow_Draw3DText(Impound[0]["x"], Impound[0]["y"], Impound[0]["z"] +.100, "Towing",7,0.3,0.2)
      if(GetDistanceBetweenCoords(playerCoords, Impound[0]["x"], Impound[0]["y"], Impound[0]["z"] ) < 5) then
        if(not showStartText) then
          
          tow_ShowInfo("Press ~INPUT_SCRIPT_PAD_RIGHT~ to start", 0)

          StartText()
          if(IsControlJustPressed(1, Keys["O"])) then
            --ui::activate_frontend_menu(14955678, 0, -1);
            ActivateFrontendMenu(14955678, 0, -1)

          end

          if(IsControlJustPressed(1, Keys["E"])) then
           
            --Citizen.Trace( "Player index is")
            --Citizen.Trace(NetworkPlayerIdToInt())
            if(not truckSpawing) then
              truckSpawing = true
              spawnTruck() 
             
            end

            if(not missionSpawing) then
              missionSpawing = true
              SpawnMission()
            end
          end
        end
      end
    else
      showStartText = false
    end --if GetDistanceBetweenCoords ...
  end --if MISSION.start == false

  

  if (firstPickup[NetworkPlayerIdToInt()]) then

    if (not IsVehicleOnAllWheels(TOWMISSION.towvehicle[NetworkPlayerIdToInt()])) then
     -- SetVehicleOnGroundProperly(TOWMISSION.towvehicle[NetworkPlayerIdToInt()])
    end
    --AttachVehicleToTowTruck(TOWMISSION.towtruck[NetworkPlayerIdToInt()],  TOWMISSION.towvehicle[NetworkPlayerIdToInt()],  true,  0,  0, 0)
  end

  if(TOWMISSION.start[NetworkPlayerIdToInt()]) then 

    if (truckSpawned[NetworkPlayerIdToInt()]) then
      if(GetVehicleEngineHealth(TOWMISSION.towtruck[NetworkPlayerIdToInt()])< 1 or not IsVehicleDriveable(TOWMISSION.towtruck[NetworkPlayerIdToInt()])) then
        completeMissionFail()
      end
    end


    if(not IsVehicleAttachedToTowTruck(TOWMISSION.towtruck[NetworkPlayerIdToInt()], TOWMISSION.towvehicle[NetworkPlayerIdToInt()])) then
       tow_DrawMissionText("~w~" .. "Go find the" .. " ~y~" .. tostring(MissionData[randNum]["C"]) .. " ~w~".. " and bring it to " .."  ~y~" .. tostring(MissionData[randNum]["D"]) .." .", 900)
       DrawMarker(1,MissionData[randNum]["X"],MissionData[randNum]["Y"],MissionData[randNum]["Z"]-1, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
    end
    -- Check if the player is near the vehicle
    if(GetDistanceBetweenCoords(playerCoords, MissionData[randNum]["X"],MissionData[randNum]["Y"],MissionData[randNum]["Z"]) < 10 and not IsVehicleAttachedToTowTruck(TOWMISSION.towtruck[NetworkPlayerIdToInt()], TOWMISSION.towvehicle[NetworkPlayerIdToInt()])) then
      tow_DrawMissionText("~w~" .. "Attach the".. "~y~" .. tostring(MissionData[randNum]["C"]) .. " ~w~".. " and bring it to " .. "~y~" .. tostring(MissionData[randNum]["D"]) .." .", 900)
    end

    -- Check if the vehicle is attached to the tow truck
    if(IsVehicleAttachedToTowTruck(TOWMISSION.towtruck[NetworkPlayerIdToInt()], TOWMISSION.towvehicle[NetworkPlayerIdToInt()])) then

      if(not firstPickup[NetworkPlayerIdToInt()] ) then 
        firstPickup[NetworkPlayerIdToInt()] = true
      end
      -- void ATTACH_VEHICLE_TO_TOW_TRUCK(Vehicle towTruck, Vehicle vehicle, BOOL rear, float hookOffsetX, float hookOffsetY, float hookOffsetZ)
      ProcessEntityAttachments(TOWMISSION.towtruck[NetworkPlayerIdToInt()])
     -- AttachVehicleToTowTruck(TOWMISSION.towtruck[NetworkPlayerIdToInt()],  TOWMISSION.towvehicle[NetworkPlayerIdToInt()],  false,  0.0,  0.0,  0.0)
     -- AttachEntityToEntity( TOWMISSION.towvehicle[NetworkPlayerIdToInt()],TOWMISSION.towtruck[NetworkPlayerIdToInt()],70,0.0,0.0,0.0,0.0,0.0,true,true,false,false,0,false) 



      tow_DrawMissionText("~w~" .. "Bring the" .. " ~y~" .. tostring(MissionData[randNum]["C"]) .. " ~w~" .. " to the drop off zone at " .."  ~y~" .. tostring(MissionData[randNum]["D"]) .." .", 500)
      --SetBlipRoute(current, false)
      if(not blipEnabled[NetworkPlayerIdToInt()]) then
        blipEnabled[NetworkPlayerIdToInt()] = true
        SetBlipRoute(currentTowMission[NetworkPlayerIdToInt()], false)
      
        SetBlipRoute(currentTowEnd[NetworkPlayerIdToInt()], true)
      end
       
    end

  --if GetDistanceBetweenCoords ..
    if(IsVehicleAttachedToTowTruck(TOWMISSION.towtruck[NetworkPlayerIdToInt()], TOWMISSION.towvehicle[NetworkPlayerIdToInt()]) and GetDistanceBetweenCoords(playerCoords, MissionEndData[randNum]["X"],MissionEndData[randNum]["Y"],MissionEndData[randNum]["Z"]) < 250) then
      DrawMarker(1,MissionEndData[randNum]["X"],MissionEndData[randNum]["Y"],MissionEndData[randNum]["Z"], 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
      if(IsVehicleAttachedToTowTruck(TOWMISSION.towtruck[NetworkPlayerIdToInt()], TOWMISSION.towvehicle[NetworkPlayerIdToInt()]) and GetDistanceBetweenCoords(playerCoords, MissionEndData[randNum]["X"],MissionEndData[randNum]["Y"],MissionEndData[randNum]["Z"]) < 3) then

        tow_DrawMissionText("~g~" .. "Completed mission WOOT!" .. "~w~.", 900)
        if(not missionEnding) then
            missionEnding = true
            completeMission()
        end
      end
    end
  end 
 end





function spawnTruck()
  if towTruckDebug then
    --do nothing with the number
  else
    randNum = math.random(0,25)

    if lastTowMission == -1 then 
      lastTowMission = randNum
    else
      if randNum == lastTowMission then
        randNum =  math.random(0,25)
      end
    lastTowMission = randNum
    end
  end
  Citizen.Trace("Rand num is:\n")
  Citizen.Trace(randNum)
  
  -- Load the towtruck model.
  RequestModel(GetHashKey(MissionData[randNum]["T"]))
  while not HasModelLoaded(GetHashKey(MissionData[randNum]["T"])) do
    Wait(1)
  end
    tow_showLoadingPromt("Loading tow truck mission", 5000, 3)
    FreezeEntityPosition(GetPlayerPed(-1), 1)
    -- Citizen.Wait(1000)
    -- DoScreenFadeOut(1000)
    -- Citizen.Wait(1500)

   -- Spawn the towtruck model.
    TOWMISSION.towtruck[NetworkPlayerIdToInt()] = CreateVehicle(GetHashKey(MissionData[randNum]["T"]), 408.100, -1638.497, 29.257, 229.169, true, true)
    SetEntityAsMissionEntity(TOWMISSION.towtruck[NetworkPlayerIdToInt()])
    --set the mod's
    SetVehicleColours(TOWMISSION.towtruck[NetworkPlayerIdToInt()], 123, 70)
    SetVehicleModKit(TOWMISSION.towtruck[NetworkPlayerIdToInt()], 0)
    SetVehicleWheelType(TOWMISSION.towtruck[NetworkPlayerIdToInt()], 2)
    SetVehicleMod(TOWMISSION.towtruck[NetworkPlayerIdToInt()], 23, 7, 1)
    SetVehicleMod(TOWMISSION.towtruck[NetworkPlayerIdToInt()], 11, 18, 1)

    SetVehicleEngineTorqueMultiplier(TOWMISSION.towtruck[NetworkPlayerIdToInt()], 2000)
   
    --NEEDED TO allow for multiple trucks to spawn....
    SetEntityAsNoLongerNeeded(TOWMISSION.towtruck[NetworkPlayerIdToInt()])
    
    SetVehicleNumberPlateText(TOWMISSION.towtruck[NetworkPlayerIdToInt()], "FSTOW1")
    SetVehicleNumberPlateTextIndex(TOWMISSION.towtruck[NetworkPlayerIdToInt()],1)
    SetVehRadioStation(TOWMISSION.towtruck[NetworkPlayerIdToInt()], "OFF")
    SetVehicleSiren(TOWMISSION.towtruck[NetworkPlayerIdToInt()], true)

    SetVehicleOnGroundProperly(TOWMISSION.towtruck[NetworkPlayerIdToInt()])
    --SET_ENTITY_COORDS_NO_OFFSET
    --SetEntityCoordsNoOffset(GetPlayerPed(-1),  410.631, -1636.785, 29.292, 0, 0, 0)
    --StartPlayerTeleport( GetPlayerPed(-1), 410.631, -1636.785, 29.292, 115.494, 0, 0, 0)

    --while not N_0xe23d5873c2394c61(GetPlayerPed(-1)) do
    --  Wait(1)
    --end
    
    --tonyaPed[NetworkPlayerIdToInt()] = CreatePed(4, GetHashKey("ig_tonya"), 409.953, -1629.706, 29.292, 210.462, 0.0, 1, 0)
    --func_15(tonyaPed[NetworkPlayerIdToInt()])
    --tonyaPed[NetworkPlayerIdToInt()] = CreatePed(4, GetHashKey("ig_tonya"), 409.953, -1629.706, 29.292, 210.462, 0.0, 1, 0)
    tonyaPed[NetworkPlayerIdToInt()] = CreatePedInsideVehicle(TOWMISSION.towtruck[NetworkPlayerIdToInt()],  4,  GetHashKey("ig_tonya"),  0,  1,  1)
    --SetEntityCoordsNoOffset(tonyaPed[NetworkPlayerIdToInt()],  411.031, -1631.737, 29.292, 0, 0, 0)
    --SetEntityCoordsNoOffset(tonyaPed[NetworkPlayerIdToInt()],  410.453, -1632.306, 29.292, 0, 0, 0)
    SetEntityVisible(tonyaPed[NetworkPlayerIdToInt()],  0)
    N_0xf1ca12b18aef5298(tonyaPed[NetworkPlayerIdToInt()],0)
    SetNetworkIdExistsOnAllMachines(PedToNet(tonyaPed[NetworkPlayerIdToInt()]), 1)
    SetNetworkIdCanMigrate(PedToNet(tonyaPed[NetworkPlayerIdToInt()]), 0)
    SetNetworkIdCanMigrate(TOWMISSION.towtruck[NetworkPlayerIdToInt()], 0)
    --TaskLeaveVehicle(tonyaPed[NetworkPlayerIdToInt()], TOWMISSION.towtruck[NetworkPlayerIdToInt()], 256)

    Citizen.Wait(1500)
    SetEntityCoordsNoOffset(tonyaPed[NetworkPlayerIdToInt()], 401.689, -1632.049, 29.292,0, 0, 0)
    --TASK_TURN_PED_TO_FACE_ENTITY
    TaskTurnPedToFaceEntity(GetPlayerPed(-1),  tonyaPed[NetworkPlayerIdToInt()],  2000)
    TaskTurnPedToFaceEntity(tonyaPed[NetworkPlayerIdToInt()], GetPlayerPed(-1), 2000)
    --SetEntityCoordsNoOffset(GetPlayerPed(-1),  413.453, -1629.306, 29.292, 0, 0, 0)
    SetEntityVisible(tonyaPed[NetworkPlayerIdToInt()],  1)
    -- Citizen.Wait(3000)
    -- DoScreenFadeIn(1000)
    -- Citizen.Wait(1000)
    

    PlayAmbientSpeechWithVoice(tonyaPed[NetworkPlayerIdToInt()], "GENERIC_HOWS_IT_GOING", "TONYA", "SPEECH_PARAMS_FORCE_NORMAL", math.random(0,1))
    Citizen.Wait(1500)
    PlayAmbientSpeechWithVoice(tonyaPed[NetworkPlayerIdToInt()], "YOU_DRIVE", "TONYA", "SPEECH_PARAMS_FORCE_NORMAL", math.random(0,2))
    Citizen.Wait(1500)
    N_0x4ada3f19be4a6047(tonyaPed[NetworkPlayerIdToInt()])
    FreezeEntityPosition(GetPlayerPed(-1), 0)
    --more elegant way of having the ped get in the car
    TaskEnterVehicle(tonyaPed[NetworkPlayerIdToInt()], TOWMISSION.towtruck[NetworkPlayerIdToInt()], 20000, 0, 2.0, 1, 0)
    TaskEnterVehicle( GetPlayerPed(-1), TOWMISSION.towtruck[NetworkPlayerIdToInt()], 20000,-1, 1.5, 1, 0)
    truckSpawned[NetworkPlayerIdToInt()] = true
  
end


function SpawnMission()
  

  RequestModel(GetHashKey(MissionData[randNum]["C"]))
  while not HasModelLoaded(GetHashKey(MissionData[randNum]["C"])) do
    Citizen.Wait(1)
  end
 
  TOWMISSION.towvehicle[NetworkPlayerIdToInt()] = CreateVehicle(GetHashKey(MissionData[randNum]["C"]), MissionData[randNum]["X"],MissionData[randNum]["Y"],MissionData[randNum]["Z"], MissionData[randNum]["R"], true, true)
  SetEntityAsMissionEntity(TOWMISSION.towvehicle[NetworkPlayerIdToInt()])
  SetVehicleAutomaticallyAttaches(TOWMISSION.towvehicle[NetworkPlayerIdToInt()], 1, 0)

  --SetEntityAsNoLongerNeeded(TOWMISSION.towvehicle[NetworkPlayerIdToInt()])
  SetVehicleOnGroundProperly(TOWMISSION.towvehicle[NetworkPlayerIdToInt()])
  --SET_VEHICLE_TYRE_BURST(Vehicle vehicle, int index, BOOL onRim, float p3) // 
  
if (randNum % 2 == 0) then
    --it is even
    SetVehicleTyreBurst(TOWMISSION.towvehicle[NetworkPlayerIdToInt()],1, 1,1000.00)
    SetVehicleTyreBurst(TOWMISSION.towvehicle[NetworkPlayerIdToInt()],2, 1,1000.00)
else
    --it is odd
end

  SetVehicleDoorsLocked(TOWMISSION.towvehicle[NetworkPlayerIdToInt()], 3)
  
  currentTowMission[NetworkPlayerIdToInt()] = AddBlipForEntity(TOWMISSION.towvehicle[NetworkPlayerIdToInt()]) --AddBlipForCoord(MissionData[0]["X"],MissionData[0]["Y"],MissionData[0]["Z"])--
  --SetNetworkIdCanMigrate(PedToNet(tonyaPed[NetworkPlayerIdToInt()]), 0)
  --BEGIN_TEXT_COMMAND_SET_BLIP_NAME("STRING");
  --UI::_ADD_TEXT_COMPONENT_STRING("Name");
  --UI::END_TEXT_COMMAND_SET_BLIP_NAME(blip);
  SetBlipAsShortRange(currentTowMission[NetworkPlayerIdToInt()],1)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("TowVehicle")
  EndTextCommandSetBlipName(currentTowMission[NetworkPlayerIdToInt()])


  SetNetworkIdCanMigrate(ObjToNet(currentTowMission[NetworkPlayerIdToInt()]), 0)
  SetBlipSprite(currentTowMission[NetworkPlayerIdToInt()], 380)
  SetBlipColour(currentTowMission[NetworkPlayerIdToInt()], 6)
  
  SetBlipDisplay(currentTowMission[NetworkPlayerIdToInt()], 2)
  SetBlipBright(currentTowMission[NetworkPlayerIdToInt()], 1)
  --SET_BLIP_FLASH_INTERVAL
  SetBlipFlashInterval(currentTowMission[NetworkPlayerIdToInt()],250)
  SetBlipFlashTimer(currentTowMission[NetworkPlayerIdToInt()], 10000)
  SetBlipRoute(currentTowMission[NetworkPlayerIdToInt()], 1)

  --Set ending blip
  
  currentTowEnd[NetworkPlayerIdToInt()] = AddBlipForCoord(MissionEndData[randNum]["X"],MissionEndData[randNum]["Y"],MissionEndData[randNum]["Z"])
  SetNetworkIdCanMigrate(ObjToNet(currentTowEnd[NetworkPlayerIdToInt()]), 0)
  SetBlipSprite(currentTowEnd[NetworkPlayerIdToInt()], 374)
  SetBlipDisplay(currentTowEnd[NetworkPlayerIdToInt()], 6)
  SetBlipScale(currentTowEnd[NetworkPlayerIdToInt()], 0.8)
  SetBlipBright(currentTowEnd[NetworkPlayerIdToInt()], 1)
    

  -- Start the mission
  TOWMISSION.start[NetworkPlayerIdToInt()] = true
end


function completeMission()

    --REMOVE_BLIP
    RemoveBlip(currentTowMission[NetworkPlayerIdToInt()])
    SetBlipRoute(currentTowMission[NetworkPlayerIdToInt()], false)
    firstPickup[NetworkPlayerIdToInt()] = false
    TOWMISSION.start[NetworkPlayerIdToInt()] = false
    truckSpawing = false
    missionSpawing = false
    missionEnding = false
    blipEnabled[NetworkPlayerIdToInt()] = false
    --DETACH_VEHICLE_FROM_TOW_TRUCK(Vehicle towTruck, Vehicle vehicle)
    DetachVehicleFromTowTruck(TOWMISSION.towtruck[NetworkPlayerIdToInt()], TOWMISSION.towvehicle[NetworkPlayerIdToInt()])
    N_0x260be8f09e326a20(TOWMISSION.towvehicle[NetworkPlayerIdToInt()],2.0,0,0)

    
    TaskLeaveVehicle(GetPlayerPed(-1), TOWMISSION.towtruck[NetworkPlayerIdToInt()], 256)
    TaskEnterVehicle(tonyaPed[NetworkPlayerIdToInt()], TOWMISSION.towtruck[NetworkPlayerIdToInt()], 20000, -1, 1.0, 1, 0)
    --TriggerServerEvent('mission:completed', Setup.towPayout)
    tow_DrawMissionText( "Tow complete".. "~y~".."Your cash Not!!" ..".", 25000)
    PlayAmbientSpeechWithVoice(tonyaPed[NetworkPlayerIdToInt()], "GENERIC_THANKS", "TONYA", "SPEECH_PARAMS_FORCE_NORMAL", 0)
    SetPedAsNoLongerNeeded(tonyaPed[NetworkPlayerIdToInt()])
    Citizen.Wait(6000)
    DoScreenFadeOut(2000)
    Citizen.Wait(2000)
    SetEntityCoordsNoOffset(GetPlayerPed(-1),  411.031, -1631.737, 29.292, 0, 0, 0)
      
      
   
    SetEntityAsNoLongerNeeded(TOWMISSION.towvehicle[NetworkPlayerIdToInt()])
    SetEntityAsNoLongerNeeded(TOWMISSION.towtruck[NetworkPlayerIdToInt()])
    DeleteVehicle(TOWMISSION.towtruck[NetworkPlayerIdToInt()])
    DeleteVehicle(TOWMISSION.towvehicle[NetworkPlayerIdToInt()])
    DeleteEntity(Citizen.PointerValueIntInitialized(TOWMISSION.towtruck[NetworkPlayerIdToInt()]))
    DeleteEntity(Citizen.PointerValueIntInitialized(TOWMISSION.towvehicle[NetworkPlayerIdToInt()]))
    SetBlipRoute(currentTowEnd[NetworkPlayerIdToInt()], false)
    RemoveBlip(currentTowEnd[NetworkPlayerIdToInt()])
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(TOWMISSION.towvehicle[NetworkPlayerIdToInt()]))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(TOWMISSION.towtruck[NetworkPlayerIdToInt()]))
    
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
   

end


function completeMissionFail()

    --REMOVE_BLIP
    RemoveBlip(currentTowMission[NetworkPlayerIdToInt()])
    firstPickup[NetworkPlayerIdToInt()] = false
    

    TOWMISSION.start[NetworkPlayerIdToInt()] = false
    truckSpawing = false
    missionSpawing = false
    missionEnding = false
    blipEnabled[NetworkPlayerIdToInt()] = false
    --DETACH_VEHICLE_FROM_TOW_TRUCK(Vehicle towTruck, Vehicle vehicle)
    DetachVehicleFromTowTruck(TOWMISSION.towtruck[NetworkPlayerIdToInt()], TOWMISSION.towvehicle[NetworkPlayerIdToInt()])

    TaskLeaveVehicle(playerPed, TOWMISSION.towtruck[NetworkPlayerIdToInt()], 0)
    tow_DrawMissionText("Failed", 25000)

    Citizen.Wait(3000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    --TriggerClientEvent('es_freeroam:tppos', playerPed, 397.747, -1602.256, 29.292)
         
        
    --SetEntityCoords(playerPed, 397.747, -1602.256, 29.292)
    --SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true);
    --DELETE_VEHICLE(&vehicle);
    SetEntityAsNoLongerNeeded(TOWMISSION.towvehicle[NetworkPlayerIdToInt()])
    SetEntityAsNoLongerNeeded(TOWMISSION.towtruck[NetworkPlayerIdToInt()])
    DeleteEntity(TOWMISSION.towtruck[NetworkPlayerIdToInt()])
    DeleteEntity(TOWMISSION.towvehicle[NetworkPlayerIdToInt()])
    SetBlipRoute(towBlip.company, false)
    Citizen.Wait(1000)

    -- NetworkExplodeVehicle(TOWMISSION.towtruck,1,1,1)
    -- NetworkExplodeVehicle(TOWMISSION.towvehicle,1,1,1)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(TOWMISSION.towvehicle[NetworkPlayerIdToInt()]))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(TOWMISSION.towtruck[NetworkPlayerIdToInt()]))
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
    DisableControlAction(2,86, false)
      
end



function StartText()
    tow_DrawMissionText("~y~" .."Tow vehicles" .. " ~g~".. "for fun." .."~w~.", 900)
    
     --Draw3DText(-1371.05, 56.0996, 51.900, "1-4",0,1,0.15)
end


function tow_drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function tow_DrawMissionText(m_text, showtime)
  ClearPrints()
  SetTextEntry_2("STRING")
  AddTextComponentString(m_text)
  DrawSubtitleTimed(showtime, 1)
end

 function tow_Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         -- RequestStreamedTextureDict( "mpmissmarkers128" )
         -- RequestStreamedTextureDict( "mpleaderboard" )
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov
    
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(255, 255, 255, 150)
         SetTextDropshadow(0, 0, 0, 0, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         -- DrawSprite( "mpmissmarkers256", "golf_icon", 0, 0, 0, 0, 0, 255, 255, 255, 255 )
         ClearDrawOrigin()
        end


function tow_ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

function tow_showLoadingPromt(showText, showTime, showType)
  Citizen.CreateThread(function()
    Citizen.Wait(0)
    N_0xaba17d7ce615adbf("STRING") -- set type
    AddTextComponentString(showText) -- sets the text
    N_0xbd12f8228410d9b4(showType) -- show promt (types = 3)
    Citizen.Wait(showTime) -- show time
    N_0x10d373323e5b9c0d() -- remove promt
  end)
end

function func_15(poD)

    SetEntityAsMissionEntity(poD, 1, 1)
    uParam0 = NetworkGetNetworkIdFromEntity(poD)
    if NetworkDoesNetworkIdExist(uParam0) then

        if true then
            SetNetworkIdExistsOnAllMachines(uParam0, 1)
            return true
        end
     return false
     end 
  end
