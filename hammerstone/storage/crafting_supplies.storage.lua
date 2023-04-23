return {
	description = {
		identifier = "woodStock_storage"
	},
	components = {
		hs_carry = {
			hs_carry_count = {
				normal = 4,
				limited_ability = 2,
				running = 1
			},
			carry_type = "small",
			stack_type = "standard",
			offset = {0, 0.01, 0}
		},
		hs_storage = {
			display_object = "aspen_woodStock",
			item_size = {0.2, 0.4, 0.2},
			random_rotation_weight = 0.2,
			rotation = {1, 0, 0}
		}
	}
}
