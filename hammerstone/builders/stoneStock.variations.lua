local builder = {}

-- Hammerstone
local moduleManager = mjrequire "hammerstone/state/moduleManager"

local stoneTypes = {
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
}

-- A list of basic models, which need to be remaped
local baseModels = {
	"stoneStock"
}


local function generateModelRemap(baseModel, stoneType)
	local modelModule = moduleManager:get("model")
	local newModel = stoneType .. "_" .. baseModel

	-- If the model exists, then don't create a remap
	if modelModule:doesModelExist(newModel) then
		return nil
	end

	return {
		base_model = baseModel,
		model = newModel,
		material_remaps = {
			rock = stoneType
		}
	}
end

local function generateObject(stoneType)
	local identifier = stoneType .. "_stoneStock"
	return {
		description = {
			identifier = identifier,
			name = identifier,
			plural = identifier,
			summary = "stoneStock_summary"
		},
		components = {
			hs_object = {
				model = identifier,
				link_to_resource = "stoneStock" -- Link to woodstsock resource, defined in its own config
			}
		}
	}
end

function builder:getObjectConfigs()
	local configs = {}
	for _, woodType in ipairs(stoneTypes) do
		table.insert(configs, generateObject(woodType))
	end
	return configs
end

function builder:getModelRemaps()
	local configs = {}
	for _, baseModel in ipairs(baseModels) do
		for _, woodType in ipairs(stoneTypes) do
			table.insert(configs, generateModelRemap(baseModel, woodType))
		end
	end

	return configs
end


return builder