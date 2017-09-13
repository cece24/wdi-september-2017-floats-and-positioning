module ::Guard
  class Slides < Plugin

    def initialize(options = {})
      @opts = options.dup
      super
    end

    def run_all
      @opts[:watchers].each { |option| send option.action.call }
    end

    def run_on_modifications(meth)
      send meth.first
    end

    private

    def create_html
      puts 'Creating new slides.html'.green
      header   = File.read('html/header.html')
      markdown = create_slides(File.read('LESSON.md'))
      footer   = File.read('html/footer.html')
      File.write('../../slides/slides.html', header + markdown + footer)
    end

    def create_slides(markdown)
      markdown
        .split('---')
        .keep_if { |slide| slide?(slide) }
        .map     { |slide| remove_for_line(slide) }
        .join("\n\n---")
    end

    def remove_for_line(slide)
      slide
        .split("\n")
        .delete_if { |line| line =~ %r{^for: } }
        .join("\n")
    end

    def slide?(slide)
      lines    = slide.split("\n")
      for_line = lines.find { |line| line =~ %r{^for: } }
      for_line && for_line['slide']
    end

    def create_css
      puts 'Creating new slides.css'.green

      sass_files = Dir.glob('sass/*.sass')

      sass_file_content =
        sass_files.reduce('') do |content, file|
          content += "/*\n\n #{file.sub('sass/', '')} */\n"
          content += File.read(file)
          content += "\n" unless content[-1] == "\n"
          content += "\n"
        end.chomp!

      File.write('../../slides/slides.css', Sass.compile(sass_file_content, syntax: :sass))
    end

    def create_js
      puts 'Creating new slides.js'.green

      js_files = Dir.glob('js/*.js')

      js_file_content =
        js_files.reduce('') do |slide_js, file|
          slide_js += "// #{file.sub('js/', '')}\n"
          slide_js += File.read(file)
          slide_js += "\n" unless slide_js[-1] == "\n"
          slide_js += "\n"
        end.chomp!

      File.write('../../slides/slides.js', js_file_content)
    end

  end
end
