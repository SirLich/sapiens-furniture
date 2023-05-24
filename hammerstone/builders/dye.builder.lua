-- @author SirLich

local gen = {}

-- Hammerstone
local moduleManager = mjrequire "hammerstone/state/moduleManager"

-- Math
local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity

---------------------------------------------------------------------------------
-- Data
---------------------------------------------------------------------------------

local dyeIngredients = {
	red_dye = {
		"poppyFlower",
		"beetroot"
	},
	blue_dye ={
		"flax"
	}
}

-- Extend dye colors with additional colors
local colors = {
	"blue",
	"red"
}


---------------------------------------------------------------------------------
-- Helper Functions
---------------------------------------------------------------------------------

local function generateCloth(color)
	local identifier = color .. "_cloth"
	return {
		description = {
			identifier = identifier
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
	return {
		description = {
			identifier = identifier
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
	for key, value in pairs(dyeIngredients) do
		for i, ingrediant in ipairs(value) do
			table.insert(out, ingrediant)
		end
	end
	return out
end

local function generateOutputByObject()
	local out = {}

	for key, value in pairs(dyeIngredients) do
		for i, ingrediant in ipairs(value) do
			table.insert(out, {
				input = ingrediant,
				output = {
					key
				}
			})
		end
	end

	return out
end

local function generateClothOutputByObject()
	local out = {}

	for i, color in ipairs(colors) do
		table.insert(out, {
			input = color .. "_dye",
			output = {
				color .. "_cloth"
			}
		})
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

	for i, color in ipairs(colors) do
		local dye_identifier = color .. "_dye"
		local cloth_identifier = color .. "_cloth"
		local carpet_identifier = color .. "_carpetSection"


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
			material_remaps = {
				cloth = dye_identifier
			}
		})

		table.insert(out,{
			model = carpet_identifier,
			base_model =  "carpetSection",
			material_remaps = {
				brown_dye = dye_identifier
			}
		})
	end

	return out
end

-- @override
function gen:getMaterials()
	return {
		{
			identifier =  "red_dye",
			color = {
				0.5607843137254902, 0.17254901960784313, 0.17254901960784313
			},
			roughness = 0.7
		},
		{
			identifier =  "brown_dye",
			color = {
				0.3803921568627451,0.21568627450980393, 0.1411764705882353
			},
			roughness = 0.7
		},
		{
			identifier = "blue_dye",
			color = {
				0.21568627450980393, 0.3411764705882353, 0.5490196078431373
			},
			roughness = 0.7
		},
	}
end

-- @override
function gen:getObjectConfigs()
	local configs = {}
	for i, color in ipairs(colors) do
		table.insert(configs, i, generateDye(color))
	end

	for i, color in ipairs(colors) do
		table.insert(configs, i, generateCloth(color))
	end
	return configs
end


-- @override
function gen:getRecipeConfigs()
	local gameObject = moduleManager:get("gameObject")
	return {
		{
			description = {
				identifier = "dye_recipe",
				name = "Craft Dye"
			},
			components = {
				hs_recipe = {
					display_object = "red_dye",
					classification = "craft",
					props = {
						dontPickUpRequiredTool = true,
						temporaryToolObjectType = gameObject.typeIndexMap.rockSmall,
						temporaryToolOffset = vec3(0.0,0.01,0.0),
						temporaryToolRotation = mat3Identity,
						placeBuildObjectsInFinalLocationsOnDropOff = true,
					}
				},
				hs_requirements = {
					skills = {
						"grinding"
					},
					resources = {
						{
							resource = "firedBowl",
							action = {
								action_type = "inspect",
								duration = 0.4,
								duration_without_skill = 15
							}
						},
						{
							resource_group = "dye_ingredients",
							action = {
								action_type = "inspect",
								duration = 0.4,
								duration_without_skill = 15
							}
						}
					},
					tools = {
						"grinding"
					}
				},
				hs_output = {
					output_by_object = generateOutputByObject()
				},
				hs_build_sequence = {
					build_model = "craftMedicine",
					build_sequence = "grindingSequence"
				}
			}
		},
		{
			description = {
				identifier = "dye_cloth_recipe",
				name = "Dye the Cloth",
				summary = "Dye the cloth!"
			},
			components = {
				hs_recipe = {
					display_object = "red_cloth",
					classification = "craft",
					props = {
						dontPickUpRequiredTool = true,
						temporaryToolObjectType = gameObject.typeIndexMap.rockSmall,
						temporaryToolOffset = vec3(0.0,0.01,0.0),
						temporaryToolRotation = mat3Identity,
						placeBuildObjectsInFinalLocationsOnDropOff = true,
					}
				},
				hs_requirements = {
					skills = {
						"grinding"
					},
					resources = {
						{
							resource = "dye",
							action = {
								action_type = "inspect",
								duration = 0.4,
								duration_without_skill = 15
							}
						},
						{
							resource = "cloth",
							action = {
								action_type = "inspect",
								duration = 0.4,
								duration_without_skill = 15
							}
						}
					},
					tools = {
						"grinding"
					}
				},
				hs_output = {
					output_by_object = generateClothOutputByObject()
				},
				hs_build_sequence = {
					build_model = "craftMedicine",
					build_sequence = "grindingSequence"
				}
			}
		}
	}
end

return gen