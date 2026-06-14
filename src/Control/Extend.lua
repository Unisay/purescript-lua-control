return {
  arrayExtend = (function(f)
    return function(xs)
      local len = #xs
      local result = {}
      for i = 1, len do
        local suffix = {}
        for j = i, len do suffix[j - i + 1] = xs[j] end
        result[i] = f(suffix)
      end
      return result
    end
  end)
}
