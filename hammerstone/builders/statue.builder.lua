local builder = {}

local typeMaps = mjrequire "common/typeMaps"
local constructableTypeIndexMap = typeMaps.types.constructable
local data = mjrequire "furniture/data"

local utils = mjrequire "hammerstone/utils/utils"
local moduleManager = mjrequire "hammerstone/state/moduleManager"

local mainStatue = "alpaca"
local statueTypes = {
	"mammoth",
	"chicken"
}

-- A list of basic models, which need to be remaped
local baseModels = {
	"statue_base",
	"statue_mammoth",
	"statue_alpaca",
	"statue_chicken"
}

--- statueIdentifier = e.g. statue_alpaca
local function getRemaps(statueIdentifier)
	local remapTable = {}
	for _, stoneType in ipairs(data.stoneTypes) do
		remapTable[stoneType .. "_stoneStock"] = stoneType .. "_" .. statueIdentifier -- 'sandstoneYellowRock_stoneStock' = 'sandstoneYellowRock_statue_alpaca' etc.
	end
	return remapTable
end

local function generateModelRemap(baseModel, stoneType)
	local modelModule = moduleManager:get("model")
	local newModel = stoneType .. "_" .. baseModel -- E.g., sandstoneYellowRock_statue_alpaca

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

function builder:getModelRemaps()
	local configs = {}
	for _, baseModel in ipairs(baseModels) do
		for _, stoneType in ipairs(data.stoneTypes) do
			table.insert(configs, generateModelRemap(baseModel, stoneType))
		end
	end

	return configs
end

local function generateObject(statueType, isMain)
	local identifier = "statue_" .. statueType

	function getVariations()
		if isMain then
			return {
					"statue_alpaca",
					"statue_mammoth",
					"statue_chicken"
				}
		end

		return nil
	end

	local result = {
		debug = true,
		description = {
			identifier = identifier,
			name = identifier .. "_name",
			plural = "Statues",
			summary = "Stone carved offering."
		},
		components = {
			hs_object = {
				model = "build_" .. statueType -- e.g., build_alpaca
			},
			hs_buildable = {
				skill = "chiselStone",
				tool = "softChiselling",
				build_sequence = "clearObjectsAndTerrainSequence",
				classification = "build",
				variation_name = "Stone Statue",
				variations = getVariations(),
				hidden = not isMain,
				rebuild_group = "statue",
				resources = {
					{
						resource = "stoneStock",
						count = 2
					}
				},
				model_placeholder = {
					{
						key = "stoneStock_1",
						default_model = "statue_base",
						resource = "stoneStock",
						remaps = getRemaps("statue_base")
					},
					{
						key = "stoneStock_2",
						default_model = identifier,
						resource = "stoneStock",
						remaps = getRemaps(identifier)
					},
					{
						key = "stoneStock_store",
						is_store = true
					}
				}
			}
		}
	}

	return result
end

function builder:getObjectConfigs()
	local configs = {}
	for _, statueType in ipairs(statueTypes) do
		table.insert(configs, generateObject(statueType, false))
	end
	table.insert(configs, generateObject(mainStatue, true))

	return configs
end

return builder
