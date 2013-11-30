--[[
Copyright (C) 2012-2013 Spacebuild Development Team

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]--
-- Created by IntelliJ IDEA.
-- User: Sam
-- Date: 16/12/12
-- Time: 8:28 AM
-- To change this template use File | Settings | File Templates.
--
SBEP.FolderName = "SBEP"


--TODO: Create a way to check FolderName (SBEP or SBMP)
--TODO: Get Better icons...
--TODO: Maybe load names from line 1 of each file
--TODO: Either write a function to lower case the whole file or lower case them using Npp.

function LoadContent( mode, pnl, ViewPanel,pnlContent  )
	ViewPanel:Clear( true )

	DebugMessage(mode)
	local data = file.Read("addons\\"..SBEP.FolderName.. "\\data\\modellists\\"..mode,"GAME")
		local models = util.KeyValuesToTable(data)
		for i,j in ipairs(models) do
			--Based off Vanilla GMod Code
			local cp = spawnmenu.GetContentType( "model" )
			if (cp) then
				cp( ViewPanel, {model = j})
			end
		end
	pnlContent:SwitchPanel( ViewPanel )
end

function LoadAllContent( mode, pnl )
	local lists = file.Find("addons\\"..SBEP.FolderName.. "\\data\\modellists\\"..mode.."\\*","GAME")

	for k,v in ipairs(lists) do
		local data = file.Read("addons\\"..SBEP.FolderName.. "\\data\\modellists\\"..mode.."\\"..v,"GAME")
		local models = util.KeyValuesToTable(data)
		for i,j in ipairs(models) do
			--Based off Vanilla GMod Code
			local cp = spawnmenu.GetContentType( "model" )
			if (cp) then
				cp( pnl, {model = j})
			end
		end
	end
end

function DoMedbridge( pnlContent, tree, node, MainNode, ViewPanel )



	local MedNode = MainNode:AddNode( "MedBridge Parts", "icon16/folder_database.png")
	MedNode.DoClick = function()
	--TODO: Show all SmallBridge models.
		ViewPanel:Clear( true )
		LoadAllContent( "med",ViewPanel )
		pnlContent:SwitchPanel( ViewPanel )
	end
	--Then cycle through all folders under Data\ModelListt\SMB)
	local path = "addons\\"..SBEP.FolderName.. "\\data\\modellists\\med\\"
	local lists = file.Find(path .. "*","GAME")

	for k,v in ipairs(lists) do

		local temp = string.Explode( ".txt", v )
		local name = temp[1]
		local MyNode = MedNode:AddNode( name, "icon16/folder_database.png") --TODO: Find better image.
		MyNode.DoClick = function() LoadContent("med\\"..v.."", MyNode, ViewPanel,pnlContent ) end


	end

end

function DoSmallBridge( pnlContent, tree, node, ViewPanel  )

	local MyNode = node:AddNode( "SBEP Models", "icon16/folder_database.png" )

	local SmbNode = MyNode:AddNode( "SmallBridge Parts", "icon16/folder_database.png")
	SmbNode.DoClick = function()
	--TODO: Show all SmallBridge models.
		ViewPanel:Clear( true )
		LoadAllContent( "smb",ViewPanel )
		pnlContent:SwitchPanel( ViewPanel )
	end
	--Then cycle through all folders under Data\ModelListt\SMB)
	local path = "addons\\"..SBEP.FolderName.. "\\data\\modellists\\smb\\"
	local lists = file.Find(path .. "*","GAME")



	--[[if ( cp ) then
		cp( ViewPanel, { model = [Read from file] )
	end  ]]--
	for k,v in ipairs(lists) do

		local temp = string.Explode( ".txt", v )
		local name = temp[1]
		local MyNode = SmbNode:AddNode( name, "icon16/folder_database.png") --TODO: Find better image.
		MyNode.DoClick = function() LoadContent("smb\\"..v.."", MyNode, ViewPanel,pnlContent ) end
	end

	--Then setup what happens when you click on each node
	return MyNode

end

function DoModBridge( pnlContent, tree, node, MainNode, ViewPanel )


	local ModNode = MainNode:AddNode( "ModBridge Parts", "icon16/folder_database.png")
	ModNode.DoClick = function()
	--TODO: Show all SmallBridge models.
		ViewPanel:Clear( true )
		LoadAllContent( "mod",ViewPanel )
		pnlContent:SwitchPanel( ViewPanel )
	end
	--Then cycle through all folders under Data\ModelListt\SMB)
	local path = "addons\\"..SBEP.FolderName.. "\\data\\modellists\\mod\\"
	local lists = file.Find(path .. "*","GAME")

	for k,v in ipairs(lists) do

		local temp = string.Explode( ".txt", v )
		local name = temp[1]
		local MyNode = ModNode:AddNode( name, "icon16/folder_database.png") --TODO: Find better image.
		MyNode.DoClick = function() LoadContent("mod\\"..v.."", MyNode, ViewPanel,pnlContent ) end


	end

