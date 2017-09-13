module ::Guard
  class Readme < Plugin

    def initialize(options = {})
      @opts = options.dup
      super
    end

    def start
      create_readme_markdown
    end

    def run_all
      create_readme_markdown
    end

    def run_on_modifications(meth)
      create_readme_markdown
    end

    private

    def create_readme_markdown
      puts 'Creating new README.md'.green
      readme_markdown = create_readme(File.read('LESSON.md'))
      File.write('../../README.md', readme_markdown)
    end

    def create_readme(lesson_markdown)
      lesson_markdown
        .split('---')
        .keep_if { |section| readme?(section) }
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

    def readme?(section)
      section
        .split("\n")
        .find { |line| line =~ %r{^for: } && line['readme'] }
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