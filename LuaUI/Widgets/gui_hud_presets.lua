
function widget:GetInfo()
  return {
    name      = "HUD Presets",
    desc      = "Sets the default UI and provides presets for different HUD setups.",
    author    = "Google Frog",
    date      = "24 August, 2014",
    license   = "GNU GPL, v2 or later",
    layer     = 51,
    enabled   = true,
    handler   = true,
  }
end

----------------------------------------------------
-- widget option functions

local function Selections_SetOptions(group, showInfo, square, iconSize, showCommand, showDgun, alwaysShow)
	local selName, selPath = "Chili Selections & CursorTip", "Settings/HUD Panels/Selected Units Panel"
	WG.SetWidgetOption(widgetName, path, "groupalways",group)
	WG.SetWidgetOption(widgetName, path, "showgroupinfo",showInfo)
	WG.SetWidgetOption(widgetName, path, "squarepics",square)
	WG.SetWidgetOption(widgetName, path, "uniticon_size",iconSize)
	WG.SetWidgetOption(widgetName, path, "manualWeaponReloadBar",showDgun)
	WG.SetWidgetOption(widgetName, path, "unitCommand",showCommand)
	WG.SetWidgetOption(widgetName, path, "alwaysShowSelectionWin",alwaysShow)
end

local function SetNewOptions()
	local coreName, corePath = "Chili Core Selector", "Settings/HUD Panels/Quick Selection Bar"
	local integralName, integralPath = "Chili Integral Menu", "Settings/HUD Panels/Command Panel"
	local minimapName, minimapPath = "Chili Minimap", "Settings/HUD Panels/Minimap"
	local consoleName, consolePath = "Chili Pro Console", "Settings/HUD Panels/Chat"
	local selName, selPath = "Chili Selections & CursorTip", "Settings/HUD Panels/Selected Units Panel"

	WG.SetWidgetOption(coreName, corePath, "background_opacity", 0.8)
	WG.SetWidgetOption(coreName, corePath, "buttonSpacing", 0.75)
	WG.SetWidgetOption(coreName, corePath, "fancySkinning", true)
	WG.SetWidgetOption(coreName, corePath, "horPadding", 11.25)
	WG.SetWidgetOption(coreName, corePath, "maxbuttons", 6)
	WG.SetWidgetOption(coreName, corePath, "minButtonSpaces", 3)
	WG.SetWidgetOption(coreName, corePath, "minSize", 196)
	WG.SetWidgetOption(coreName, corePath, "showCoreSelector", "always")
	WG.SetWidgetOption(coreName, corePath, "vertPadding", 6.25)
	WG.SetWidgetOption(coreName, corePath, "vertical", true)
	
	WG.SetWidgetOption(integralName, integralPath, "fancySkinning", true)
	WG.SetWidgetOption(integralName, integralPath, "hide_when_spectating", false)
	WG.SetWidgetOption(integralName, integralPath, "leftPadding", 8)
	WG.SetWidgetOption(integralName, integralPath, "rightPadding", 10)
	
	WG.SetWidgetOption(minimapName, minimapPath, "alwaysResizable", false)
	WG.SetWidgetOption(minimapName, minimapPath, "fancySkinning", true)
	WG.SetWidgetOption(minimapName, minimapPath, "hidebuttons", true)
	WG.SetWidgetOption(minimapName, minimapPath, "leftClickOnMinimap", "camera")
	WG.SetWidgetOption(minimapName, minimapPath, "minimizable", false)
	WG.SetWidgetOption(minimapName, minimapPath, "opacity", 0.8)
	WG.SetWidgetOption(minimapName, minimapPath, "use_map_ratio", "armap")
	
	WG.SetWidgetOption(consoleName, consolePath, "backlogArrowOnRight", false)
	
	WG.SetWidgetOption(selName, selPath, "fancySkinning", true)
	WG.SetWidgetOption(selName, selPath, "leftPadding", 7)
end

