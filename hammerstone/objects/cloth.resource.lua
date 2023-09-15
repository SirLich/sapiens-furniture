local data = mjrequire "furniture/data"

local function generateClothOutputByObject()
	local out = {}

	for i, color in ipairs(data.colors) do
		table.insert(out, {
			input = color .. "_dye",
			output = {
				color .. "_cloth"
			}
		})
	end

	return out
end

return {
	description = {
		identifier = "cloth",
		name = "Cloth",
		plural = "Cloth",
		description = "Cloth"
	},
	components = {
		hs_resource = {
			display_object = "red_cloth",
			storage_identifier = "cloth_storage"
		},
		-- hs_craftable = {
		-- 	skill = "grinding",
			
		-- 	build_model = "craftMedicine",
		-- 	build_sequence = "grindingSequence",

		-- 	tool = "grinding",
		-- 	hs_output = {
		-- 		simple_output = {
		-- 			"blue_cloth"
		-- 		}
		-- 		-- output_by_object = generateClothOutputByObject()
		-- 	},

		-- 	resources = {
		-- 		{
		-- 			resource = "dye",
		-- 			action = {
		-- 				action_type = "inspect",
		-- 				duration = 0.4,
		-- 				duration_without_skill = 15
		-- 			}
		-- 		},
		-- 		{
		-- 			resource = "cloth",
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