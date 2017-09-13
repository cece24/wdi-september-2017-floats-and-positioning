module ::Guard
  class Alexa < Plugin

    def initialize(options = {})
      @opts = options.dup
      super
    end

    def start
      create_alexa_markdown
    end

    def run_all
      create_alexa_markdown
    end

    def run_on_modifications(meth)
      create_alexa_markdown
    end

    private

    def create_alexa_markdown
      puts 'Creating new ALEXA.md'.green
      alexa_markdown = create_alexa(File.read('LESSON.md'))
      File.write('../ALEXA.md', alexa_markdown)
    end

    def create_alexa(lesson_markdown)
      lesson_markdown
        .split('---')
        .keep_if { |section| alexa?(section) }
        .map     { |section| remove_for_line(section) }
        .map     { |section| remove_slide_specific_lines(section) }
        .join
        .gsub(/\.agenda-time\[\((\d+) min\)\]/, '<small>(\1 min)</small>')
        .gsub(/\[([\w\s]+)\]\(\.\.\/([\w\s\/\.\-]+)\)/, '[\1](\2)')
        .gsub("\n\n\n", "\n\n")
        .gsub("\n\n\n", "\n\n")
        .gsub("\n\n\n", "\n\n")
        .sub(/^\n+/, '') + "\n"
    end

    def remove_for_line(section)
      section
        .split("\n")
        .delete_if { |line| line =~ %r{^for: } }
        .join("\n")
    end

    def alexa?(section)
      section
        .split("\n")
        .find { |line| line =~ %r{^for: } && line['alexa'] }
    end

    def remove_slide_specific_lines(section)
      section
        .split("\n")
        .delete_if { |line| line == '--' }
        .delete_if { |line| line =~ /^(class|name|layout|exclude): / }
        .delete_if { |line| line =~ /^^\.[a-z|-]+\[[\w]+\]$/ }
        .join("\n")
    end

    def remove_initial_linefeeds(section)
      binding.pry
      section
        .split("\n")
        .delete_if { |line| line =~ /^(class|name|layout|exclude): / }
        .delete_if { |line| line == '--' }
        .join("\n")
    end

  end
end