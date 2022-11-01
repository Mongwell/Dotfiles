local undotree_config = {
    undotree_WindowLayout = 3,
    undotree_ShortIndicators = 1,
    undotree_SetFocusWhenToggle = 1,
}

for k, v in pairs(undotree_config) do
    vim.g[k] = v
end
