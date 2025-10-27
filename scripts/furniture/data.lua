--- Furniture: data.lua
--- @author SirLich

local moduleManager = mjrequire "hammerstone/state/moduleManager"

local data = {
	dyeIngredients = {
		red_dye = {
			"poppyFlower",
			"beetroot",
			"raspberry"
		},
		orange_dye = {
			"pumpkin",
			"orange",
		},
		yellow_dye = {
			"marigoldFlower",
			"turmericRoot"
		},
		green_dye = {
			"aloeLeaf"
		},
		blue_dye ={
			"flax"
		},
		purple_dye ={
			"elderberry"
		},
		pink_dye ={
			"echinaceaFlower"
		},
	},

	colors = {
		"red",
		"orange",
		"yellow",
		"green",
		"blue",
		"purple",
		"pink",
		"brown"
	},

	woodTypes = {
		"aspen",
		"birch",
	
		"bamboo",
		"coconut",
	
		"pine",
	
		"willow",
		"peach",
		"orange",
		"apple",
		"elderberry"
	},

	stoneTypes = {
		"rock",
		"limestone",
		"sandstoneYellowRock",
		"sandstoneRedRock",
		"sandstoneOrangeRock",
		"sandstoneBlueRock",
		"redRock",
		"greenRock",
		"graniteRock",
		"marbleRock",
		"lapisRock"
	},

	stoneIngredients = {
		
	}
}

function data:getRemaps(baseModel, underscore)
	local remapTable = {}
	for _, woodType in ipairs(data.woodTypes) do
		if underscore then
			remapTable[woodType .. "_woodStock"] = woodType .. "_" .. baseModel -- 'aspen_woodStock' = 'aspen_chairBack' etc.
		else
			remapTable[woodType .. "_woodStock"] = woodType .. baseModel -- 'aspen_woodStock' = 'aspenChairBack' etc.
		end
	end
	return remapTable
end

-- Creates remap data for models that are built using cloth.
-- Intended to be used inside of the constructable.
function data:getClothRemaps(baseModel)
	local remapTable = {}
	for _, color in ipairs(data.colors) do
		remapTable[color .. "_cloth"] = color .. "_" .. baseModel -- 'blue_cloth' = 'blue_alpaca_tapestry' etc.
	end
	return remapTable
end

-- Creates remap data (to be used within builder:getModelRemaps())
-- base model e.g., 
function data:createClothModelRemaps(models)
	local out = {}
	
	for _, color in ipairs(data.colors) do
		for _, model in ipairs(models) do

			local dye_identifier = color .. "_dye"

			-- Default shared material remaps
			local materialRemaps = {
				brown_dye = dye_identifier,
				brown_dye_dark = dye_identifier .. "_dark"
			}

			table.insert(out,{
				model = color .. "_" .. model,
				base_model =  model,
				material_remaps = materialRemaps
			})
		end

	end

	return out
end

return data