local home = vim.loop.os_homedir()
local jdtls_root_dir = home .. "/.local/share/nvim/mason/packages/jdtls"
local javacmd = "/usr/lib/jvm/java-17-openjdk/bin/java"

local jdtls = require("jdtls")

-- File types that signify a Java project's root directory.
local root_markers = { "gradlew", "mvnw", ".git", "pom.xml" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local workspace_folder = home .. "/.local/state/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local nnoremap = function (lhs, rhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", lhs, rhs, bufopts)
end

local get_runtime_dir = function ()
  local runtimes = {
    {
      name = "JavaSE-17",
      path = "/usr/lib/jvm/java-17-openjdk",
    },
    --{
    --name = "JavaSE-11",
    --path = home .. "/.asdf/installs/java/corretto-11.0.16.9.1",
    --},
    --{
    --name = "JavaSE-1.8",
    --path = home .. "/.asdf/installs/java/corretto-8.352.08.1",
    --},
  }

  return runtimes
end

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  require("configs.lsp.keymaps").on_attach(client, bufnr);

  -- Java extensions provided by jdtls
  nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
  nnoremap("<Leader>ev", jdtls.extract_variable, bufopts, "Extract variable")
  nnoremap("<Leader>ec", jdtls.extract_constant, bufopts, "Extract constant")
  vim.keymap.set(
    "v",
    "<Leader>em",
    [[<Esc><Cmd>lua require('jdtls').extract_method(true)<Cr>]],
    { noremap = true, silent = true, buffer = bufnr, desc = "Extract method" }
  )
end

local config = {
  flags = {
    debounce_text_changes = 80,
    allow_incremental_sync = true,
  },
  on_attach = on_attach,
  root_dir = root_dir,
  handlers = {},
  init_options = {
    bundles = {}
  },
}


-- cmd is the command that starts the language server. Whatever is placed
-- here is what is passed to the command line to execute jdtls.
-- Note that eclipse.jdt.ls must be started with a Java version of 17 or higher
-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
-- for the full list of options
config.cmd = {
  javacmd,
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-Xmx4g",
  "--add-modules=ALL-SYSTEM",
  "--add-opens",
  "java.base/java.util=ALL-UNNAMED",
  "--add-opens",
  "java.base/java.lang=ALL-UNNAMED",
  "-javaagent:" .. jdtls_root_dir .. "/lombok.jar",
  "-Xbootclasspath/a:" .. jdtls_root_dir .. "/lombok.jar",

  -- The jar file is located where jdtls was installed. This will need to be updated
  -- to the location where you installed jdtls
  "-jar",
  vim.fn.glob(jdtls_root_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar"),

  -- The configuration for jdtls is also placed where jdtls was installed. This will
  -- need to be updated depending on your environment
  "-configuration",
  jdtls_root_dir .. "/config_linux",

  -- Use the workspace_folder defined above to store data for this project
  "-data",
  workspace_folder,
}

config.settings = {
  java = {
    --format = {
    --settings = {
    ----https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
    --url = "/.local/share/eclipse/eclipse-java-google-style.xml",
    --profile = "GoogleStyle",
    --},
    --},
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      filteredTypes = {
        "com.sun.*",
        "io.micrometer.shaded.*",
        "java.awt.*",
        "jdk.*",
        "sun.*",
      },
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      hashCodeEquals = {
        useJava7Objects = true,
      },
      useBlocks = true,
    },
    -- If you are developing in projects with different Java versions, you need
    -- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- And search for `interface RuntimeOption`
    -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
    configuration = {
      runtimes = get_runtime_dir(),
    },
  },
}

-- Finally, start jdtls. This will run the language server using the configuration we specified,
-- setup the keymappings, and attach the LSP client to the current buffer
jdtls.start_or_attach(config)

print("java done")