local function ResetOptionsFromNew()
	local coreName, corePath = "Chili Core Selector", "Settings/HUD Panels/Quick Selection Bar"
	local integralName, integralPath = "Chili Integral Menu", "Settings/HUD Panels/Command Panel"
	local minimapName, minimapPath = "Chili Minimap", "Settings/HUD Panels/Minimap"
	local consoleName, consolePath = "Chili Pro Console", "Settings/HUD Panels/Chat"
	local selName, selPath = "Chili Selections & CursorTip", "Settings/HUD Panels/Selected Units Panel"

	WG.SetWidgetOption(coreName, corePath, "background_opacity", 0)
	WG.SetWidgetOption(coreName, corePath, "buttonSpacing", 0)
	WG.SetWidgetOption(coreName, corePath, "fancySkinning", false)
	WG.SetWidgetOption(coreName, corePath, "horPadding", 0)
	WG.SetWidgetOption(coreName, corePath, "maxbuttons", 6)
	WG.SetWidgetOption(coreName, corePath, "minButtonSpaces", 0)
	WG.SetWidgetOption(coreName, corePath, "minSize", 0)
	WG.SetWidgetOption(coreName, corePath, "showCoreSelector", "spec")
	WG.SetWidgetOption(coreName, corePath, "vertPadding", 0)
	WG.SetWidgetOption(coreName, corePath, "vertical", false)
	
	WG.SetWidgetOption(integralName, integralPath, "fancySkinning", false)
	WG.SetWidgetOption(integralName, integralPath, "hide_when_spectating", false)
	WG.SetWidgetOption(integralName, integralPath, "leftPadding", 0)
	WG.SetWidgetOption(integralName, integralPath, "rightPadding", 0)
	
	WG.SetWidgetOption(minimapName, minimapPath, "alwaysResizable", false)
	WG.SetWidgetOption(minimapName, minimapPath, "fancySkinning", false)
	WG.SetWidgetOption(minimapName, minimapPath, "hidebuttons", false)
	WG.SetWidgetOption(minimapName, minimapPath, "leftClickOnMinimap", "unitselection")
	WG.SetWidgetOption(minimapName, minimapPath, "minimizable", false)
	WG.SetWidgetOption(minimapName, minimapPath, "opacity", 0)
	WG.SetWidgetOption(minimapName, minimapPath, "use_map_ratio", "arwindow")
	
	WG.SetWidgetOption(consoleName, consolePath, "backlogArrowOnRight", true)
	
	WG.SetWidgetOption(selName, selPath, "fancySkinning", false)
	WG.SetWidgetOption(selName, selPath, "leftPadding", 0)
end
----------------------------------------------------
----------------------------------------------------
-- Useful Functions
----------------------------------------------------
local function GetSelectionIconSize(height)
	local fitNumber = math.floor((height - 20)/(44 + 2))
	local size = math.floor((height - 20)/fitNumber - 2)
	return math.min(50, size)
end

