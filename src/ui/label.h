#ifndef __FTDS_UI_LABEL_H__
#define __FTDS_UI_LABEL_H__

#include "../base/bitmap.h"
#include "../base/font.h"
#include "../util/numdef.h"

extern void
label_render_onto(bitmap_t *bmp, font_t *font, u32 color, const char *text, u32 x, u32 y);

#endif
