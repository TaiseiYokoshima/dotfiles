local _, hls, names, funcs = my_hls()

local set_hl = funcs.set_hl


set_hl(names.normal, hls.normal)
set_hl(names.insert, hls.insert)
set_hl(names.visual, hls.visual)
set_hl(names.operator, hls.operator)
set_hl(names.replace, hls.replace)


-- set_hl(names.branch, hls.branch)
-- set_hl(names.insertion, hls.insertion)
-- set_hl(names.deletion, hls.deletion)
-- set_hl(names.change, hls.change)
-- set_hl(names.error, hls.error)
-- set_hl(names.warning, hls.warning)
-- set_hl(names.info, hls.info)
-- set_hl(names.hint, hls.hint)