----------------------------------------------------
-- Default Preset
----------------------------------------------------
local function SetupDefaultPreset()
	-- Disable
	widgetHandler:DisableWidget("Chili Chat 2.2")
	widgetHandler:DisableWidget("Chili Deluxe Player List - Alpha 2.02")
	widgetHandler:DisableWidget("Chili FactoryBar")
	widgetHandler:DisableWidget("Chili FactoryPanel")
	widgetHandler:DisableWidget("Chili Gesture Menu")
	widgetHandler:DisableWidget("Chili Chat Bubbles")
	widgetHandler:DisableWidget("Chili Keyboard Menu")
	widgetHandler:DisableWidget("Chili Radial Build Menu")
	widgetHandler:DisableWidget("Chili Resource Bars Classic")
	widgetHandler:DisableWidget("Chili Economy Panel with Balance Bar")
	
	-- Enable
	widgetHandler:EnableWidget("Chili Minimap")
	widgetHandler:EnableWidget("Chili Crude Player List")
	widgetHandler:EnableWidget("Chili Integral Menu")
	widgetHandler:EnableWidget("Chili Pro Console")
	widgetHandler:EnableWidget("Chili Economy Panel Default")
	widgetHandler:EnableWidget("Chili Core Selector")
	widgetHandler:EnableWidget("Chili Selections & CursorTip")
	
	Spring.SendCommands("resbar 0")
	
	ResetOptionsFromNew()
	
	-- Settings for window positions and settings.
	local screenWidth, screenHeight = Spring.GetWindowGeometry()
	
	-- Minimap
	local minimapWidth = screenWidth*2/11
	local minimapHeight = screenWidth*2/11 + 20
	WG.Minimap_SetOptions("arwindow", 0, false, false, false)
	WG.SetWindowPosAndSize("Minimap Window", 
		0, 
		0, 
		minimapWidth,
		minimapHeight
	)

	-- Integral Menu
	local integralWidth = math.max(350, math.min(480, screenWidth*screenHeight*0.0004))
	local integralHeight = math.min(screenHeight/4.5, 200*integralWidth/450)
	WG.SetWindowPosAndSize("integralwindow",
		0,
		screenHeight - integralHeight,
		integralWidth,
		integralHeight
	)
	
	-- Selection Bar
	local selectorButtonWidth = math.min(60, screenHeight/16)
	local selectorHeight = 55*selectorButtonWidth/60
	local selectionButtonCount = math.min(12,math.max(4,math.floor(integralWidth/selectorButtonWidth)))
	local selectorWidth = selectorButtonWidth*selectionButtonCount
	WG.CoreSelector_SetOptions(selectionButtonCount)
	WG.SetWindowPosAndSize("selector_window", 
		0, 
		screenHeight - selectorHeight - integralHeight, 
		selectorWidth, 
		selectorHeight
	)
	
	-- Selections
	local selectionsHeight = integralHeight*0.85
	local selectionsWidth = 450
	Selections_SetOptions(false, true, false, GetSelectionIconSize(selectionsHeight), false, true, false)
	WG.SetWindowPosAndSize("selections",
		integralWidth,
		screenHeight - selectionsHeight,
		selectionsWidth,
		selectionsHeight
	)
	
	-- Player List
	local playerlistWidth = 296
	local playerlistHeight = 150
	WG.SetWindowPosAndSize("Player List",
		screenWidth - playerlistWidth,
		screenHeight - playerlistHeight,
		playerlistWidth,
		playerlistHeight
	)
	
	-- Chat
	local chatWidth = math.min(screenWidth*0.25, screenWidth - playerlistWidth - integralWidth)
	local chatX = math.max(integralWidth, math.min(screenWidth/2 - chatWidth/2, screenWidth - playerlistWidth - chatWidth))
	local chatY = screenHeight - 2*selectionsHeight
		
	if chatWidth + integralWidth + selectionsWidth + playerlistWidth <= screenWidth then
		chatX = integralWidth + selectionsWidth
		chatY = screenHeight - selectionsHeight
	end
	WG.SetWindowPosAndSize("ProChat",
		chatX,
		chatY,
		chatWidth,
		selectionsHeight
	)
	
	-- Menu
	local menuWidth = 380
	local menuHeight = 50
	WG.SetWindowPosAndSize("epicmenubar",
		screenWidth - menuWidth,
		0,
		menuWidth,
		menuHeight
	)
	
	-- Resource Bar
	local resourceBarWidth = math.min(screenWidth - 700, 660)
	local resourceBarHeight = 100
	local resourceBarX = math.min(screenWidth/2 - resourceBarWidth/2, screenWidth - resourceBarWidth - menuWidth)
	WG.SetWindowPosAndSize("EconomyPanelDefaultTwo",
		resourceBarX,
		0,
		resourceBarWidth,
		resourceBarHeight
	)
	
	-- Console
	local consoleWidth = math.min(screenWidth * 0.30, screenWidth - minimapWidth)
	local consoleHeight = screenHeight * 0.20
	WG.SetWindowPosAndSize("ProConsole",
		screenWidth - consoleHeight,
		resourceBarHeight,
		consoleWidth,
		consoleHeight
	)
end

