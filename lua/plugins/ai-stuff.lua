return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      log_level = "INFO",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionCmd" },
    config = function()
      return require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "my_openai",
          },
          inline = {
            adapter = "my_openai",
          },
        },
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              schema = {
                model = {
                  default = "qwen3:8b",
                },
                num_ctx = {
                  default = 20000,
                },
              },
            })
          end,
          my_anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              url = "https://api.metisai.ir/api/v1/wrapper/anthropic/chat/completions",
              env = {
                api_key = "cmd: echo -n $AVANTE_OPENAI_API_KEY", -- optional: if your endpoint is authenticated
              },
              headers = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = "Bearer ${api_key}",
                ["x-api-key"] = "",
              },
              schema = {
                model = {
                  default = "claude-3-opus", -- define llm model to be used
                },
              },
            })
          end,
          my_openai = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://api.metisai.ir/openai/v1", -- optional: default value is ollama url http://127.0.0.1:11434
                api_key = "cmd: echo -n $AVANTE_OPENAI_API_KEY", -- optional: if your endpoint is authenticated
                chat_url = "/chat/completions", -- optional: default value, override if different
                models_endpoint = "/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
              },
              schema = {
                model = {
                  default = "gpt-4.1-mini", -- define llm model to be used
                },
                temperature = {
                  order = 2,
                  mapping = "parameters",
                  type = "number",
                  optional = true,
                  default = 0.8,
                  desc = "What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but not both.",
                  validate = function(n)
                    return n >= 0 and n <= 2, "Must be between 0 and 2"
                  end,
                },
                max_completion_tokens = {
                  order = 3,
                  mapping = "parameters",
                  type = "integer",
                  optional = true,
                  default = nil,
                  desc = "An upper bound for the number of tokens that can be generated for a completion.",
                  validate = function(n)
                    return n > 0, "Must be greater than 0"
                  end,
                },
                stop = {
                  order = 4,
                  mapping = "parameters",
                  type = "string",
                  optional = true,
                  default = nil,
                  desc = "Sets the stop sequences to use. When this pattern is encountered the LLM will stop generating text and return. Multiple stop patterns may be set by specifying multiple separate stop parameters in a modelfile.",
                  validate = function(s)
                    return s:len() > 0, "Cannot be an empty string"
                  end,
                },
                logit_bias = {
                  order = 5,
                  mapping = "parameters",
                  type = "map",
                  optional = true,
                  default = nil,
                  desc = "Modify the likelihood of specified tokens appearing in the completion. Maps tokens (specified by their token ID) to an associated bias value from -100 to 100. Use https://platform.openai.com/tokenizer to find token IDs.",
                  subtype_key = {
                    type = "integer",
                  },
                  subtype = {
                    type = "integer",
                    validate = function(n)
                      return n >= -100 and n <= 100, "Must be between -100 and 100"
                    end,
                  },
                },
              },
            })
          end,
        },
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_result_in_chat = true,
            },
          },
        },
      })
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },
}
