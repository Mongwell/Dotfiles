local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
    return
end

dressing.setup {
    input = {
        enabled = true,
        insert_only = false,

        mappings = {
            i = {
                ["<C-e>"] = "Close",
            }
        }
    },
    select = {
        enabled = true,
        trim_prompt = false,
    }
}
