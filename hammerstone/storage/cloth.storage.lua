return {
	description = {
		identifier = "cloth_storage"
	},
	components = {
		hs_carry = {
			hs_carry_count = {
				normal = 2,
				limited_ability = 1,
				running = 1
			},
			carry_type = "standard",
			stack_type = "vertical",
			offset = {0, 0.01, 0}
		},
		hs_storage = {
			place_offset = {0.0, -0.01, 0.0},
			display_object = "red_cloth",
			item_size = {0.6, 0.2, 0.6},
			random_rotation_weight = 0.2,
			rotation = {1, 0, 0}
		}
	}
}
