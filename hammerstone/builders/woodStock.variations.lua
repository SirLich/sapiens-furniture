local builder = {}

-- Hammerstone
local moduleManager = mjrequire "hammerstone/state/moduleManager"

-- The list of all wood types
local woodTypes = {
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
}

-- A list of basic models, which need to be remaped
local baseModels = {
	"woodStock",
	"chairBack",
	"chairLeg",
	"chairSeat"
}

local materialsByWoodType = {
	aspen = {
		wood_base = "wood",
		wood_bark = "whiteTrunk"
	},
	birch = {
		wood_base = "wood",
		wood_bark = "whiteTrunk"
	},

	bamboo = {
		wood_base = "bamboo",
		wood_bark = "bambooDark"
	},
	coconut = {
		wood_base = "coconutWood",
		wood_bark = "coconutBark"
	},

	pine = {
		wood_base = "wood",
		wood_bark = "trunk"
	},

	willow = {
		wood_base = "willowWood",
		wood_bark = "darkBark"
	},
	peach = {
		wood_base = "peachWood",
		wood_bark = "peachBark"
	},
	orange = {
		wood_base = "orangeWood",
		wood_bark = "orangeBark"
	},
	apple = {
		wood_base = "appleWood",
		wood_bark = "appleBark"
	},
	elderberry = {
		wood_base = "elderberryWood",
		wood_bark = "elderberryBark"
	}
}

local function generateModelRemap(baseModel, woodType)
	local modelModule = moduleManager:get("model")
	local newModel = baseModel .. "_" .. woodType

	-- If the model exists, then don't create a remap
	if modelModule:doesModelExist(newModel) then
		return nil
	end

	return {
		base_model = baseModel,
		model = newModel,
		material_remaps = materialsByWoodType[woodType]
	}
end

local function generateObject(woodType)
	local identifier = woodType .. "_woodStock"
	return {
		description = {
			identifier = identifier,
			name = identifier,
			plural = identifier,
			summary = "woodStock_summary"
		},
		components = {
			hs_object = {
				model = identifier,
				link_to_resource = "woodStock" -- Link to woodstsock resource, defined in its own config
			}
		}
	}
end

function builder:getObjectConfigs()
	local configs = {}
	for _, woodType in ipairs(woodTypes) do
		table.insert(configs, generateObject(woodType))
	end
	return configs
end

function builder:getModelRemaps()
	local configs = {}
	for _, baseModel in ipairs(baseModels) do
		for _, woodType in ipairs(woodTypes) do
			table.insert(configs, generateModelRemap(baseModel, woodType))
		end
	end

	return configs
end


return builder