----------------------------------------------------
-- New Preset
----------------------------------------------------
local function SetupNewPreset()
	-- Disable
	widgetHandler:DisableWidget("Chili Chat 2.2")
	widgetHandler:DisableWidget("Chili Deluxe Player List - Alpha 2.02")
	widgetHandler:DisableWidget("Chili FactoryBar")
	widgetHandler:DisableWidget("Chili FactoryPanel")
	widgetHandler:DisableWidget("Chili Gesture Menu")
	widgetHandler:DisableWidget("Chili Chat Bubbles")
	widgetHandler:DisableWidget("Chili Keyboard Menu")
	widgetHandler:DisableWidget("Chili Radial Build Menu")
	widgetHandler:DisableWidget("Chili Resource Bars Classic")
	widgetHandler:DisableWidget("Chili Economy Panel with Balance Bar")
	
	-- Enable
	widgetHandler:EnableWidget("Chili Minimap")
	widgetHandler:EnableWidget("Chili Crude Player List")
	widgetHandler:EnableWidget("Chili Integral Menu")
	widgetHandler:EnableWidget("Chili Pro Console")
	widgetHandler:EnableWidget("Chili Economy Panel Default")
	widgetHandler:EnableWidget("Chili Core Selector")
	widgetHandler:EnableWidget("Chili Selections & CursorTip")
	
	Spring.SendCommands("resbar 0")
	
	SetNewOptions()
	
	-- Settings for window positions and settings.
	local screenWidth, screenHeight = Spring.GetWindowGeometry()
	
	-- Minimap
	local minimapSize = screenWidth*2.1/11
	if minimapSize < 1650*2.1/11 then
		if screenWidth > 1340 then
			minimapSize = 1650*2.1/11
		else
			minimapSize = screenWidth*2.1/11
		end
	end
	WG.SetWindowPosAndSize("Minimap Window", 
		0, 
		screenHeight - minimapSize, 
		minimapSize,
		minimapSize
	)

	-- Core Selector
	if screenWidth < 1900 then
		if screenWidth > 1340 then
			WG.CoreSelector_SetOptions(5)
		else
			WG.CoreSelector_SetOptions(4)
		end
	end
	
	local _,_, selectorWidth, selectorHeight = WG.GetWindowPosAndSize("selector_window")
	WG.SetWindowPosAndSize("selector_window", 
		minimapSize, 
		screenHeight - selectorHeight, 
		selectorWidth, 
		selectorHeight
	)
	
	-- Integral Menu
	local integralWidth = math.max(350, math.min(480, screenWidth*0.4))
	local integralHeight = 20*math.floor(math.min(screenHeight/4.5, 200*integralWidth/450)/20)
	if minimapSize + selectorWidth + integralWidth < screenWidth/2 then
		local extraPadding = screenWidth/2 - (minimapSize + selectorWidth + integralWidth)
		integralWidth = screenWidth/2 - (minimapSize + selectorWidth)
	end
	
	WG.SetWindowPosAndSize("integralwindow",
		minimapSize + selectorWidth,
		screenHeight - integralHeight,
		integralWidth,
		integralHeight
	)
	
	local thinMode = screenWidth < 16345
	
	-- Selections
	local selectionsHeight = integralHeight*0.85
	local selectionsWidth = 450
	if thinMode then
		selectionsWidth = screenWidth - (minimapSize + selectorWidth + integralWidth)
	end
	
	Selections_SetOptions(false, true, false, GetSelectionIconSize(selectionsHeight), false, true, false)
	WG.SetWindowPosAndSize("selections",
		math.max(screenWidth/2, minimapSize + selectorWidth + integralWidth),
		screenHeight - selectionsHeight,
		selectionsWidth,
		selectionsHeight
	)
	
	-- Player List
	
	local playerlistWidth = 296
	local playerlistHeight = 150
	WG.SetWindowPosAndSize("Player List",
		screenWidth - playerlistWidth,
		screenHeight - playerlistHeight - ((thinMode and selectionsHeight) or 0),
		playerlistWidth,
		playerlistHeight
	)
	
	-- Chat
	WG.SetWindowPosAndSize("ProChat",
		0,
		screenHeight - minimapSize - selectionsHeight,
		minimapSize,
		selectionsHeight
	)
	
	-- Menu
	local menuWidth = 380
	local menuHeight = 50
	WG.SetWindowPosAndSize("epicmenubar",
		screenWidth - menuWidth,
		0,
		menuWidth,
		menuHeight
	)
	
	-- Resource Bar
	local resourceBarWidth = math.min(screenWidth - 700, 660)
	local resourceBarHeight = 100
	local resourceBarX = math.min(screenWidth/2 - resourceBarWidth/2, screenWidth - resourceBarWidth - menuWidth)
	WG.SetWindowPosAndSize("EconomyPanelDefaultTwo",
		resourceBarX,
		0,
		resourceBarWidth,
		resourceBarHeight
	)
	
	-- Console
	local consoleWidth = math.min(screenWidth * 0.30, screenWidth - minimapSize)
	local consoleHeight = screenHeight * 0.20
	WG.SetWindowPosAndSize("ProConsole",
		screenWidth - consoleHeight,
		resourceBarHeight,
		consoleWidth,
		consoleHeight
	)
end

