return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        local dap_python = require("dap-python")
        dap_python.setup("/home/jonathan/.local/share/uv/tools/debugpy/bin/python")
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
        vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {desc="Toggle breakpoint"})
        vim.keymap.set('n', '<Leader>da', dap.continue, {desc="Attach to debugger"})
        vim.keymap.set('n', '<Leader>dm', dap_python.test_method, {desc = "Test closest method"})
        vim.keymap.set('n', '<Leader>dui', dapui.toggle, {desc = "Toggle dap ui"})
    end
}
