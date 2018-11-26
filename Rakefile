# encoding: utf-8

require 'open3'
require 'rainbow'

def run(cmd)
  print "#{cmd} "
  out = ''
  code = Open3.popen2e("#{cmd} 2>&1") do |stdin, stdout, thr|
    stdin.close
    until stdout.eof?
      line = stdout.gets
      out += line
      # puts line
    end
    thr.value.to_i
  end
  if code.zero?
    print "OK\n"
  else
    print "ERROR ##{code}\n"
    puts out
    raise "Failed to run #{cmd}"
  end
end

task default: %i[pdf html]

task :clean do
  FileUtils.rm_rf('target')
end

task :html => [:pdf, :thumbs] do
  Dir['html/**/*'].each do |f|
    FileUtils.cp(f, f.gsub(/^html\//, 'target/'))
  end
  Dir.chdir('target') do
    File.write(
      'index.html',
      File.read('index.html').gsub(
        'PDFs',
        Dir['*.pdf'].sort.map do |p|
          name = File.basename(p, '.pdf')
          title = name.tr('-', ' ').split
            .map(&:capitalize)
            .map { |w| w.length < 4 ? w.upcase : w }
            .join(' ')
          "<li class='thumb'><a href='#{p}'><img src='#{name}.png'/></a><br/>#{title}</li>"
        end.join
      )
    )
    puts 'index.html created'
  end
end

task :thumbs => :pdf do
  Dir.chdir('target') do
    Dir['*.pdf'].each do |pdf|
      png = File.basename(pdf, '.pdf') + '.png'
      if File.exist?(png) && File.mtime(png) > File.mtime(pdf)
        puts "Thumb is up to date: #{png}"
        next
      end
      run("convert -density 300 -quality 100 #{pdf}[0] #{png}")
    end
  end
end

task :pdf do
  FileUtils.mkdir_p('target')
  Dir.chdir('tex') do
    opts = "-shell-escape -halt-on-error -interaction=errorstopmode -output-directory=../target"
    Dir['*.tex'].each do |f|
      next if f.start_with?('_')
      name = File.basename(f, '.tex')
      pdf = "../target/#{name}.pdf"
      if File.exist?(pdf) && File.mtime(pdf) > File.mtime(f)
        puts "PDF is up to date: #{pdf}"
        next
      end
      run("pdflatex #{opts} #{f}")
      if File.exist?("../target/#{name}.bcf")
        run("biber --output-directory=../target #{name}")
        run("pdflatex #{opts} #{f}")
        run("pdflatex #{opts} #{f}")
      else
        puts 'No need to run biber'
      end
      log = File.readlines("../target/#{name}.log")
      colored = []
      errors = []
      log.each do |line|
        ['LaTeX Warning', 'Overfull ', 'Underfull '].each do |prefix|
          if line.start_with?(prefix)
            errors << line
            line = Rainbow(line).red
          end
        end
        colored << line
      end
      unless errors.empty?
        puts(colored.join)
        puts errors.join("\n")
        raise "LaTeX output is not clean for #{f}, there are #{errors.count} errors, see above"
      end
    end
  end
end
