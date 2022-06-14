local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end

vim.opt.rtp:append(vim.fn.stdpath "config" .. "/../astronvim")

for _, source in ipairs {
  "core.utils",
  "core.options",
  "core.plugins",
  "core.autocmds",
  "core.mappings",
  "core.ui",
  "configs.which-key-register",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
  end
end

astronvim.conditional_func(astronvim.user_plugin_opts("polish", nil, false))

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
	max_lines = 1000;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
	ignored_file_types = {};
	show_prediction_strength = true;
})

require('cinnamon').setup {
  extra_keymaps = true,
  scroll_limit = 100,
  default_delay = 1,
}
