return {
    {
        "mfussenegger/nvim-dap",
        keys = function()
            local function dap(name)
                return function()
                    require("dap")[name]()
                end
            end

            return {
                { "<leader>dc", dap("continue"), desc = "continue" },
                { "<leader>ds", dap("step_into"), desc = "step into" },
                { "<leader>dn", dap("step_over"), desc = "step over (next)" },
                { "<leader>df", dap("step_out"), desc = "step out (finish)" },
                { "<leader>db", dap("toggle_breakpoint"), desc = "toggle breakpoint" },
                {
                    "<leader>do",
                    function()
                        vim.ui.input({ prompt = "Condition: " }, function(input)
                            if input == nil then
                                return
                            end
                            require("dap").set_breakpoint(input)
                        end)
                    end,
                    desc = "set conditional breakpoint",
                },
                { "<leader>dl", dap("clear_breakpoints"), desc = "clear breakpoints" },
                { "<leader>dq", dap("terminate"), desc = "quit" },
            }
        end,
        config = function()
            local dap = require("dap")

            local signs = { DapBreakpoint = "", DapBreakpointCondition = "", DapLogPoint = "" }
            for hl, icon in pairs(signs) do
                vim.fn.sign_define(hl, { text = icon, texthl = "Error" })
            end

            -- Adapters
            dap.adapters["pwa-node"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    args = { "/home/teto/js-debug/src/dapDebugServer.js", "${port}" },
                },
            }

            -- Configuration
            dap.configurations.javascript = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()

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
        end,
    },
}
