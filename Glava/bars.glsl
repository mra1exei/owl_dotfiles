/* Note: to only render a single channel, see `setmirror` in `rc.glsl`. */

/* Толщина центральной линии в пикселях */
#define C_LINE 0
/* Ширина каждой полосы в пикселях */
#define BAR_WIDTH 10
/* Ширина каждого зазора между полосами в пикселях */
#define BAR_GAP 4
/* Ширина контура в пикселях (установите значение 0, чтобы отключить рисование контура) */
#define BAR_OUTLINE_WIDTH 0
/* Высота визуализации */
#define AMPLIFY 750
/* Используют ли текущие настройки альфа-канал; включение этого необходимо для правильной работы альфа-канала на X11 с собственной прозрачностью */
#define USE_ALPHA 70
/* Скорость перехода градиента в пикселях */
#define GRADIENT 80
/* Цвет полосы. По умолчанию это сине-белый градиент. */
#define COLOR @fg:mix(#FFFFFF, #FFFFFF, clamp(d / GRADIENT, 0, 1))
/* Цвет контура. По умолчанию это обеспечивает "блестящий" контур на основе цвета полосы. */
#define BAR_OUTLINE @bg:vec4(COLOR.rgb * 1.5, COLOR.a)
/* Направление, на которое обращены стержни, 0 - внутрь, 1 - наружу */
#define DIRECTION 0
/* Следует ли переключать левый/правый аудиобуфер */
#define INVERT 0
/* Визуализация внизу 0, вверху 1. */
#define FLIP 0
/* Визуализация слева 1, справа 1 с параметром FLIP 1 */
#define MIRROR_YX 0
/* Следует ли отключать моно-рендеринг, если в rc.glsl установлено значение #request setmirror true. */
#define DISABLE_MONO 0
