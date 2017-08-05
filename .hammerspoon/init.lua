local home = os.getenv("HOME")

local function readFile(path)
    local f = assert(io.open(path, "r"))
    local data = f:read("*all")
    f:close()

    return data
end

local function readJson(path)
    return hs.json.decode(readFile(path))
end

local function writeFile(path, content)
    local f = assert(io.open(path, "w"))
    local data = f:write(content)
    f:close()
end

local function writeJson(path, content)
    writeFile(path, hs.json.encode(content))
end

local function setProfile(profileName)
    local path = home .. "/.config/karabiner/karabiner.json"
    local config = readJson(path)

    for index, item in ipairs(config.profiles) do
        item.selected = (item.name == profileName)
    end

    writeJson(path, config)
end

local function handleGlobalEvent(name, event, app)
    if event == hs.application.watcher.activated then
        -- hs.alert.show(name)
        local path = "karabiner-switcher.json"
        local config = readJson(path)

        local isExists = false
        for index, item in ipairs(config.rules) do
            if item.targetName == name then
                setProfile(item.profileName)
                isExists = true
            end
        end

        if not isExists then
            setProfile(config.defaultProfileName)
        end
    end
end

watcher = hs.application.watcher.new(handleGlobalEvent)
watcher:start()