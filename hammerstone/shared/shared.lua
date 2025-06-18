return {
	hs_rebuild_groups = {
		"statue"
	},
	hs_seat_types = {
		{
			identifier = "chair",
			comfort = 0.6,
			nodes = {
				{
					key = "seatNode_1",
					type = "yUpForwardOnly"
				}
			}
		},
		{
			identifier = "carpet",
			comfort = 0.4,
			nodes = {
				{
					key = "seatNode_1",
					type = "yUpFlat"
				}
			}
		}
	},
	hs_resource_groups = {
		{
			identifier = "woodStock_ingredients",
			display_object = "birch_woodStock",
			resources = {
				"branch",
				"log"
			}
		}
	},
	hs_materials = {
		{
			identifier = "wood_bark",
			color = {
				0.4313725,
				0.2313725,
				0.180392
			},
			metal = 0,
			roughness = 1
		},
		{
			identifier = "wood_base",
			color = {
				0.4,0.32,0.25

			},
			metal = 0,
			roughness = 0.8
		},
		{
			identifier = "cloth",
			color = {
				 0.78, 0.356, 0.21
			},
			metal = 0,
			roughness = 0.8
		},
		{
			identifier = "clothDark",
			color = {
				0.78 * 0.8, 0.356 * 0.8, 0.21 * 0.8
			},
			metal = 0,
			roughness = 0.8
		}
	}
}
