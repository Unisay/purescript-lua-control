-- Regression guard: arrayExtend must apply f to each array suffix.
--
-- The old FFI used table.unpack (undefined in Lua 5.1) and passed the tail
-- as varargs starting one element too far, so extend on arrays errored at
-- runtime. This loads the FFI table directly and checks the suffixes.
local M = assert(dofile("src/Control/Extend.lua"))

-- arrayExtend f xs : position i (1-based) receives f(xs[i..#xs]).
local lengths = M.arrayExtend(function(suffix) return #suffix end)({10, 20, 30})
assert(lengths[1] == 3 and lengths[2] == 2 and lengths[3] == 1,
       "arrayExtend suffix lengths wrong: " .. table.concat(lengths, ","))

print("OK arrayExtend applies f to each array suffix")