----------------------------------------------------
-- Crafty Preset
----------------------------------------------------
local function SetupCraftyPreset()
	-- Disable
	widgetHandler:DisableWidget("Chili Chat 2.2")
	widgetHandler:DisableWidget("Chili Deluxe Player List - Alpha 2.02")
	widgetHandler:DisableWidget("Chili FactoryBar")
	widgetHandler:DisableWidget("Chili FactoryPanel")
	widgetHandler:DisableWidget("Chili Gesture Menu")
	widgetHandler:DisableWidget("Chili Chat Bubbles")
	widgetHandler:DisableWidget("Chili Keyboard Menu")
	widgetHandler:DisableWidget("Chili Radial Build Menu")
	widgetHandler:DisableWidget("Chili Resource Bars Classic")
	widgetHandler:DisableWidget("Chili Economy Panel with Balance Bar")
	
	-- Enable
	widgetHandler:EnableWidget("Chili Minimap")
	widgetHandler:EnableWidget("Chili Crude Player List")
	widgetHandler:EnableWidget("Chili Integral Menu")
	widgetHandler:EnableWidget("Chili Pro Console")
	widgetHandler:EnableWidget("Chili Economy Panel Default")
	widgetHandler:EnableWidget("Chili Core Selector")
	widgetHandler:EnableWidget("Chili Selections & CursorTip")
	
	Spring.SendCommands("resbar 0")
	
	ResetOptionsFromNew()
	
	-- Settings for window positions and settings.
	local screenWidth, screenHeight = Spring.GetWindowGeometry()
	
	-- Minimap
	local minimapWidth = screenWidth*9/44 + 20
	local minimapHeight = screenWidth*9/44
	WG.Minimap_SetOptions("armap", 0.8, false, true, false)
	WG.SetWindowPosAndSize("Minimap Window", 
		0, 
		screenHeight - minimapHeight, 
		minimapWidth,
		minimapHeight
	)
	
	-- Quick Selection Bar
	local selectorButtonWidth = math.min(60, screenHeight/16)
	local selectorHeight = 55*selectorButtonWidth/60
	local selectionButtonCount = math.min(12,math.max(4,math.floor(minimapWidth/selectorButtonWidth)))
	local selectorWidth = selectorButtonWidth*selectionButtonCount
	WG.CoreSelector_SetOptions(selectionButtonCount)
	WG.SetWindowPosAndSize("selector_window", 
		0, 
		screenHeight - minimapHeight - selectorHeight, 
		selectorWidth, 
		selectorHeight
	)
	
	-- Integral Menu
	local integralWidth = math.max(350, math.min(500, screenWidth*screenHeight*0.0004))
	local integralHeight = math.min(screenHeight/4.5, 200*integralWidth/450)
	WG.SetWindowPosAndSize("integralwindow",
		screenWidth - integralWidth,
		screenHeight - integralHeight,
		integralWidth,
		integralHeight
	)
	
	-- Selections
	local selectionsHeight = integralHeight*0.85
	local selectionsWidth = screenWidth - integralWidth - minimapWidth
	Selections_SetOptions(false, true, false, GetSelectionIconSize(selectionsHeight), false, true, true)
	WG.SetWindowPosAndSize("selections",
		minimapWidth,
		screenHeight - selectionsHeight,
		selectionsWidth,
		selectionsHeight
	)
	
	-- Player List
	local playerlistWidth = 296
	local playerlistHeight = 150
	WG.SetWindowPosAndSize("Player List",
		screenWidth - playerlistWidth,
		screenHeight - integralHeight - playerlistHeight,
		playerlistWidth,
		playerlistHeight
	)
	
	-- Chat
	local chatWidth = math.min(screenWidth*0.25, selectionsWidth)
	local chatX = math.max(minimapWidth, math.min(screenWidth/2 - chatWidth/2, screenWidth - integralWidth - chatWidth))
	WG.SetWindowPosAndSize("ProChat",
		chatX,
		screenHeight - 2*selectionsHeight,
		chatWidth,
		selectionsHeight
	)
	
	-- Menu
	local menuWidth = 380
	local menuHeight = 50
	WG.SetWindowPosAndSize("epicmenubar",
		0,
		0,
		menuWidth,
		menuHeight
	)
	
	-- Resource Bar
	local resourceBarWidth = 660
	local resourceBarHeight = 50
	local resourceBarX = math.min(screenWidth/2 - resourceBarWidth/2, screenWidth - resourceBarWidth - menuWidth)
	WG.SetWindowPosAndSize("EconomyPanelDefaultTwo",
		resourceBarX,
		0,
		resourceBarWidth,
		resourceBarHeight
	)
	
	-- Console
	local consoleWidth = math.min(screenWidth * 0.30, screenWidth - menuWidth - resourceBarWidth)
	local consoleHeight = screenHeight * 0.20
	WG.SetWindowPosAndSize("ProConsole",
		0,
		0,
		consoleWidth,
		consoleHeight
	)
end


