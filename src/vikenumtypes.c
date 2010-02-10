
/* Generated data (by glib-mkenums) */

#include "vikenumtypes.h"

/* enumerations from "vikviewport.h" */
#include "vikviewport.h"

GType
vik_viewport_draw_mode_get_type (void)
{
	static GType the_type = 0;
	
	if (the_type == 0)
	{
		static const GEnumValue values[] = {
			{ VIK_VIEWPORT_DRAWMODE_UTM,
			  "VIK_VIEWPORT_DRAWMODE_UTM",
			  "utm" },
			{ VIK_VIEWPORT_DRAWMODE_EXPEDIA,
			  "VIK_VIEWPORT_DRAWMODE_EXPEDIA",
			  "expedia" },
			{ VIK_VIEWPORT_DRAWMODE_MERCATOR,
			  "VIK_VIEWPORT_DRAWMODE_MERCATOR",
			  "mercator" },
			{ 0, NULL, NULL }
		};
		the_type = g_enum_register_static (
				g_intern_static_string ("VikViewportDrawMode"),
				values);
	}
	return the_type;
}


/* Generated data ends here */

