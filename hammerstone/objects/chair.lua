local data = mjrequire "furniture/data"

return {
	description = {
		identifier = "chair"
	},
	components = {
		hs_object = {
			model = "chair"
		},
		hs_buildable = {
			skill = "woodBuilding",
			build_sequence = "clearObjectsAndTerrainSequence",
			classification = "build",
			seat_type = "chair",
			resources = {
				{
					resource = "woodStock",
					count = 6
				}
			},
			model_placeholder = {
				{
					key = "woodStock_1",
					default_model = "chairLeg",
					resource = "woodStock",
					remaps = data:getRemaps("chairLeg", true)
				},
				{
					key = "woodStock_2",
					default_model = "chairLeg",
					resource = "woodStock",
					remaps = data:getRemaps("chairLeg", true)
				},
				{
					key = "woodStock_3",
					default_model = "chairLeg",
					resource = "woodStock",
					remaps = data:getRemaps("chairLeg", true)
				},
				{
					key = "woodStock_4",
					default_model = "chairLeg",
					resource = "woodStock",
					remaps = data:getRemaps("chairLeg", true)
				},
				{
					key = "woodStock_5",
					default_model = "chairSeat",
					resource = "woodStock",
					remaps = data:getRemaps("chairSeat", true)
				},
				{
					key = "woodStock_6",
					default_model = "chairBack",
					resource = "woodStock",
					remaps = data:getRemaps("chairBack", true)
				},
				{
					key = "woodStock_store",
					is_store = true
				}
			}
		}
	}
}