----------------------------------------------------
-- Ensemble Preset
----------------------------------------------------
local function SetupEnsemblePreset()
	-- Disable
	widgetHandler:DisableWidget("Chili Chat 2.2")
	widgetHandler:DisableWidget("Chili Deluxe Player List - Alpha 2.02")
	widgetHandler:DisableWidget("Chili FactoryBar")
	widgetHandler:DisableWidget("Chili FactoryPanel")
	widgetHandler:DisableWidget("Chili Gesture Menu")
	widgetHandler:DisableWidget("Chili Chat Bubbles")
	widgetHandler:DisableWidget("Chili Keyboard Menu")
	widgetHandler:DisableWidget("Chili Radial Build Menu")
	widgetHandler:DisableWidget("Chili Resource Bars Classic")
	widgetHandler:DisableWidget("Chili Economy Panel with Balance Bar")
	
	-- Enable
	widgetHandler:EnableWidget("Chili Minimap")
	widgetHandler:EnableWidget("Chili Crude Player List")
	widgetHandler:EnableWidget("Chili Integral Menu")
	widgetHandler:EnableWidget("Chili Pro Console")
	widgetHandler:EnableWidget("Chili Economy Panel Default")
	widgetHandler:EnableWidget("Chili Core Selector")
	widgetHandler:EnableWidget("Chili Selections & CursorTip")
	
	Spring.SendCommands("resbar 0")
	
	ResetOptionsFromNew()
	
	-- Settings for window positions and settings.
	local screenWidth, screenHeight = Spring.GetWindowGeometry()
	
	-- Integral Menu
	local integralWidth = math.max(350, math.min(500, screenWidth*screenHeight*0.0004))
	local integralHeight = math.min(screenHeight/4.5, 200*integralWidth/450)
	WG.SetWindowPosAndSize("integralwindow",
		0,
		screenHeight - integralHeight,
		integralWidth,
		integralHeight
	)
	
	-- Minimap
	local minimapWidth = screenWidth*9/44 + 20
	local minimapHeight = screenWidth*9/44
	WG.Minimap_SetOptions("armap", 0.8, false, true, false)
	WG.SetWindowPosAndSize("Minimap Window", 
		screenWidth - minimapWidth, 
		screenHeight - minimapHeight, 
		minimapWidth,
		minimapHeight
	)
	
	-- Selections
	local selectionsHeight = integralHeight*0.85
	local selectionsWidth = screenWidth - integralWidth - minimapWidth
	Selections_SetOptions(false, true, false, GetSelectionIconSize(selectionsHeight), false, true, true)
	WG.SetWindowPosAndSize("selections",
		integralWidth,
		screenHeight - selectionsHeight,
		selectionsWidth,
		selectionsHeight
	)

	-- Quick Selection Bar
	local selectorButtonWidth = math.min(60, screenHeight/16)
	local selectorHeight = 55*selectorButtonWidth/60
	local selectionButtonCount = math.min(12,math.max(4,math.floor(integralWidth/selectorButtonWidth)))
	local selectorWidth = selectorButtonWidth*selectionButtonCount
	WG.CoreSelector_SetOptions(selectionButtonCount)
	WG.SetWindowPosAndSize("selector_window", 
		integralWidth, 
		screenHeight - selectionsHeight - selectorHeight, 
		selectorWidth, 
		selectorHeight
	)
	
	-- Player List
	local playerlistWidth = 296
	local playerlistHeight = 150
	WG.SetWindowPosAndSize("Player List",
		screenWidth - playerlistWidth,
		screenHeight - integralHeight - playerlistHeight,
		playerlistWidth,
		playerlistHeight
	)
	
	-- Chat
	local chatWidth = math.min(screenWidth*0.25, selectionsWidth)
	local chatX = 0
	WG.SetWindowPosAndSize("ProChat",
		chatX,
		screenHeight - integralHeight,
		chatWidth,
		selectionsHeight
	)
	
	-- Menu
	local menuWidth = 380
	local menuHeight = 50
	WG.SetWindowPosAndSize("epicmenubar",
		screenWidth - menuWidth,
		0,
		menuWidth,
		menuHeight
	)
	
	-- Resource Bar
	local resourceBarWidth = 660
	local resourceBarHeight = 50
	local resourceBarX = math.min(screenWidth/2 - resourceBarWidth/2, screenWidth - resourceBarWidth - menuWidth)
	WG.SetWindowPosAndSize("EconomyPanelDefaultTwo",
		resourceBarX,
		0,
		resourceBarWidth,
		resourceBarHeight
	)
	
	-- Console
	local consoleWidth = math.min(screenWidth * 0.30, screenWidth - menuWidth - resourceBarWidth)
	local consoleHeight = screenHeight * 0.20
	WG.SetWindowPosAndSize("ProConsole",
		0,
		0,
		consoleWidth,
		consoleHeight
	)
