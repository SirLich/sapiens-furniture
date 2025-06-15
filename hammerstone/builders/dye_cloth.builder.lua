-- @author SirLich

local gen = {}

-- Hammerstone
local moduleManager = mjrequire "hammerstone/state/moduleManager"
local utils = mjrequire "hammerstone/utils/utils"

-- Math
local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity

---------------------------------------------------------------------------------
-- Data
---------------------------------------------------------------------------------

local data = mjrequire "furniture/data"


---------------------------------------------------------------------------------
-- Helper Functions
---------------------------------------------------------------------------------

local function generateCloth(color)
	local identifier = color .. "_cloth"
	local name = utils:capsCase(color .. " cloth")
	return {
		description = {
			identifier = identifier,
			name = name,
			plural = name,
			summary = "cloth_summary"
		},
		components = {
			hs_object = {
				model = identifier,
				link_to_resource = "cloth" -- Defined in it's own file
			}
		}
	}
end

local function generateDye(color)
	local identifier = color .. "_dye"
	local name = utils:capsCase(color .. " dye")
	return {
		description = {
			identifier = identifier,
			name = name,
			plural = name,
			summary = "dye_summary"
		},
		components = {
			hs_object = {
				model = identifier,
				link_to_resource = "dye" -- Defined in it's own file
			}
		}
	}
end

-- Flattens the inner resources into a new list. So returns `flax` and `poppyFlower` (etc), without 'red_dye' (etc)
local function flattenIngrediants()
	local out = {}
	for key, value in pairs(data.dyeIngredients) do
		for i, ingrediant in ipairs(value) do
			table.insert(out, ingrediant)
		end
	end
	return out
end


---------------------------------------------------------------------------------
-- Generators
---------------------------------------------------------------------------------

-- @override
function gen:getResourceGroups()
	return {
		{
			identifier = "dye_ingredients",
			display_object = "red_dye",
			resources = flattenIngrediants()
		}
	}
end

-- @override
function gen:getModelRemaps()
	local out = {}


	for i, color in ipairs(data.colors) do
		local dye_identifier = color .. "_dye"
		local cloth_identifier = color .. "_cloth"
		local carpet_identifier = color .. "_carpetSection"
		local clothDoorLeft_identifier = color .. "_clothDoorSection_left"
		local clothDoorRight_identifier = color .. "_clothDoorSection_right"
		local tapestry_identifier = color .. "_tapestry"
		local tapestryHangings_identifier = color .. "_tapestryHangings"

		-- Default shared material remaps
		local materialRemaps = {
			brown_dye = dye_identifier,
			brown_dye_dark = dye_identifier .. "_dark"
		}

		table.insert(out, {
			model = dye_identifier,
			base_model ="firedBowlFilled",
			material_remaps = {
				grain = dye_identifier
			}
		})

		table.insert(out,{
			model = cloth_identifier,
			base_model =  "cloth",
			material_remaps = materialRemaps
		})

		table.insert(out,{
			model = carpet_identifier,
			base_model =  "carpetSection",
			material_remaps = materialRemaps
		})

		table.insert(out,{
			model = clothDoorLeft_identifier,
			base_model =  "clothDoorSection_left",
			material_remaps = materialRemaps
		})

		table.insert(out,{
			model = clothDoorRight_identifier,
			base_model =  "clothDoorSection_right",
			material_remaps = materialRemaps
		})

		table.insert(out,{
			model = tapestry_identifier,
			base_model =  "tapestry",
			material_remaps = materialRemaps
		})

		table.insert(out,{
			model = tapestryHangings_identifier,
			base_model =  "tapestryHangings",
			material_remaps = materialRemaps
		})
	end

	return out
end

local function addMaterialColor(out, name, a, b, c)
	table.insert(out,{
		identifier =  name .. "_dye",
		color = {
			a, b, c
		},
		roughness = 0.7
	})

	local strength = 0.5;
	table.insert(out,{
		identifier =  name .. "_dye_dark",
		color = {
			a * strength, b * strength, c * strength
		},
		roughness = 0.7
	})
end

-- @override
function gen:getMaterials()
	local out = {}

	addMaterialColor(out, "red", 0.56, 0.1725, 0.1725)
	addMaterialColor(out, "orange", 199/255, 125/255, 14/255)
	addMaterialColor(out, "yellow", 207/255, 214/255, 79/255)
	addMaterialColor(out, "green", 39/255, 97/255, 41/255)
	addMaterialColor(out, "blue", 0.215, 0.3411, 0.5493)
	addMaterialColor(out, "pink", 171/255, 91/255, 168/255)
	addMaterialColor(out, "purple", 96/255, 66/255, 150/255)
	addMaterialColor(out, "brown", 0.3803,0.215, 0.1411)


	return out
end

-- @override
function gen:getObjectConfigs()
	local configs = {}
	for i, color in ipairs(data.colors) do
		table.insert(configs, i, generateDye(color))
	end

	for i, color in ipairs(data.colors) do
		table.insert(configs, i, generateCloth(color))
	end
	return configs
end


return gen