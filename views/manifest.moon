class Manifest extends require "widgets.base"
  content: =>
    h2 ->
      code @manifest.name
      text " Manifest"
      text " "
      span class: "header_count", "(#{@pager\total_items!})"

    @term_snippet "luarocks install --server=#{@manifest\source_url @} <name>"

    @render_pager @pager

    @render_modules @modules

    @render_pager @pager