end

----------------------------------------------------
-- Westwood Preset
----------------------------------------------------
local function SetupWestwoodPreset()
	-- Disable
	widgetHandler:DisableWidget("Chili Chat 2.2")
	widgetHandler:DisableWidget("Chili Deluxe Player List - Alpha 2.02")
	widgetHandler:DisableWidget("Chili FactoryBar")
	widgetHandler:DisableWidget("Chili FactoryPanel")
	widgetHandler:DisableWidget("Chili Gesture Menu")
	widgetHandler:DisableWidget("Chili Chat Bubbles")
	widgetHandler:DisableWidget("Chili Keyboard Menu")
	widgetHandler:DisableWidget("Chili Radial Build Menu")
	widgetHandler:DisableWidget("Chili Resource Bars Classic")
	widgetHandler:DisableWidget("Chili Economy Panel Default")
	
	-- Enable
	widgetHandler:EnableWidget("Chili Minimap")
	widgetHandler:EnableWidget("Chili Crude Player List")
	widgetHandler:EnableWidget("Chili Integral Menu")
	widgetHandler:EnableWidget("Chili Pro Console")
	widgetHandler:EnableWidget("Chili Economy Panel with Balance Bar")
	widgetHandler:EnableWidget("Chili Core Selector")
	widgetHandler:EnableWidget("Chili Selections & CursorTip")
	
	Spring.SendCommands("resbar 0")
	
	ResetOptionsFromNew()
	
	-- Settings for window positions and settings.
	local screenWidth, screenHeight = Spring.GetWindowGeometry()
	
	-- Resource Bar
	local resourceBarWidth = screenWidth*5/22 + 20
	local resourceBarHeight = 65
	local resourceBarX = screenWidth - resourceBarWidth
	WG.SetWindowPosAndSize("EconomyPanelDefaultTwo",
		resourceBarX,
		0,
		resourceBarWidth,
		resourceBarHeight
	)
	
	-- Minimap
	local minimapWidth = resourceBarWidth
	local minimapHeight = screenWidth*1/4
	WG.Minimap_SetOptions("armap", 0.8, false, true, false)
	WG.SetWindowPosAndSize("Minimap Window", 
		screenWidth - minimapWidth, 
		resourceBarHeight, 
		minimapWidth,
		minimapHeight
	)
	
	-- Integral Menu
	local integralWidth = math.max(350, math.min(500, resourceBarWidth))
	local integralHeight = math.min(screenHeight/4.5, 200*integralWidth/450)
	WG.SetWindowPosAndSize("integralwindow",
		screenWidth - integralWidth,
		resourceBarHeight + minimapHeight,
		integralWidth,
		integralHeight
	)
	
	-- Selections
	local selectionsHeight = integralHeight*0.85
	local selectionsWidth = resourceBarWidth
	Selections_SetOptions(false, true, false, GetSelectionIconSize(selectionsHeight), false, true, true)
	WG.SetWindowPosAndSize("selections",
		screenWidth - selectionsWidth,
		screenHeight - selectionsHeight,
		selectionsWidth,
		selectionsHeight
	)
	
	-- Quick Selection Bar
	local selectorButtonWidth = math.min(60, screenHeight/16)
	local selectorHeight = 55*selectorButtonWidth/60
	local selectionButtonCount = math.min(12,math.max(4,math.floor(resourceBarWidth/selectorButtonWidth)))
	local selectorWidth = selectorButtonWidth*selectionButtonCount
	WG.CoreSelector_SetOptions(selectionButtonCount)
	WG.SetWindowPosAndSize("selector_window", 
		screenWidth - selectionsWidth, 
		screenHeight - selectionsHeight - selectorHeight, 
		selectorWidth, 
		selectorHeight
	)
	
	-- Player List
	local playerlistWidth = 296
	local playerlistHeight = 150
	WG.SetWindowPosAndSize("Player List",
		screenWidth - playerlistWidth - selectionsWidth,
		screenHeight - playerlistHeight,
		playerlistWidth,
		playerlistHeight
	)
	
	-- Chat
	local chatWidth = math.min(screenWidth*0.25, selectionsWidth)
	local chatX = 0
	WG.SetWindowPosAndSize("ProChat",
		chatX,
		screenHeight,
		chatWidth,
		selectionsHeight
	)
	
	-- Menu
	local menuWidth = 380
	local menuHeight = 50
	WG.SetWindowPosAndSize("epicmenubar",
		0,
		0,
		menuWidth,
		menuHeight
	)
	
	-- Console
	local consoleWidth = math.min(screenWidth * 0.30, screenWidth - menuWidth - resourceBarWidth)
	local consoleHeight = screenHeight * 0.20
	WG.SetWindowPosAndSize("ProConsole",
		0,
		0,
		consoleWidth,
		consoleHeight
	)
