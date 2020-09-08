function string.split (input, separator)
    print('splitting')
    if sep == nil then
            sep = "%s"
    end
    local t = {}
    for str in string.gmatch(input, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end