end

function DoSBMP( pnlContent, tree, node, MainNode, ViewPanel )
	local SBMPNode = MainNode:AddNode( "SBMP Parts", "icon16/folder_database.png")
	SBMPNode.DoClick = function()
	--TODO: Show all SmallBridge models.
		ViewPanel:Clear( true )
		LoadAllContent( "sbmp",ViewPanel )
		pnlContent:SwitchPanel( ViewPanel )
	end
	--Then cycle through all folders under Data\ModelListt\SMB)
	local path = "addons\\"..SBEP.FolderName.. "\\data\\modellists\\sbmp\\"
	local lists = file.Find(path .. "*","GAME")

	for k,v in ipairs(lists) do

		local temp = string.Explode( ".txt", v )
		local name = temp[1]
		local MyNode = SBMPNode:AddNode( name, "icon16/folder_database.png") --TODO: Find better image.
		MyNode.DoClick = function() LoadContent("sbmp\\"..v.."", MyNode, ViewPanel,pnlContent ) end


	end

end

function DoOther( pnlContent, tree, node, MainNode, ViewPanel )
	local OtherNode = MainNode:AddNode( "Other", "icon16/folder_database.png")
	OtherNode.DoClick = function()
	--TODO: Show all SmallBridge models.
		ViewPanel:Clear( true )
		LoadAllContent( "other",ViewPanel )
		pnlContent:SwitchPanel( ViewPanel )
	end
	--Then cycle through all folders under Data\ModelListt\SMB)
	local path = "addons\\"..SBEP.FolderName.. "\\data\\modellists\\other\\"
	local lists = file.Find(path .. "*","GAME")

	for k,v in ipairs(lists) do

		local temp = string.Explode( ".txt", v )
		local name = temp[1]
		local MyNode = OtherNode:AddNode( name, "icon16/folder_database.png") --TODO: Find better image.
		MyNode.DoClick = function() LoadContent("other\\"..v.."", MyNode, ViewPanel,pnlContent ) end


	end

end


hook.Add("PopulateContent", "SBEP Models", function( pnlContent, tree, node)
	--Setup SmallBridge
	local ViewPanel = vgui.Create( "ContentContainer", pnlContent )
	ViewPanel:SetVisible(false)
	local MasterNode = DoSmallBridge( pnlContent, tree, node, ViewPanel )

	--Start of Medbridge Node
	DebugMessage("Doing Medbridge")
	DoMedbridge( pnlContent, tree, node, MasterNode, ViewPanel )


	DebugMessage("Doing ModBridge")
	DoModBridge( pnlContent, tree, node, MasterNode, ViewPanel )

	DebugMessage("Doing SBMP")
	DoSBMP( pnlContent, tree, node, MasterNode, ViewPanel )

	DebugMessage("Doing Anything contained in the Other folder")
	DoOther( pnlContent, tree, node, MasterNode, ViewPanel )

--local models = MyNode:AddNode( v:sub(1,1):upper()..v:sub(2), "icon16/bricks.png"
end)


