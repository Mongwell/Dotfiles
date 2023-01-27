local headlines_ok, headlines = pcall(require, "headlines")
if not headlines_ok then
    return
end

headlines.setup {
    org = {
    },
}