end

----------------------------------------------------
-- Options
----------------------------------------------------
options_path = 'Settings/HUD Presets'
options_order = {'setToDefault', 'maintainDefaultUI', 'maintainNewUI', 'presetlabel', 'interfacePresetDefault', 'interfacePresetNew', 'interfacePresetCrafty', 'interfacePresetEnsemble', 'interfacePresetWestwood'}
options = {
	setToDefault = {
		name  = "Set To Default Once",
		type  = "bool", 
		value = true, 
		desc = "Resets the HUD to the default next time this widget is initialized.",
		advanced = true,
		noHotkey = true,
	},
	maintainDefaultUI = {
		name  = "Reset on screen resolution change",
		type  = "bool", 
		value = false, 
		desc = "Resets the UI to default when screen resolution changes. Disable if you plan to customise your UI.",
		noHotkey = true,
	},
	maintainNewUI = {
		name  = "Set New on screen resolution change",
		type  = "bool", 
		value = false, 
		desc = "Sets the UI to New when the screen resolution changes. Disable if you plan to customise your UI.",
		noHotkey = true,
	},
	presetlabel = {
		name = "presetlabel",
		type = 'label', 
		value = "Presets", 
	},
	interfacePresetDefault = {
		name = "Default",
		desc = "The default interface.",
		type = 'button',
		OnChange = SetupDefaultPreset,
	},
	interfacePresetNew = {
		name = "New",
		desc = "The WIP new interface.",
		type = 'button',
		OnChange = SetupNewPreset,
	},
	interfacePresetCrafty = {
		name = "Crafty",
		desc = "Interface reminiscent of the craft of war and stars.",
		type = 'button',
		OnChange = SetupCraftyPreset,
	},
	interfacePresetEnsemble = {
		name = "Ensemble",
		desc = "Interface reminiscent of the imperial ages.",
		type = 'button',
		OnChange = SetupEnsemblePreset,
	},
	interfacePresetWestwood = {
		name = "Westwood",
		desc = "Interface reminiscent of the conquest of dunes.",
		type = 'button',
		OnChange = SetupWestwoodPreset,
	},
}

----------------------------------------------------
-- Callins
----------------------------------------------------
local firstUpdate = true
local timeSinceUpdate = 0
local UPDATE_FREQUENCY = 5
local oldWidth = 0
local oldHeight = 0

function widget:Update(dt)
	if firstUpdate then
		if options.setToDefault.value then
			-- This is where the defaults are set.
			SetupDefaultPreset()
			options.setToDefault.value = false
		end
		
		if options.maintainDefaultUI.value or options.maintainNewUI.value then
			local screenWidth, screenHeight = Spring.GetWindowGeometry()
			oldWidth = screenWidth
			oldHeight = screenHeight
			if options.maintainDefaultUI.value then
				SetupDefaultPreset()
			else
				SetupNewPreset()
			end
		end
		
		firstUpdate = false
	end
	
	if options.maintainDefaultUI.value or options.maintainNewUI.value then
		timeSinceUpdate = timeSinceUpdate + dt 
		if timeSinceUpdate > UPDATE_FREQUENCY then
			local screenWidth, screenHeight = Spring.GetWindowGeometry()
			if oldWidth ~= screenWidth or oldHeight ~= screenHeight then
				oldWidth = screenWidth
				oldHeight = screenHeight
				if options.maintainDefaultUI.value then
					SetupDefaultPreset()
				else
					SetupNewPreset()
				end
			end
			timeSinceUpdate = 0
		end
	end
end

function widget:ViewResize(screenWidth, screenHeight)
	if options.maintainDefaultUI.value then
		oldWidth = screenWidth
		oldHeight = screenHeight
		SetupDefaultPreset()
	end
end

function widget:GetConfigData()
	local screenWidth, screenHeight = Spring.GetWindowGeometry()
	return {oldScreenWidth = screenWidth, oldScreenHeight = screenHeight}
end

function widget:SetConfigData(data)
	if data then
		oldWidth = data.oldScreenWidth or 0
		oldHeight = data.oldScreenHeight or 0
	end
end