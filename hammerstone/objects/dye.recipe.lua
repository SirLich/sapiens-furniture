local data = mjrequire "furniture/data"
local moduleManager = mjrequire "hammerstone/state/moduleManager"
local gameObjectModule =  moduleManager:get("gameObject")

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity

local function generateOutputByObject()
	local out = {}

	for dye_name, dye_values in pairs(data.dyeIngredients) do
		for i, ingrediant in ipairs(dye_values) do
			out[ingrediant] = {
				dye_name
			}
		end
	end

	return out
end

return {
	description = {
		identifier = "red_dye",
		name = "Dye",
		plural = "Dye",
		summary = "A bowl of pigment which can be used to dye fabric."
	},
	components = {
		hs_craftable = {
			skill = "medicine",
			research = "potteryFiring",
			tool = "grinding",

			build_model = "craftMedicine",
			build_sequence = "grindingSequence",

			props = {
				placeBuildObjectsInFinalLocationsOnDropOff = true,
				dontPickUpRequiredTool = true,
				temporaryToolObjectType = gameObjectModule.typeIndexMap.rockSmall,
				temporaryToolOffset = vec3(0.0,0.01,0.0),
				temporaryToolRotation = mat3Identity,
			},
			hs_output = {
				output_by_object = generateOutputByObject()
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
			}
		}
	}
}