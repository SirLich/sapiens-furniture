local data = mjrequire "furniture/data"


local function generateOutputByObject()
	local out = {}

	for key, value in pairs(data.dyeIngredients) do
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

return {
	description = {
		identifier = "dye"
	},
	components = {
		hs_resource = {
			display_object = "red_dye", -- TODO
			storage_identifier = "bowl"
		},
		-- hs_craftable = {
		-- 	skill = "boneCarving",
		-- 	tool = "carving",
		-- 	action_sequence = "scrapeWood",
		-- 	hs_output = {
		-- 		simple_output = {"bone_meal"}
		-- 	},
		-- 	resources = {
		-- 		{
		-- 			resource = "bone",
		-- 			count = 3,
		-- 			action = {
		-- 				action_type = "knap",
		-- 				duration = 0.5,
		-- 				duration_without_skill = 15
		-- 			}
		-- 		}
		-- 	}
		-- }
		-- hs_craftable = {
		-- 	skill = "grinding",
			
		-- 	build_model = "craftMedicine",
		-- 	build_sequence = "grindingSequence",

		-- 	tool = "grinding",
		-- 	hs_output = {
		-- 		simple_output = {
		-- 			"red_dye"
		-- 		}
		-- 		-- output_by_object = generateOutputByObject()
		-- 	},

		-- 	resources = {
		-- 		{
		-- 			resource = "firedBowl",
		-- 			action = {
		-- 				action_type = "inspect",
		-- 				duration = 0.4,
		-- 				duration_without_skill = 15
		-- 			}
		-- 		},
		-- 		{
		-- 			resource_group = "dye_ingredients",
		-- 			action = {
		-- 				action_type = "inspect",
		-- 				duration = 0.4,
		-- 				duration_without_skill = 15
		-- 			}
		-- 		}
		-- 	}
		-- }
	}
}